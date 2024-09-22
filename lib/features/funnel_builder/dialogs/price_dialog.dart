import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lead_flow/core/widgets/base_dialog.dart';
import 'package:lead_flow/core/widgets/common_text_filed.dart';
import 'package:lead_flow/data/models/subscription_params.dart';
import 'package:lead_flow/features/funnel_builder/domain/funnel_builder_cubit.dart';
import 'package:lead_flow/features/funnel_builder/widgets/color_selection.dart';
import 'package:lead_flow/utils/extensions.dart';

class PriceDialog extends StatefulWidget {
  const PriceDialog({super.key});

  @override
  State<PriceDialog> createState() => _PriceDialogState();
}

class _PriceDialogState extends State<PriceDialog> {
  String title = 'Title';
  String priceId = 'Price id';
  String oldPrice = 'old price';
  String price = 'price';
  String unit = 'unit';
  String unitInterval = 'interval';
  String attention = 'attention';
  bool selected = false;
  String selectionColor = Colors.grey.shade300.toHex();
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      width: 300,
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _textInputField(
            hint: 'Title',
            title: 'Enter title',
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 24),
          _textInputField(
            title: 'Enter old price',
            hint: 'Old price',
            onChanged: (value) {
              oldPrice = value;
            },
          ),
          const SizedBox(height: 24),
          _textInputField(
            title: 'Enter price',
            hint: 'Price',
            onChanged: (value) {
              price = value;
            },
          ),
          const SizedBox(height: 24),
          _textInputField(
            title: 'Enter unit',
            hint: 'Unit',
            onChanged: (value) {
              unit = value;
            },
          ),
          const SizedBox(height: 24),
          _textInputField(
            title: 'Enter unit interval',
            hint: 'Unit interval',
            onChanged: (value) {
              unitInterval = value;
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Selection color for button',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF2C2C2C)),
          ),
          const SizedBox(height: 2),
          ColorSelection(
            colors: const [Colors.blue, Colors.white, Colors.green, Colors.black],
            onColorSelected: (color) {
              selectionColor = color.toHex();
            },
          ),
        ],
      ),
      onCreate: () {
        SubscriptionButtonParams subscriptionButtonParams = SubscriptionButtonParams(title, priceId,
            oldPrice, price, unit, unitInterval, attention, selected, selectionColor);
        SubscriptionParams subscriptionParams = SubscriptionParams([subscriptionButtonParams]);
        context.read<FunnelBuilderCubit>().addComponentParams(subscriptionParams);
      },
    );
  }

  Widget _textInputField(
      {required String hint, required String title, void Function(String)? onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF2C2C2C)),
        ),
        const SizedBox(height: 2),
        CommonTextField(
          hint: hint,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
