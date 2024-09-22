import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lead_flow/core/widgets/base_dialog.dart';
import 'package:lead_flow/core/widgets/common_text_filed.dart';
import 'package:lead_flow/data/models/success_view_params.dart';
import 'package:lead_flow/features/funnel_builder/domain/funnel_builder_cubit.dart';
import 'package:lead_flow/features/funnel_builder/widgets/color_selection.dart';

class SuccessDialog extends StatefulWidget {
  const SuccessDialog({super.key});

  @override
  State<SuccessDialog> createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {
  String appName = 'App Name';
  String appUrl = 'App URL';
  Color buttonColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      width: 200,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Enter the Application name',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF2C2C2C)),
          ),
          const SizedBox(height: 2),
          CommonTextField(
            hint: 'App name',
            onChanged: (value) {
              appName = value;
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Select a Button color',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF2C2C2C)),
          ),
          const SizedBox(height: 2),
          ColorSelection(
            colors: const [Colors.blue, Colors.white, Colors.green, Colors.black],
            onColorSelected: (color) {
              buttonColor = color;
            },
          ),
        ],
      ),
      onCreate: () {
        SuccessViewParams successViewParams = SuccessViewParams(
          appName: appName,
          appUrl: appUrl,
          buttonColor: buttonColor,
        );
        context.read<FunnelBuilderCubit>().addComponentParams(successViewParams);
      },
    );
  }
}
