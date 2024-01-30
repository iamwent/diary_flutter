import 'package:diary_flutter/model/diary.dart';
import 'package:diary_flutter/model/month.dart';
import 'package:diary_flutter/model/year.dart';
import 'package:diary_flutter/ui/diary/diary_page.dart';
import 'package:diary_flutter/ui/year/year_page.dart';
import 'package:flutter/material.dart';
import 'package:mongol/mongol.dart';

class DayPage extends StatefulWidget {
  const DayPage({super.key});

  static const route = 'day_page';

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  final diaries = [
    Diary(
      id: 0,
      year: 2024,
      month: 1,
      title: '江南好',
      content: '江南好\n风景旧曾谙\n日出江花红胜火\n春来江水绿如蓝\n能不忆江南',
      location: '武汉',
      createdAt: DateTime.now().millisecondsSinceEpoch,
    )
  ];

  void _openYearPage() {
    Navigator.of(context).pushNamedAndRemoveUntil(YearPage.route, (_) => false);
  }

  void _openMonthPage() {
    Navigator.pop(context);
  }

  void _openDiaryPage(Diary diary) {
    Navigator.of(context).pushNamed(DiaryPage.route);
  }

  void _openComposePage() {}

  Widget sidebar(
    Year year,
    Month month, {
    void Function()? openYearPage,
    void Function()? openMonthPage,
    void Function()? openComposePage,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 32,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            // onTap: openYearPage,
            onTap: () {
              _openYearPage();
            },
            child: MongolText(
              year.text,
              textAlign: MongolTextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 12)),
          GestureDetector(
            // onTap: openComposePage,
            onTap: () {
              _openComposePage();
            },
            child: Container(
              width: 32,
              height: 32,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFD0021B),
              ),
              child: MongolText(
                "撰",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 24)),
          GestureDetector(
            // onTap: openYearPage,
            onTap: () {
              _openMonthPage();
            },
            child: MongolText(
              month.text,
              textAlign: MongolTextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget diaryItem(Diary diary, {void Function(Diary)? onTap}) {
    return GestureDetector(
      onTap: () {
        onTap?.call(diary);
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: MongolText(
          diary.title,
          textAlign: MongolTextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }

  Widget diaryList() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      alignment: Alignment.center,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: diaries.length,
        reverse: true,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return diaryItem(diaries[index], onTap: _openDiaryPage);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final (year, month) =
        ModalRoute.of(context)?.settings.arguments as (Year, Month);

    return GestureDetector(
      onDoubleTap: () {
        Navigator.of(context).pop();
      },
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          diaryList(),
          sidebar(
            year,
            month,
            openYearPage: _openYearPage,
            openMonthPage: _openMonthPage,
            openComposePage: _openComposePage,
          ),
        ],
      ),
    );
  }
}
