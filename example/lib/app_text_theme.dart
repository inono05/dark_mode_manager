import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme textTheme({required ColorScheme colorScheme}) => TextTheme(
    displayLarge: TextStyle(
      color: colorScheme.tertiary,
      letterSpacing: .6,
      height: 1.7,
      fontWeight: FontWeight.w800,
    ),
    displayMedium: TextStyle(
      color: colorScheme.tertiary,
      letterSpacing: .6,
      height: 1.7,
      fontWeight: FontWeight.w800,
    ),
    displaySmall: TextStyle(
      color: colorScheme.tertiary,
      letterSpacing: .6,
      height: 1.7,
      fontWeight: FontWeight.w700,
    ),
    headlineLarge: TextStyle(
      color: colorScheme.tertiary,
      letterSpacing: .6,
      height: 1.7,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      color: colorScheme.tertiary,
      letterSpacing: .6,
      height: 1.7,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: TextStyle(
      color: colorScheme.tertiary,
      letterSpacing: .6,
      height: 1.7,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      color: colorScheme.tertiary,
      letterSpacing: .6,
      height: 1.7,
      fontWeight: FontWeight.w700,
    ),
  );
}
