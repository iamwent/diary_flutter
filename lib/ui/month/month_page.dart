import 'package:diary_flutter/model/month.dart';
import 'package:diary_flutter/model/year.dart';
import 'package:diary_flutter/repository/diary_store.dart';
import 'package:diary_flutter/ui/compose/compose_page.dart';
import 'package:diary_flutter/ui/day/day_page.dart';
import 'package:diary_flutter/ui/year/year_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mongol/mongol.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'month_page.g.dart';

@riverpod
Stream<List<Month>> monthsStream(MonthsStreamRef ref, Year year) async* {
  final diaryStore = await ref.watch(diaryStoreProvider.future);
  yield* diaryStore.findMonths(year.value);
}

class MonthPage extends ConsumerStatefulWidget {
  const MonthPage({super.key});

  static const route = 'month_page';

  @override
  ConsumerState<MonthPage> createState() => _MonthPageState();
}

class _MonthPageState extends ConsumerState<MonthPage> {
  void _openDayPage(Year year, Month month) {
    Navigator.of(context).pushNamed(DayPage.route, arguments: (year, month));
  }

  void _openYearPage() {
    Navigator.of(context).pushNamedAndRemoveUntil(YearPage.route, (_) => false);
  }

  void _openComposePage() {
    Navigator.of(context).pushNamed(ComposePage.route);
  }

  Widget sidebar(
    Year year, {
    void Function()? openYearPage,
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
              style: Theme.of(context).textTheme.bodyMedium,
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
        ],
      ),
    );
  }

  Widget monthItem(Month month, {void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: MongolText(
          month.text,
          textAlign: MongolTextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }

  Widget monthList(List<Month> months, {void Function(Month)? onItemTap}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      alignment: Alignment.center,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: months.length,
        reverse: true,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final month = months[index];
          return monthItem(month, onTap: () {
            onItemTap?.call(month);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final year = ModalRoute.of(context)?.settings.arguments as Year;
    final monthsAsyncValue = ref.watch(monthsStreamProvider(year));
    final content = monthsAsyncValue.when(
      data: (months) => monthList(months, onItemTap: (month) {
        _openDayPage(year, month);
      }),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text(e.toString())),
    );

    return GestureDetector(
      onDoubleTap: () {
        Navigator.of(context).pop();
      },
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          content,
          sidebar(
            year,
            openYearPage: _openYearPage,
            openComposePage: _openComposePage,
          ),
        ],
      ),
    );
  }
}
