import 'package:diary_flutter/model/diary.dart';
import 'package:diary_flutter/model/month.dart';
import 'package:diary_flutter/model/year.dart';
import 'package:diary_flutter/repository/diary_store.dart';
import 'package:diary_flutter/ui/compose/compose_page.dart';
import 'package:diary_flutter/ui/diary/diary_page.dart';
import 'package:diary_flutter/ui/year/year_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mongol/mongol.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'day_page.g.dart';

@riverpod
Future<List<Diary>> diaries(DiariesRef ref, Year year, Month month) async {
  final diaryStore = await ref.watch(diaryStoreProvider.future);
  return diaryStore.findAll(year.value, month.value);
}

class DayPage extends ConsumerStatefulWidget {
  const DayPage({super.key});

  static const route = 'day_page';

  @override
  ConsumerState<DayPage> createState() => _DayPageState();
}

class _DayPageState extends ConsumerState<DayPage> {
  void _openYearPage() {
    Navigator.of(context).pushNamedAndRemoveUntil(YearPage.route, (_) => false);
  }

  void _openMonthPage() {
    Navigator.pop(context);
  }

  void _openDiaryPage(Diary diary) {
    Navigator.of(context).pushNamed(DiaryPage.route, arguments: diary);
  }

  void _openComposePage() {
    Navigator.of(context).pushNamed(ComposePage.route);
  }

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

  Widget diaryList(List<Diary> diaries) {
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
    final (year, month) = ModalRoute.of(context)?.settings.arguments as (Year, Month);
    final diaries = ref.watch(diariesProvider(year, month)).requireValue;

    return GestureDetector(
      onDoubleTap: () {
        Navigator.of(context).pop();
      },
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          diaryList(diaries),
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
