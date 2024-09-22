import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lead_flow/data/models/button_params.dart';
import 'package:lead_flow/data/models/component_params.dart';
import 'package:lead_flow/data/models/image_view_params.dart';
import 'package:lead_flow/data/models/input_view_params.dart';
import 'package:lead_flow/data/models/payment_params.dart';
import 'package:lead_flow/data/models/selection_params.dart';
import 'package:lead_flow/data/models/subscription_params.dart';
import 'package:lead_flow/data/models/success_view_params.dart';
import 'package:lead_flow/data/models/text_view_params.dart';
import 'package:lead_flow/features/funnel_builder/domain/funnel_builder_cubit.dart';
import 'package:lead_flow/features/views/continue_button.dart';
import 'package:lead_flow/features/views/image_view.dart';
import 'package:lead_flow/features/views/input_view.dart';
import 'package:lead_flow/features/views/multi_select_view.dart';
import 'package:lead_flow/features/views/price_view.dart';
import 'package:lead_flow/features/views/single_select_view.dart';
import 'package:lead_flow/features/views/success_view.dart';
import 'package:lead_flow/features/views/text_view.dart';

class PhoneParamBuilder extends StatefulWidget {
  const PhoneParamBuilder({super.key});

  @override
  State<PhoneParamBuilder> createState() => _PhoneParamBuilderState();
}

class _PhoneParamBuilderState extends State<PhoneParamBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FunnelBuilderCubit, FunnelBuilderState>(
      builder: (context, state) {
        log(state.toString());
        return state.maybeMap(
          currentScreenParams: (paramsState) {
            return Expanded(
              child: Container(
                padding: const EdgeInsets.all(24),
                width: 390,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFFC0C0C0), width: 2),
                ),
                child: Column(
                  children: List.generate(
                    paramsState.params.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: getCorrespondingView(paramsState.params[index]),
                    ),
                  ),
                ),
              ),
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }

  Widget getCorrespondingView(ComponentParams params) {
    switch (params.runtimeType) {
      case == TextViewParam:
        return TextView(params: params as TextViewParam);
      case == SelectionParams:
        return (params as SelectionParams).singleSelect
            ? SingleSelectView(
                selectionParam: params,
                onSelect: (String value) {},
              )
            : MultiSelectView(
                selectionParam: params,
                onSelect: (List<String> values) {},
              );
      case == ImageViewParams:
        return ImageView(imageParams: params as ImageViewParams);
      case == InputViewParams:
        return InputView(
          inputViewParams: params as InputViewParams,
          onChanged: (value) {},
        );
      case == SuccessViewParams:
        return SuccessView(params: params as SuccessViewParams);
      case == ButtonParams:
        return ContinueButton(
          onPressed: () => {},
          buttonParams: params as ButtonParams,
        );
      case == SubscriptionParams:
        return PriceView(params: (params as SubscriptionParams).buttonParams);
      default:
        return const SizedBox();
    }
  }
}
