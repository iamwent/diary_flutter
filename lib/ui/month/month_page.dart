import 'package:diary_flutter/model/month.dart';
import 'package:diary_flutter/model/year.dart';
import 'package:diary_flutter/ui/day/day_page.dart';
import 'package:diary_flutter/ui/year/year_page.dart';
import 'package:diary_flutter/util/lunar_util.dart';
import 'package:flutter/material.dart';
import 'package:mongol/mongol.dart';

class MonthPage extends StatefulWidget {
  const MonthPage({super.key});

  static const route = 'month_page';

  @override
  State<MonthPage> createState() => _MonthPageState();
}

class _MonthPageState extends State<MonthPage> {
  final months = [for (int i = 1; i <= 12; i++) i]
      .map((month) => Month(
            value: month,
            text: '${LunarUtil.month2Chinese(month)}月',
          ))
      .toList();

  void _openDayPage(Year year, Month month) {
    Navigator.of(context).pushNamed(DayPage.route, arguments: (year, month));
  }

  void _openYearPage() {
    Navigator.of(context).pushNamedAndRemoveUntil(YearPage.route, (_) => false);
  }

  void _openComposePage() {}

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

  Widget monthList({void Function(Month)? onItemTap}) {
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

    return GestureDetector(
      onDoubleTap: () {
        Navigator.of(context).pop();
      },
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          monthList(onItemTap: (month) {
            _openDayPage(year, month);
          }),
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
