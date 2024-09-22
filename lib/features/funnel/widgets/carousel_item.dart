import 'package:flutter/material.dart';
import 'package:lead_flow/data/dto/screen_dto.dart';
import 'package:lead_flow/data/models/button_params.dart';
import 'package:lead_flow/data/models/component_params.dart';
import 'package:lead_flow/data/models/image_view_params.dart';
import 'package:lead_flow/data/models/input_view_params.dart';
import 'package:lead_flow/data/models/payment_params.dart';
import 'package:lead_flow/data/models/selection_params.dart';
import 'package:lead_flow/data/models/subscription_params.dart';
import 'package:lead_flow/data/models/success_view_params.dart';
import 'package:lead_flow/data/models/text_view_params.dart';
import 'package:lead_flow/features/views/continue_button.dart';
import 'package:lead_flow/features/views/image_view.dart';
import 'package:lead_flow/features/views/input_view.dart';
import 'package:lead_flow/features/views/multi_select_view.dart';
import 'package:lead_flow/features/views/payment_view.dart';
import 'package:lead_flow/features/views/price_view.dart';
import 'package:lead_flow/features/views/single_select_view.dart';
import 'package:lead_flow/features/views/success_view.dart';
import 'package:lead_flow/features/views/text_view.dart';

class CarouselItem extends StatelessWidget {
  CarouselItem({
    super.key,
    required this.screen,
    required this.nextPressed,
    required this.appName,
  });

  final ScreenDTO screen;
  final String appName;
  final List<String> forms = [];
  final Function(List<String>) nextPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            screen.components.length,
            (index) {
              var param = screen.components[index].toParams(appName);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: getCorrespondingView(param),
              );
            },
          ),
        ),
      ),
    );
  }

  MainAxisAlignment getMainAxisAlignment(String? alignment) {
    if (alignment == null) return MainAxisAlignment.start;
    switch (alignment) {
      case 'start':
        return MainAxisAlignment.start;
      case 'end':
        return MainAxisAlignment.end;
      case 'center':
        return MainAxisAlignment.center;
      case 'spaceAround':
        return MainAxisAlignment.spaceAround;
      case 'spaceBetween':
        return MainAxisAlignment.spaceBetween;
      case 'spaceEvenly':
        return MainAxisAlignment.spaceEvenly;
      default:
        return MainAxisAlignment.start;
    }
  }

  Widget getCorrespondingView(ComponentParams params) {
    switch (params.runtimeType) {
      case == TextViewParam:
        return TextView(params: params as TextViewParam);
      case == SelectionParams:
        return (params as SelectionParams).singleSelect
            ? SingleSelectView(
                selectionParam: params,
                onSelect: (String value) {
                  forms.add(screen.question ?? '');
                },
              )
            : MultiSelectView(
                selectionParam: params,
                onSelect: (List<String> values) {
                  forms.add(screen.question ?? '');
                },
              );
      case == ImageViewParams:
        return ImageView(imageParams: params as ImageViewParams);
      case == InputViewParams:
        return InputView(
          inputViewParams: params as InputViewParams,
          onChanged: (value) {
            forms.add(screen.question ?? '');
          },
        );
      case == SuccessViewParams:
        return SuccessView(params: params as SuccessViewParams);
      case == ButtonParams:
        return ContinueButton(
          onPressed: () => nextPressed(forms),
          buttonParams: params as ButtonParams,
        );
      case == SubscriptionParams:
        return PriceView(params: (params as SubscriptionParams).buttonParams);
      case == PaymentParams:
        return PaymentView(nextScreen: nextPressed);
      default:
        return const SizedBox();
    }
  }
}
