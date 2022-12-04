import 'package:audio_x_app/data/respositories/novel_repository.dart';
import 'package:audio_x_app/domain/repository.dart';
import 'package:audio_x_app/domain/use_case.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/novel.dart';

class GetNovelListUseCase extends UseCase<Iterable<Novel>> {
  final Repository<Novel, NovelQueryParam> repository;

  GetNovelListUseCase({
    required this.repository,
  });

  @override
  Future<Either<Iterable<Novel>, Exception>> invoke() {
    return repository.getList();
  }
}
