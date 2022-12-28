import 'package:audio_x_app/domain/entities/novel.dart';
import 'package:audio_x_app/domain/entities/novel_chapter.dart';
import 'package:audio_x_app/presentation/features/audio/views/custom/audio_listener/audio_listener_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../data/respositories/novel_history_repository.dart';

class AudioChapterTile extends StatelessWidget {
  final Novel novel;
  final String title;
  final int index;
  final String imageUrl;
  final NovelChapter novelChapter;

  const AudioChapterTile({
    super.key,
    required this.novelChapter,
    required this.index,
    required this.title,
    required this.imageUrl,
    required this.novel,
  });

  String get novelChapterName =>
      novelChapter.name.isNotEmpty ? novelChapter.name : 'Chương $index';

  void _gotoAudioListenerPage(BuildContext context) async {
    await Navigator.push(context, CupertinoPageRoute(builder: (_) {
      return AudioListenerPage(
        title: title,
        mp3Url: novelChapter.source,
        imageUrl: imageUrl,
      );
    }));
    GetIt.instance.get<NovelHistoryRepository>().addOrUpdateRecentNovel(novel);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _gotoAudioListenerPage(context),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
        child: SizedBox(
          height: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chương $index',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.grey,
                ),
              ),
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        novelChapterName,
                        maxLines: 2,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: IconButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () => _gotoAudioListenerPage(context),
                        icon: const Icon(Icons.play_arrow_rounded),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
