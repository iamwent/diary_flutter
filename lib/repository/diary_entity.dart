import 'package:isar/isar.dart';

part 'diary_entity.g.dart';

@collection
class DiaryEntity {
  Id? id;

  int? year;

  int? month;

  String? title;

  String? content;

  String? location;

  int? createdAt;
}
