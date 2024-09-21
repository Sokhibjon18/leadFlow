import 'package:flutter/material.dart';
import 'package:lead_flow/core/widgets/commons/app_divider.dart';
import 'package:lead_flow/features/views/continue_button.dart';
import 'package:lead_flow/features/views/image_view.dart';
import 'package:lead_flow/features/views/input_view.dart';
import 'package:lead_flow/features/views/price_view.dart';
import 'package:lead_flow/features/views/selection_item_view.dart';
import 'package:lead_flow/features/views/single_select_view.dart';
import 'package:lead_flow/features/views/success_view.dart';
import 'package:lead_flow/features/views/text_view.dart';

class ComponentsView extends StatelessWidget {
  const ComponentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _addWidget(
          onTap: () {},
          child: ContinueButton(onPressed: () {}),
        ),
        const AppDivider(),
        _addWidget(
          onTap: () {},
          child: const ImageView(),
        ),
        const AppDivider(),
        _addWidget(
          onTap: () {},
          child: const InputView(),
        ),
        const AppDivider(),
        // _addWidget(child: MultiSelectView(onSelect: (value) {})),
        const AppDivider(),
        _addWidget(
          onTap: () {},
          child: const PriceView(),
        ),
        const AppDivider(),
        _addWidget(
          onTap: () {},
          child: const SelectionItemView(isCheckable: true),
        ),
        const AppDivider(),
        _addWidget(
          onTap: () {},
          child: SingleSelectView(onSelect: (value) {}),
        ),
        const AppDivider(),
        _addWidget(
          onTap: () {},
          child: const SuccessView(),
        ),
        const AppDivider(),
        _addWidget(
          onTap: () {},
          child: const TextView(),
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
