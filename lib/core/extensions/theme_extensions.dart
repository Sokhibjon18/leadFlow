import 'package:flutter/cupertino.dart';
import 'package:web_funnel/core/di/injection.dart';
import 'package:web_funnel/core/model/default_theme_colors/default_theme_colors.dart';

extension ThemeContextExtensions on BuildContext {
  DefaultThemeColors get colors => getIt<DefaultThemeColors>();
}
