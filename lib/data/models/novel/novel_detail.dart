import 'package:audio_x_app/data/models/novel/novel.dart';

import '../components/novel_chapter.dart';

class NovelDetail extends Novel {
  final List<NovelChapter> chapterList;

  NovelDetail({
    required super.name,
    required super.author,
    required super.introduction,
    required super.tag,
    required super.imageUrl,
    this.chapterList = const [],
  });
}
