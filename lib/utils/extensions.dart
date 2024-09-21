import 'package:flutter/material.dart';

extension StringExtensions on String? {
  Color colorify() => Color(int.parse("0xFF${this ?? 'FFFFFF'}"));

  TextAlign textAlign() {
    if (this == 'center') return TextAlign.center;
    if (this == 'right') return TextAlign.right;
    return TextAlign.left;
  }
}

extension SnackbarExtensions on BuildContext {
  showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }
}

extension HexColor on Color {
  String toHex() => '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
