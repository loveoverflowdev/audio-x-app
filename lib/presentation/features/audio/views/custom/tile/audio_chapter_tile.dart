import 'package:audio_x_app/domain/entities/novel_chapter.dart';
import 'package:audio_x_app/presentation/features/audio/views/custom/audio_listener/audio_listener_page.dart';
import 'package:flutter/material.dart';

class AudioChapterTile extends StatelessWidget {
  final int index;
  final NovelChapter novelChapter;

  const AudioChapterTile({
    super.key,
    required this.novelChapter,
    required this.index,
  });

  String get novelChapterName =>
      novelChapter.name.isNotEmpty ? novelChapter.name : 'Chương $index';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return AudioListenerPage(
            title: 'Chuong $index',
            mp3Url: novelChapter.source,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: SizedBox(
          height: 40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Text(novelChapterName)),
              IconButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return AudioListenerPage(
                      mp3Url: novelChapter.source,
                      title: 'Chuong $index',
                    );
                  }));
                },
                icon: const Icon(Icons.play_arrow_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
