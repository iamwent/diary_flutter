import 'package:flutter/foundation.dart';

@immutable
class Year {
  const Year({
    required this.value,
    required this.text,
  });

  final int value;
  final String text;

  @override
  String toString() {
    return 'Year(value: $value, text: $text)';
  }
}
