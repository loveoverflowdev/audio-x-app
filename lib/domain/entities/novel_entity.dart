import 'novel_chapter_entity.dart';

enum NovelTag {
  martialArt,
  mystery,
  romance,
  adult,
  xuanhuan,
  fantasy,
  school,
  tragedy,
}

class NovelEntity {
  final String name;
  final String author;
  final String introduction;
  final NovelTag tag;
  final List<NovelChapterEntity> chapterList;

  NovelEntity({
    required this.name,
    required this.author,
    required this.introduction,
    required this.tag,
    this.chapterList = const [],
  });
}
