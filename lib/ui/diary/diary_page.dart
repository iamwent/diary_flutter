import 'package:diary_flutter/model/diary.dart';
import 'package:diary_flutter/ui/compose/compose_page.dart';
import 'package:diary_flutter/util/lunar_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:mongol/mongol.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../repository/diary_store.dart';

part 'diary_page.g.dart';

@riverpod
Stream<Diary?> diaryStream(DiaryStreamRef ref, Id id) async* {
  final diaryStore = await ref.watch(diaryStoreProvider.future);
  yield* diaryStore.find(id);
}

class DiaryPage extends ConsumerStatefulWidget {
  const DiaryPage({super.key});

  static const route = 'diary_page';

  @override
  ConsumerState<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends ConsumerState<DiaryPage> {
  bool _visible = true;

  void _compose(Diary diary) {
    Navigator.of(context).pushNamed(ComposePage.route, arguments: diary);
  }

  void _delete(Diary diary) async {
    final diaryStore = await ref.watch(diaryStoreProvider.future);
    diaryStore.delete(diary.id!).then((_) {
      Navigator.of(context).pop();
    });
  }

  void _share(Diary diary) {}

  Widget diaryItem(Diary diary) {
    return Container(
      alignment: Alignment.topRight,
      color: Colors.white,
      child: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MongolText(
                LunarUtil.dateTime2Chinese(diary.createdDatetime),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
              MongolText(
                '于 ${diary.location}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
              MongolText(
                diary.content,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
              MongolText(
                diary.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget button(String text, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFD0021B),
        ),
        child: MongolText(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }

  Widget bottomBar(
    Diary diary, {
    void Function()? onCompose,
    void Function()? onDelete,
    void Function()? onShare,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          button('改', () {
            onCompose?.call();
          }),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
          button('存', () {
            onShare?.call();
          }),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
          button('删', () {
            onDelete?.call();
          })
        ],
      ),
    );
  }

  Widget content(Diary? diary) {
    if (diary == null) {
      return Container();
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          _visible = !_visible;
        });
      },
      onDoubleTap: () {
        Navigator.of(context).pop();
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          diaryItem(diary),
          Visibility(
            visible: _visible,
            maintainAnimation: true,
            maintainState: true,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              opacity: _visible ? 1 : 0,
              child: bottomBar(
                diary,
                onShare: () {
                  _share(diary);
                },
                onDelete: () {
                  _delete(diary);
                },
                onCompose: () {
                  _compose(diary);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final id = (ModalRoute.of(context)?.settings.arguments as Diary).id as Id;
    final diaryAsyncValue = ref.watch(diaryStreamProvider(id));

    return diaryAsyncValue.when(
      data: (diary) => content(diary),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text(e.toString())),
    );
  }
}
