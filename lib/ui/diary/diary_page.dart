import 'package:diary_flutter/model/diary.dart';
import 'package:diary_flutter/util/lunar_util.dart';
import 'package:flutter/material.dart';
import 'package:mongol/mongol.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  static const route = 'diary_page';

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  final diary = Diary(
    id: 0,
    year: 2024,
    month: 1,
    title: '江南好',
    content: '江南好\n风景旧曾谙\n日出江花红胜火\n春来江水绿如蓝\n能不忆江南',
    location: '武汉',
    createdAt: DateTime.now().millisecondsSinceEpoch,
  );

  bool _visible = true;

  void _compose(Diary diary) {}

  void _delete(Diary diary) {}

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

  @override
  Widget build(BuildContext context) {
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
}
