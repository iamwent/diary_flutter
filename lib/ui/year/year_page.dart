import 'package:diary_flutter/model/year.dart';
import 'package:diary_flutter/repository/diary_store.dart';
import 'package:diary_flutter/ui/month/month_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mongol/mongol.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'year_page.g.dart';

@riverpod
Future<List<Year>> year(YearRef ref) async {
  final diaryStore = await ref.watch(diaryStoreProvider.future);
  return diaryStore.findYears();
}

class YearPage extends ConsumerStatefulWidget {
  const YearPage({super.key});

  static const route = 'year_page';

  @override
  ConsumerState<YearPage> createState() => _YearPageState();
}

class _YearPageState extends ConsumerState<YearPage> {
  void _openMonthPage(Year year) {
    Navigator.pushNamed(context, MonthPage.route, arguments: year);
  }

  Widget yearItem(Year year) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: MongolText(
        year.text,
        textAlign: MongolTextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final years = ref.watch(yearProvider).requireValue;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      alignment: Alignment.center,
      color: Colors.white,
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: years.length,
          reverse: true,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            final year = years[index];
            return GestureDetector(
              onTap: () {
                _openMonthPage(year);
              },
              child: yearItem(year),
            );
          }),
    );
  }
}
