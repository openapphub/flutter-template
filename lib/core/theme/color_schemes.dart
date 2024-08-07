import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFFFFFFFF), // 白色
  onPrimary: Color(0xFF000000),
  primaryContainer: Color(0xFFF9F9F9), // 浅灰色
  onPrimaryContainer: Color(0xFF1C1B1F),
  secondary: Color(0xFFE0E0E0), // 浅灰色
  onSecondary: Color(0xFF000000),
  secondaryContainer: Color(0xFFFFFFFF), // 白色
  onSecondaryContainer: Color(0xFF1C1B1F),
  tertiary: Color(0xFFB0BEC5), // 浅蓝灰色
  onTertiary: Color(0xFF000000),
  tertiaryContainer: Color(0xFFECEFF1), // 更浅的蓝灰色
  onTertiaryContainer: Color(0xFF1C1B1F),
  error: Color(0xFFB00020),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFCD8DF),
  onErrorContainer: Color(0xFF65001E),
  surface: Color(0xFFFFFBFE),
  onSurface: Color(0xFF1C1B1F), // 设置背景颜色
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF424242), // 深灰色
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF616161), // 更深的灰色
  onPrimaryContainer: Color(0xFFE0E0E0),
  secondary: Color(0xFF757575), // 深灰色
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFB0BEC5), // 浅蓝灰色
  onSecondaryContainer: Color(0xFF1C1B1F),
  tertiary: Color(0xFFB0BEC5), // 浅蓝灰色
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFF37474F), // 深蓝灰色
  onTertiaryContainer: Color(0xFFECEFF1),
  error: Color(0xFFCF6679),
  onError: Color(0xFF000000),
  errorContainer: Color(0xFF93000A),
  onErrorContainer: Color(0xFFFFDAD6),
  surface: Color(0xFF121212),
  onSurface: Color(0xFFE1E1E1),
);
