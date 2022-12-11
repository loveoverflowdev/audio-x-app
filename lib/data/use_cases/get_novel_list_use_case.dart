import 'package:audio_x_app/domain/repository.dart';
import 'package:audio_x_app/domain/use_case.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/novel.dart';
import '../../domain/params.dart';

class GetNovelListParams {
  final String searchText;

  GetNovelListParams({
    required this.searchText,
  });
}

class GetNovelListUseCase
    implements UseCase<Iterable<Novel>, GetNovelListParams> {
  final Repository<Novel, NovelQueryParams> repository;

  GetNovelListUseCase({
    required this.repository,
  });

  @override
  Future<Either<Iterable<Novel>, Exception>> invoke(GetNovelListParams params) {
    return repository.getList(
        queryParam: NovelQueryParams(
      searchText: params.searchText,
    ));
  }
}
