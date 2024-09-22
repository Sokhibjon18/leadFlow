import 'package:flutter/material.dart';
import 'package:lead_flow/data/models/component_params.dart';
import 'package:lead_flow/data/models/selection_item_param.dart';

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
    this.size = 16,
    this.singleSelect = true,
    required this.selectionColor,
    required this.textOptions,
  });

  SelectionItemParam toSelectionItemParam({
    required String text,
    required double size,
    required bool isSelected,
    required Function(String, int) onSelect,
    required int index,
    String? imagePath,
    String? icon,
  }) =>
      SelectionItemParam(
          text: text,
          size: size,
          textColor: textColor,
          textAlign: textAlign,
          backgroundColor: backgroundColor,
          onSelect: onSelect,
          isSelected: isSelected,
          selectionColor: selectionColor,
          index: index,
          imagePath: imagePath,
          icon: icon);

  @override
  String toString() {
    return 'SelectionParams(selectionColor: $selectionColor, backgroundColor: $backgroundColor, textColor: $textColor, textAlign: $textAlign, size: $size, textOptions: $textOptions, singleSelect: $singleSelect)';
  }
}
