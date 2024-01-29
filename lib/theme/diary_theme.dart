import 'package:flutter/material.dart';

ThemeData diaryTheme() {
  return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
          fontSize: 22,
          fontFamily: 'KhangxiDictTrial',
        ),
        bodyMedium: TextStyle(
          fontSize: 20,
          fontFamily: 'KhangxiDictTrial',
        ),
        bodySmall: TextStyle(
          fontSize: 18,
          fontFamily: 'KhangxiDictTrial',
        ),
      ));
}
