import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lead_flow/core/widgets/base_dialog.dart';
import 'package:lead_flow/core/widgets/common_text_filed.dart';
import 'package:lead_flow/data/models/selection_params.dart';
import 'package:lead_flow/features/funnel_builder/widgets/color_selection.dart';

class SelectionDialog extends StatefulWidget {
  const SelectionDialog({super.key});

  @override
  State<SelectionDialog> createState() => _SelectionDialogState();
}

class _SelectionDialogState extends State<SelectionDialog> {
  bool singleSelect = true;
  Color selectionColor = Colors.blueAccent;
  Color textColor = Colors.black;
  List<String> textOptions = ['Option 1', 'Option 2', 'Option 3'];

  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      width: 200,
      height: 480,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selection color for button',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF2C2C2C)),
          ),
          const SizedBox(height: 2),
          ColorSelection(
            colors: const [Colors.blue, Colors.white, Colors.green, Colors.black],
            onColorSelected: (color) {
              selectionColor = color;
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Select a Text color',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF2C2C2C)),
          ),
          const SizedBox(height: 2),
          ColorSelection(
            colors: const [Colors.black, Colors.white],
            onColorSelected: (color) {
              textColor = color;
            },
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const Text(
                'Enable multi selection',
                style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF2C2C2C)),
              ),
              Checkbox(
                value: isSelected,
                onChanged: (value) {
                  setState(() {
                    isSelected = value ?? isSelected;
                  });
                  singleSelect = !(value ?? false);
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Enter the texts',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF2C2C2C)),
          ),
          const SizedBox(height: 2),
          CommonTextField(
            hint: 'First text',
            onChanged: (value) {
              textOptions[0] = value;
            },
          ),
          const SizedBox(height: 2),
          CommonTextField(
            hint: 'Second text',
            onChanged: (value) {
              textOptions[1] = value;
            },
          ),
          const SizedBox(height: 2),
          CommonTextField(
            hint: 'Third text',
            onChanged: (value) {
              textOptions[2] = value;
            },
          ),
        ],
      ),
      onCreate: () {
        SelectionParams selectionParams = SelectionParams(
          textColor: textColor,
          singleSelect: singleSelect,
          selectionColor: selectionColor,
          textOptions: textOptions,
        );
        log(selectionParams.toString());
      },
    );
  }
}
