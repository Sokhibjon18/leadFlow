import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lead_flow/core/widgets/base_dialog.dart';
import 'package:lead_flow/core/widgets/common_text_filed.dart';
import 'package:lead_flow/data/models/text_view_params.dart';

class TextDialog extends StatefulWidget {
  const TextDialog({super.key});

  @override
  State<TextDialog> createState() => _TextDialogState();
}

class _TextDialogState extends State<TextDialog> {
  String text = 'Text';
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
              text = value;
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
      onCreate: () {
        TextViewParam textViewParam = TextViewParam(text: text);
        log(textViewParam.toString());
      },
    );
  }
}
