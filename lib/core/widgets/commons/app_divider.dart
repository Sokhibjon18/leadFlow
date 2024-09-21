import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.margin = const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
    this.thickness = 1,
    this.color = const Color(0xFFF0F2F5),
  });

  final EdgeInsetsGeometry margin;
  final double thickness;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: thickness,
      width: double.infinity,
      color: color,
    );
  }
}
