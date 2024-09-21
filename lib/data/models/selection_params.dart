import 'package:flutter/material.dart';
import 'package:lead_flow/data/models/component_params.dart';

class SelectionParams implements ComponentParams {
  final Color selectionColor;
  final Color backgroundColor;
  final Color textColor;
  final TextAlign textAlign;
  final double size;
  final List<String> textOptions;
  final bool singleSelect;

  SelectionParams({
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.textAlign = TextAlign.start,
    this.singleSelect = true,
    required this.selectionColor,
    required this.size,
    required this.textOptions,
  });
}
