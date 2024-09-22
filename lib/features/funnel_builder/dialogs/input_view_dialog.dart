import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lead_flow/core/widgets/base_dialog.dart';
import 'package:lead_flow/core/widgets/common_text_filed.dart';
import 'package:lead_flow/data/models/input_view_params.dart';
import 'package:lead_flow/features/funnel_builder/domain/funnel_builder_cubit.dart';
import 'package:lead_flow/features/funnel_builder/widgets/color_selection.dart';

class InputViewDialog extends StatefulWidget {
  const InputViewDialog({super.key});

  @override
  State<InputViewDialog> createState() => _InputViewDialogState();
}

class _InputViewDialogState extends State<InputViewDialog> {
  String hint = 'Enter text';
  Color textColor = Colors.white;
  Color backgroundColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      width: 200,
      height: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Enter a hint',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF2C2C2C)),
          ),
          const SizedBox(height: 2),
          CommonTextField(
            hint: 'Hint text',
            onChanged: (value) {
              hint = value;
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
          const Text(
            'Select a Background color',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF2C2C2C)),
          ),
          const SizedBox(height: 2),
          ColorSelection(
            colors: const [Colors.blue, Colors.white, Colors.green, Colors.black],
            onColorSelected: (color) {
              backgroundColor = color;
            },
          ),
        ],
      ),
      onCreate: () {
        InputViewParams inputViewParams = InputViewParams(
          hint: hint,
          textColor: textColor,
          backgroundColor: backgroundColor,
        );
        context.read<FunnelBuilderCubit>().addComponentParams(inputViewParams);
      },
    );
  }
}
