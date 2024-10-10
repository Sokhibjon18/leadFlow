import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class StaticColors {
  static const transparent = Colors.transparent;
  static const nero = Color(0xFF1E1E1E);
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
}

@singleton
class DefaultThemeColors {
  final transparent = StaticColors.transparent;
  final window = StaticColors.nero;
  final black = StaticColors.black;
  final white = StaticColors.white;
  final phoneBorder = StaticColors.black.withOpacity(0.2);
}
