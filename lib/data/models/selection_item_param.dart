import 'package:flutter/material.dart';
import 'package:lead_flow/data/models/component_params.dart';

class SelectionItemParam implements ComponentParams {
  final bool isSelected;
  final Function(String, int)? onSelect;
  final Color? selectionColor;
  final int index;
  final Color backgroundColor;
  final Color textColor;
  final TextAlign textAlign;
  final String text;
  final double size;
  final bool isBold;
  final String? imagePath;
  final String? icon;

  SelectionItemParam({
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.textAlign = TextAlign.start,
    this.onSelect,
    this.selectionColor,
    this.isSelected = false,
    this.index = 0,
    this.isBold = false,
    this.imagePath,
    this.icon,
    required this.text,
    required this.size,
  });
}
