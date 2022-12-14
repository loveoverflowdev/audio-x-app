import 'package:audio_x_app/core/network/api_parameters.dart';
import 'package:audio_x_app/core/network/network_client.dart';
import 'package:audio_x_app/data/network/request/rest_request_builder.dart';
import 'package:audio_x_app/domain/repository.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/novel.dart';
import '../../domain/params.dart';

class NovelRepository extends Repository<Novel, NovelQueryParams> {
  final NetworkClient networkClient;

  NovelRepository({
    required this.networkClient,
  });

  @override
  Future<Either<Iterable<Novel>, Exception>> getList({
    required NovelQueryParams queryParam,
  }) async {
    final request = RestRequestBuilder()
        .setMethod(HttpMethod.get)
        .addUri(ApiParameters().baseUrl)
        .addUri(ApiParameters().novelListUri(searchText: queryParam.searchText))
        .build();
    final response = await networkClient.requestJson(request);
    return response.bimap(
      (l) {
        final dataJson = l['data'] is Iterable ? l['data'] as Iterable : [];
        return dataJson.map((e) => Novel.fromMap(e));
      },
      (r) => r,
    );
  }

  @override
  Future<Either<Novel, Exception>> getOne({
    required NovelQueryParams queryParam,
  }) async {
    return Left(
      Novel(
        author: 'Author',
        introduction: 'Introduction',
        name: 'Novel Name',
        imageUrl:
            'https://i.pinimg.com/236x/1d/21/20/1d2120e48360c4beab759591e4a789c8--one-piece-manga-one-piece-chibi.jpg',
        id: '',
      ),
    );
  }
}
