import 'package:flutter/material.dart';
import 'package:lead_flow/data/models/component_params.dart';

class SuccessViewParams implements ComponentParams {
  final String appName;
  final String appUrl;
  final Color buttonColor;

  SuccessViewParams({
    required this.appName,
    required this.appUrl,
    required this.buttonColor,
  });
}
