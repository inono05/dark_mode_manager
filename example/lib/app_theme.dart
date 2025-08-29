import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData _theme({required Brightness brightness}) {
    final ColorScheme colorScheme = brightness == Brightness.light
        ? AppColors.lightColorScheme
        : AppColors.darkColorScheme;

    return ThemeData.from(
      colorScheme: colorScheme,
      useMaterial3: true,
      textTheme: _textTheme(colorScheme: colorScheme),
    ).copyWith(
      scaffoldBackgroundColor: colorScheme.outline,
      navigationBarTheme: NavigationBarThemeData(
        labelTextStyle: WidgetStateProperty.all(
          _textTheme(
            colorScheme: colorScheme,
          ).headlineMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        titleTextStyle: _textTheme(colorScheme: colorScheme).displayMedium,
        toolbarHeight: 50 * 1.2,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: brightness,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: brightness,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 3.2,
        hoverElevation: 5.2,
        focusElevation: 4.2,
        disabledElevation: 0.2,
      ),
    );
  }

  static TextTheme _textTheme({required ColorScheme colorScheme}) {
    return AppTextTheme.textTheme(colorScheme: colorScheme);
  }

  static final ThemeData lightTheme = _theme(brightness: Brightness.light);
  static final ThemeData darkTheme = _theme(brightness: Brightness.dark);
}
