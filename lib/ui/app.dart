import 'package:diary_flutter/theme/diary_theme.dart';
import 'package:diary_flutter/ui/day/day_page.dart';
import 'package:diary_flutter/ui/month/month_page.dart';
import 'package:diary_flutter/ui/year/year_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DiaryApp extends StatelessWidget {
  const DiaryApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return MaterialApp(
      title: '小记',
      theme: diaryTheme(),
      initialRoute: YearPage.route,
      routes: <String, WidgetBuilder>{
        YearPage.route: (context) => const YearPage(),
        MonthPage.route: (context) => const MonthPage(),
        DayPage.route: (context) => const DayPage(),
      },
    );
  }
}
