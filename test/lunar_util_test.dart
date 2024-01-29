import 'package:diary_flutter/util/lunar_util.dart';
import 'package:test/test.dart';

void main() {
  group('Convert datetime to Chinese', () {
    test('convert int year to Chinese', () {
      final text = LunarUtil.year2Chinese(2024);
      expect('二零二四', text);
    });
  });
}
