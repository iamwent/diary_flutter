import 'package:diary_flutter/model/year.dart';
import 'package:diary_flutter/util/lunar_util.dart';
import 'package:flutter/material.dart';
import 'package:mongol/mongol.dart';

class YearPage extends StatefulWidget {
  const YearPage({super.key});

  @override
  State<YearPage> createState() => _YearPageState();
}

class _YearPageState extends State<YearPage> {
  final years = [for (int i = 0; i < 20; i++) 2024 - i]
      .map(
          (year) => Year(value: year, text: '${LunarUtil.year2Chinese(year)}年'))
      .toList();

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
            return yearItem(years[index]);
          }),
    );
  }
}
