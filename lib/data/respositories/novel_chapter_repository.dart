import 'package:audio_x_app/core/network/api_parameters.dart';
import 'package:audio_x_app/data/network/request/rest_request_builder.dart';
import 'package:dartz/dartz.dart';

import '../../core/network/network_client.dart';
import '../../domain/entities/novel_chapter.dart';
import '../../domain/params.dart';
import '../../domain/repository.dart';

class NovelChapterRepository
    implements Repository<NovelChapter, NovelChapterQueryParams> {
  final NetworkClient networkClient;

  NovelChapterRepository({
    required this.networkClient,
  });

  @override
  Future<Either<Iterable<NovelChapter>, Exception>> getList({
    required NovelChapterQueryParams queryParam,
  }) async {
    final request = RestRequestBuilder()
        .setMethod(HttpMethod.get)
        .addUri(ApiParameters().baseUrl)
        .addUri(
            ApiParameters().novelChapterListUri(novelId: queryParam.novelId))
        .build();
    final response = await networkClient.requestJson(request);
    return response.bimap(
      (l) {
        final dataJson = l['data'] is Iterable ? l['data'] as Iterable : [];
        return dataJson.map((e) => NovelChapter.fromMap(e));
      },
      (r) => r,
    );
  }

  @override
  Future<Either<NovelChapter, Exception>> getOne({
    NovelChapterQueryParams? queryParam,
  }) {
    // TODO: implement getOne
    throw UnimplementedError();
  }
}
