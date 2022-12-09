// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:audio_x_app/domain/entities/novel_chapter.dart';
import 'package:audio_x_app/domain/use_case.dart';

import '../../domain/params.dart';
import '../../domain/repository.dart';

class GetNovelChapterListParams {
  final String novelId;
  GetNovelChapterListParams({
    required this.novelId,
  });
}

class GetNovelChapterListUseCase
    implements UseCase<Iterable<NovelChapter>, GetNovelChapterListParams> {
  final Repository<NovelChapter, NovelChapterQueryParams> repository;

  GetNovelChapterListUseCase({required this.repository});

  @override
  Future<Either<Iterable<NovelChapter>, Exception>> invoke(
      GetNovelChapterListParams params) {
    return repository.getList(
      queryParam: NovelChapterQueryParams(novelId: params.novelId),
    );
  }
}
