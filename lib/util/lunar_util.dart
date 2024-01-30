class LunarUtil {
  static const _numbers = [
    "零",
    "一",
    "二",
    "三",
    "四",
    "五",
    "六",
    "七",
    "八",
    "九",
    "十",
    "十一",
    "十二",
    "十三",
    "十四",
    "十五",
    "十六",
    "十七",
    "十八",
    "十九",
    "廿",
    "廿一",
    "廿二",
    "廿三",
    "廿四",
    "廿五",
    "廿六",
    "廿七",
    "廿八",
    "廿九",
    "卅",
    "卅一",
  ];

  static String year2Chinese(int year) {
    assert(
      year >= 1900 && year <= 9999,
      'illegal year range [1900-9999]: $year',
    );

    var result = <String>[];
    int tail = year;
    do {
      result.add(_numbers[tail % 10]);
      tail ~/= 10;
    } while (tail > 0);
    return result.reversed.join('');
  }

  static String month2Chinese(int month) {
    assert(month >= 1 && month <= 12, 'illegal month range [1-12]: $month');

    return _numbers[month];
  }

  static String day2Chinese(int day) {
    assert(day >= 1 && day <= 31, 'illegal month range [1-31]: $day');

    return _numbers[day];
  }

  static String dateTime2Chinese(DateTime dateTime) {
    final year = year2Chinese(dateTime.year);
    final month = month2Chinese(dateTime.month);
    final day = day2Chinese(dateTime.day);
    return "$year年 $month月 $day日";
  }
}
