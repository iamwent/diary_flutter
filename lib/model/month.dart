import 'package:flutter/foundation.dart';

@immutable
class Month {
  const Month({
    required this.value,
    required this.text,
  });

  final int value;
  final String text;

  @override
  String toString() {
    return 'Month(value: $value, text: $text)';
  }
}
