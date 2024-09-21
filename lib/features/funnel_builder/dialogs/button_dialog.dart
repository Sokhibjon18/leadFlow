import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lead_flow/core/widgets/base_dialog.dart';
import 'package:lead_flow/data/models/button_params.dart';
import 'package:lead_flow/features/funnel_builder/widgets/color_selection.dart';

class ButtonDialog extends StatefulWidget {
  const ButtonDialog({super.key});

  @override
  State<ButtonDialog> createState() => _ButtonDialogState();
}

class _ButtonDialogState extends State<ButtonDialog> {
  Color backgroundColor = Colors.green;
  Color textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      height: 250,
      width: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select a Button color',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF2C2C2C)),
          ),
          const SizedBox(height: 2),
          ColorSelection(
            onColorSelected: (color) {
              backgroundColor = color;
            },
            colors: const [Colors.white, Colors.blue, Colors.green, Colors.black],
          ),
          const SizedBox(height: 24),
          const Text(
            'Select a Text color',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF2C2C2C)),
          ),
          const SizedBox(height: 2),
          ColorSelection(
            onColorSelected: (color) {
              textColor = color;
            },
            colors: const [Colors.white, Colors.black],
          )
        ],
      ),
      onCreate: () {
        ButtonParams buttonParams = ButtonParams(textColor, backgroundColor);
        log(buttonParams.toString());
      },
    );
  }
}
