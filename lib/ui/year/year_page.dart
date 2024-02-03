import 'package:diary_flutter/model/year.dart';
import 'package:diary_flutter/repository/diary_store.dart';
import 'package:diary_flutter/ui/month/month_page.dart';
import 'package:flutter/material.dart';
import 'package:mongol/mongol.dart';

class YearPage extends StatefulWidget {
  const YearPage({super.key});

  static const route = 'year_page';

  @override
  State<YearPage> createState() => _YearPageState();
}

class _YearPageState extends State<YearPage> {
  List<Year> years = [];

  @override
  void initState() {
    DiaryStore().findYears().then((value) => {
          setState(() {
            years = value;
          })
        });
    super.initState();
  }

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
