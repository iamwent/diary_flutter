import 'dart:async';

import 'package:diary_flutter/model/diary.dart';
import 'package:diary_flutter/model/month.dart';
import 'package:diary_flutter/model/year.dart';
import 'package:diary_flutter/repository/diary_entity.dart';
import 'package:diary_flutter/util/lunar_util.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'diary_store.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> isarInstance(FutureProviderRef ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return await Isar.open(
    [DiaryEntitySchema],
    directory: dir.path,
  );
}

@Riverpod(keepAlive: true)
Future<DiaryStore> diaryStore(DiaryStoreRef ref) async {
  final isar = await ref.watch(isarInstanceProvider.future);
  return DiaryStore(isar);
}

class DiaryStore {
  final Isar isar;

  DiaryStore(this.isar);

  Stream<List<Year>> findYears() {
    final stream = isar.diaryEntitys.where().distinctByYear().yearProperty().watch(fireImmediately: true);
    return stream.map((years) {
      final sortedYears = years.whereType<int>().toList()..sort((a, b) => a.compareTo(b));
      return sortedYears
          .map(
            (year) => Year(value: year, text: '${LunarUtil.year2Chinese(year)}年'),
          )
          .toList();
    });
  }

  Stream<List<Month>> findMonths(int year) {
    final stream =
        isar.diaryEntitys.filter().yearEqualTo(year).distinctByMonth().monthProperty().watch(fireImmediately: true);
    return stream.map((months) {
      final sortedMonths = months.whereType<int>().toList()..sort((a, b) => a.compareTo(b));
      return sortedMonths.map((month) => Month(value: month, text: '${LunarUtil.month2Chinese(month)}月')).toList();
    });
  }

  Stream<List<Diary>> findAll(int year, int month) {
    final stream = isar.diaryEntitys
        .filter()
        .yearEqualTo(year)
        .and()
        .monthEqualTo(month)
        .sortByCreatedAt()
        .watch(fireImmediately: true);
    return stream.map((entities) => entities.map((entity) => entity.toDiary()).toList());
  }

  Stream<Diary?> find(Id id) {
    return isar.diaryEntitys.watchObject(id, fireImmediately: true).map((event) => event?.toDiary());
  }

  Future<void> put(Diary diary) async {
    await isar.writeTxn(() async {
      await isar.diaryEntitys.put(diary.toEntity());
    });
  }

  Future<void> delete(Id id) async {
    await isar.writeTxn(() async {
      await isar.diaryEntitys.delete(id);
    });
  }
}

extension on DiaryEntity {
  Diary toDiary() {
    return Diary(
      id: id,
      year: year,
      month: month,
      title: title,
      content: content,
      location: location,
      createdAt: createdAt,
    );
  }
}

extension on Diary {
  DiaryEntity toEntity() {
    return DiaryEntity()
      ..id = id
      ..year = year
      ..month = month
      ..title = title
      ..content = content
      ..location = location
      ..createdAt = createdAt;
  }
}
