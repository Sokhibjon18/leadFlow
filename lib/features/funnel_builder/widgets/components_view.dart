import 'package:flutter/material.dart';
import 'package:lead_flow/core/widgets/app_divider.dart';
import 'package:lead_flow/features/funnel_builder/dialogs/button_dialog.dart';
import 'package:lead_flow/features/funnel_builder/dialogs/image_dialog.dart';
import 'package:lead_flow/features/funnel_builder/dialogs/input_view_dialog.dart';
import 'package:lead_flow/features/funnel_builder/dialogs/price_dialog.dart';
import 'package:lead_flow/features/funnel_builder/dialogs/selection_dialog.dart';
import 'package:lead_flow/features/funnel_builder/dialogs/success_dialog.dart';
import 'package:lead_flow/features/funnel_builder/dialogs/text_dialog.dart';
import 'package:lead_flow/features/views/continue_button.dart';
import 'package:lead_flow/features/views/image_view.dart';
import 'package:lead_flow/features/views/input_view.dart';
import 'package:lead_flow/features/views/payment_view.dart';
import 'package:lead_flow/features/views/price_view.dart';
import 'package:lead_flow/features/views/selection_item_view.dart';
import 'package:lead_flow/features/views/success_view.dart';
import 'package:lead_flow/features/views/text_view.dart';

class ComponentsView extends StatelessWidget {
  const ComponentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _addWidget(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const ButtonDialog(),
              barrierDismissible: false,
            );
          },
          child: ContinueButton(onPressed: () {}),
        ),
        const AppDivider(),
        _addWidget(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const ImageDialog(),
              barrierDismissible: false,
            );
          },
          child: const ImageView(),
        ),
        const AppDivider(),
        _addWidget(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const InputViewDialog(),
              barrierDismissible: false,
            );
          },
          child: const InputView(),
        ),
        const AppDivider(),
        _addWidget(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const PriceDialog(),
              barrierDismissible: false,
            );
          },
          child: const PriceView(),
        ),
        const AppDivider(),
        _addWidget(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const SelectionDialog(),
              barrierDismissible: false,
            );
          },
          child: const SelectionItemView(isCheckable: true),
        ),
        // const AppDivider(),
        // _addWidget(
        //   onTap: () {
        //     showDialog(context: context, builder: (context) => const SelectionDialog());
        //   },
        //   child: SingleSelectView(onSelect: (value) {}),
        // ),
        const AppDivider(),
        _addWidget(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const SuccessDialog(),
              barrierDismissible: false,
            );
          },
          child: const SuccessView(),
        ),
        const AppDivider(),
        _addWidget(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const TextDialog(),
              barrierDismissible: false,
            );
          },
          child: const TextView(),
        ),
        const AppDivider(),
        _addWidget(
          onTap: () {},
          child: PaymentView(nextScreen: () {}),
        ),
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
