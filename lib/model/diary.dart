import 'package:flutter/foundation.dart';

@immutable
class Diary {
  const Diary({
    required this.id,
    required this.year,
    required this.month,
    required this.title,
    required this.content,
    required this.location,
    required this.createdAt,
  });

  final int? id;

  final int? year;

  final int? month;

  final String? title;

  final String? content;

  final String? location;

  final int? createdAt;

  DateTime get createdDatetime {
    DateTime dateTime;
    if (createdAt == null) {
      dateTime = DateTime.now();
    } else {
      dateTime = DateTime.fromMillisecondsSinceEpoch(createdAt!);
    }
    return dateTime;
  }

  @override
  String toString() {
    return 'Diary(id: $id, year: $year, month: $month, title: $title, content: $content, location: $location, createdAt: $createdAt,)';
  }
}
