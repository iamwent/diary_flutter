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

  Future<List<Year>> findYears() async {
    final diaries = await isar.diaryEntitys.where().findAll();
    final years = diaries.map((diary) => diary.year).whereType<int>().toSet().toList();
    years.sort((a, b) => a.compareTo(b));

    return years
        .map(
          (year) => Year(value: year, text: '${LunarUtil.year2Chinese(year)}年'),
    )
        .toList();
  }

  Future<List<Month>> findMonths(int year) async {
    final diaries = await isar.diaryEntitys.filter().yearEqualTo(year).findAll();
    final months = diaries.map((diary) => diary.month).whereType<int>().toSet().toList();
    months.sort((a, b) => a.compareTo(b));
    return months.map((month) => Month(value: month, text: '${LunarUtil.month2Chinese(month)}月')).toList();
  }

  Future<List<Diary>> findAll(int year, int month) async {
    final entities = await isar.diaryEntitys.filter().yearEqualTo(year).and().monthEqualTo(month).findAll();
    return entities.map((entity) => entity.toDiary()).toList();
  }

  Future<Diary?> find(Id id) async {
    final entity = await isar.diaryEntitys.get(id);
    return entity?.toDiary();
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
