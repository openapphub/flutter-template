import 'package:flutter/material.dart';
import 'text_styles.dart';
import 'color_schemes.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    textTheme: TextStyles.textTheme,
    primaryColor: lightColorScheme.primary,
    scaffoldBackgroundColor: lightColorScheme.primaryContainer,
    appBarTheme: AppBarTheme(
      backgroundColor: lightColorScheme.primary,
      titleTextStyle: TextStyles
          .textTheme.displaySmall // Changed from headline6 to headline1
          ?.copyWith(color: lightColorScheme.onPrimary),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: lightColorScheme.primary,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: lightColorScheme.onSecondary,
        backgroundColor: lightColorScheme.secondary, // 确保文本颜色与背景对比
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: lightColorScheme.secondary, // 确保文本按钮的文本颜色
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: lightColorScheme.secondary,
        side: BorderSide(color: lightColorScheme.secondary), // 轮廓颜色
      ),
    ),
    // Add other theme properties as needed
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    textTheme: TextStyles.textTheme,
    primaryColor: darkColorScheme.primary,
    scaffoldBackgroundColor: darkColorScheme.primaryContainer,
    appBarTheme: AppBarTheme(
      backgroundColor: darkColorScheme.primary,
      titleTextStyle: TextStyles
          .textTheme.displaySmall // Changed from headline6 to headline1
          ?.copyWith(color: darkColorScheme.onPrimary),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: darkColorScheme.primary,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: darkColorScheme.onSecondary,
        backgroundColor: darkColorScheme.secondary, // 确保文本颜色与背景对比
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: darkColorScheme.secondary, // 确保文本按钮的文本颜色
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: darkColorScheme.secondary,
        side: BorderSide(color: darkColorScheme.secondary), // 轮廓颜色
      ),
    ),
    // Add other theme properties as needed
  );
}
