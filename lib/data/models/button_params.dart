import 'package:flutter/material.dart';
import 'package:lead_flow/data/models/component_params.dart';

class ButtonParams implements ComponentParams{
  final Color textColor;
  final Color backgroundColor;

  ButtonParams(this.textColor, this.backgroundColor);
}