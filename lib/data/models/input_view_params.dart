import 'package:flutter/material.dart';
import 'package:lead_flow/data/models/component_params.dart';

class InputViewParams implements ComponentParams {
  final String hint;
  final Color textColor;
  final Color backgroundColor;

  InputViewParams({
    required this.hint,
    required this.textColor,
    required this.backgroundColor,
  });

  @override
  String toString() {
    return 'InputViewParams(hint: $hint, textColor: $textColor, backgroundColor: $backgroundColor)';
  }
}
