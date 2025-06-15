import 'package:flutter/material.dart';
import '../../utils/constants.dart';

/// Single place to create ThemeData objects.
class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: AppColors.teal,
    scaffoldBackgroundColor: AppColors.background,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 16, color: AppColors.charcoal),
    ),
  );
}
