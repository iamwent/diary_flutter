import 'package:diary_flutter/theme/diary_theme.dart';
import 'package:flutter/material.dart';

import 'year/year_page.dart';

class DiaryApp extends StatelessWidget {
  const DiaryApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '小记',
      theme: diaryTheme(),
      home: const YearPage(),
    );
  }
}
