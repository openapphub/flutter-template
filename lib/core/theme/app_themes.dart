import 'package:flutter/material.dart';
import 'text_styles.dart';
import 'color_schemes.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    textTheme: TextStyles.textTheme,
    // Add other theme properties
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    textTheme: TextStyles.textTheme,
    // Add other theme properties
  );
}
