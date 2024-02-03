import 'package:flutter/material.dart';

ThemeData diaryTheme() {
  return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFC01730)),
      useMaterial3: true,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 22,
          fontFamily: 'Longzhao',
        ),
        titleMedium: TextStyle(
          fontSize: 20,
          fontFamily: 'Longzhao',
        ),
        titleSmall: TextStyle(
          fontSize: 18,
          fontFamily: 'Longzhao',
        ),
        bodyLarge: TextStyle(
          fontSize: 20,
          fontFamily: 'KhangxiDictTrial',
        ),
        bodyMedium: TextStyle(
          fontSize: 18,
          fontFamily: 'KhangxiDictTrial',
        ),
        bodySmall: TextStyle(
          fontSize: 16,
          fontFamily: 'KhangxiDictTrial',
        ),
      ));
}
