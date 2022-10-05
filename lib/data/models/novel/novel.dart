import '../../../domain/entities/novel_entity.dart';

class Novel {
  final String name;
  final String author;
  final String introduction;
  final NovelTag tag;
  final String imageUrl;

  Novel({
    required this.name,
    required this.author,
    required this.introduction,
    required this.tag,
    required this.imageUrl,
  });
}
