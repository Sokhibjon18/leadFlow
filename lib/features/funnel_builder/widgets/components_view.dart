import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lead_flow/core/widgets/app_divider.dart';
import 'package:lead_flow/data/models/button_params.dart';
import 'package:lead_flow/data/models/image_view_params.dart';
import 'package:lead_flow/data/models/input_view_params.dart';
import 'package:lead_flow/data/models/selection_params.dart';
import 'package:lead_flow/data/models/subscription_params.dart';
import 'package:lead_flow/data/models/success_view_params.dart';
import 'package:lead_flow/data/models/text_view_params.dart';
import 'package:lead_flow/features/funnel_builder/dialogs/button_dialog.dart';
import 'package:lead_flow/features/funnel_builder/dialogs/image_dialog.dart';
import 'package:lead_flow/features/funnel_builder/dialogs/input_view_dialog.dart';
import 'package:lead_flow/features/funnel_builder/dialogs/price_dialog.dart';
import 'package:lead_flow/features/funnel_builder/dialogs/selection_dialog.dart';
import 'package:lead_flow/features/funnel_builder/dialogs/success_dialog.dart';
import 'package:lead_flow/features/funnel_builder/dialogs/text_dialog.dart';
import 'package:lead_flow/features/funnel_builder/domain/funnel_builder_cubit.dart';
import 'package:lead_flow/features/views/continue_button.dart';
import 'package:lead_flow/features/views/image_view.dart';
import 'package:lead_flow/features/views/input_view.dart';
import 'package:lead_flow/features/views/multi_select_view.dart';
import 'package:lead_flow/features/views/price_view.dart';
import 'package:lead_flow/features/views/single_select_view.dart';
import 'package:lead_flow/features/views/success_view.dart';
import 'package:lead_flow/features/views/text_view.dart';

class ComponentsView extends StatelessWidget {
  const ComponentsView({super.key});

  showParamDialog(BuildContext context, Widget dialogWidget) {
    showDialog(
      context: context,
      builder: (_) {
        return BlocProvider.value(
          value: BlocProvider.of<FunnelBuilderCubit>(context),
          child: dialogWidget,
        );
      },
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _addWidget(
          onTap: () => showParamDialog(context, const ButtonDialog()),
          child: ContinueButton(
            onPressed: () {},
            buttonParams: ButtonParams(Colors.white, Colors.black),
          ),
        ),
        const AppDivider(),
        _addWidget(
          onTap: () => showParamDialog(context, const ImageDialog()),
          child: ImageView(
            imageParams: ImageViewParams(
              imageLink: 'assets/images/example_1.jpeg',
            ),
          ),
        ),
        const AppDivider(),
        _addWidget(
          onTap: () => showParamDialog(context, const InputViewDialog()),
          child: InputView(
            inputViewParams: InputViewParams(
              hint: 'email',
              textColor: Colors.black,
              backgroundColor: Colors.white,
            ),
          ),
        ),
        const AppDivider(),
        // _addWidget(child: MultiSelectView(onSelect: (value) {})),
        const AppDivider(),
        _addWidget(
          onTap: () => showParamDialog(context, const PriceDialog()),
          child: PriceView(params: [
            SubscriptionButtonParams(
                'Elementary', '', '', '\$25', 'month', '', 'Foydali', true, 'FF1744'),
            SubscriptionButtonParams('Starter', '', '', '\$15', 'month', '', '', false, 'FF1744')
          ]),
        ),
        const AppDivider(),
        _addWidget(
          onTap: () => showParamDialog(context, const SelectionDialog()),
          child: SingleSelectView(
            onSelect: (value) {},
            selectionParam: SelectionParams(
              selectionColor: Colors.redAccent,
              size: 16,
              textOptions: [
                '😊 Hello, how are you?',
                '✅ What is the plans?',
                '😜 Bye, see you?',
              ],
            ),
          ),
        ),
        // const AppDivider(),
        // _addWidget(
        //   onTap: () {},
        //   child: MultiSelectView(
        //     onSelect: (value) {},
        //     selectionParam: SelectionParams(
        //       selectionColor: Colors.redAccent,
        //       size: 16,
        //       textOptions: [
        //         '❤️ Bye, see you?',
        //         '🥾 What is the plans?',
        //         '🔥 Hello, how are you?',
        //       ],
        //     ),
        //   ),
        // ),
        const AppDivider(),
        _addWidget(
          onTap: () => showParamDialog(context, const SuccessDialog()),
          child: SuccessView(
            params: SuccessViewParams(
              appName: 'Your app name',
              appUrl: 'https://mail.google.com/mail/u/0/#inbox',
              buttonColor: Colors.deepPurple,
            ),
          ),
        ),
        const AppDivider(),
        _addWidget(
          onTap: () => showParamDialog(context, const TextDialog()),
          child: TextView(params: TextViewParam(text: 'Text View')),
        ),
        const AppDivider(),
      ],
    );
  }

  Widget _addWidget({void Function()? onTap, required Widget child}) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(child: child),
      ],
    );
  }
}
