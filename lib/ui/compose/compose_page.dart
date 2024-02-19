import 'package:diary_flutter/model/diary.dart';
import 'package:diary_flutter/repository/diary_store.dart';
import 'package:diary_flutter/util/lunar_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ComposePage extends ConsumerStatefulWidget {
  const ComposePage({super.key});

  static const route = 'compose_page';

  @override
  ConsumerState<ComposePage> createState() => _ComposePageState();
}

class _ComposePageState extends ConsumerState<ComposePage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final locationController = TextEditingController();

  Diary? diary;

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    locationController.dispose();
    super.dispose();
  }

  Diary defaultDiary() {
    final now = DateTime.now();
    return Diary(
      id: null,
      year: now.year,
      month: now.month,
      title: '${LunarUtil.day2Chinese(now.day)} 日',
      content: null,
      location: '于 武汉',
      createdAt: now.millisecondsSinceEpoch,
    );
  }

  void init() {
    diary = ModalRoute.of(context)?.settings.arguments as Diary? ?? defaultDiary();
    titleController.text = diary?.title ?? '';
    contentController.text = diary?.content ?? '';
    locationController.text = diary?.location ?? '';
  }

  void _save() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final diaryStore = await ref.read(diaryStoreProvider.future);
    final now = DateTime.now();
    await diaryStore
        .put(Diary(
          id: diary?.id,
          year: diary?.year ?? now.year,
          month: diary?.month ?? now.month,
          title: titleController.text,
          content: contentController.text,
          location: locationController.text,
          createdAt: diary?.createdAt ?? now.millisecondsSinceEpoch,
        ))
        .then((value) => Navigator.of(context).pop());
  }

  @override
  Widget build(BuildContext context) {
    init();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return Scaffold(
      appBar: null,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TextField(
              textInputAction: TextInputAction.next,
              decoration: null,
              controller: titleController,
              cursorColor: const Color(0xFFC01730),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                autofocus: true,
                decoration: null,
                controller: contentController,
                cursorColor: const Color(0xFFC01730),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    decoration: null,
                    controller: locationController,
                    cursorColor: const Color(0xFFC01730),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                GestureDetector(
                  // onTap: openComposePage,
                  onTap: () {
                    _save();
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFD0021B),
                    ),
                    child: Text(
                      "完",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
