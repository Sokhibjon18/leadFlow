import 'package:flutter/material.dart';
import 'package:lead_flow/data/models/component_params.dart';

class TextViewParam implements ComponentParams {
  final Color textColor;
  final TextAlign textAlign;
  final String text;
  final double size;
  final bool isBold;
  final String? icon;

  TextViewParam( {
    this.textColor = Colors.black,
    this.textAlign = TextAlign.center,
    this.isBold = false,
    this.size = 16,
    this.icon,
    required this.text,
  });
}
