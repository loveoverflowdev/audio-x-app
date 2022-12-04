import 'package:audio_x_app/data/models/novel/novel_detail.dart';
import 'package:audio_x_app/domain/repository.dart';
import 'package:audio_x_app/domain/entities/novel_entity.dart';
import 'package:dartz/dartz.dart';

import '../models/novel/novel.dart';

class NovelQueryParam {}

class NovelRepository extends Repository<Novel, NovelQueryParam> {
  @override
  Future<Either<List<Novel>, Exception>> getList({
    NovelQueryParam? queryParam,
  }) async {
    return Left(
      List.generate(
            10,
            (index) => Novel(
              author: 'Author',
              introduction: 'Introduction',
              name: 'Novel Name',
              tag: NovelTag.romance,
              imageUrl:
                  'https://i.pinimg.com/236x/1d/21/20/1d2120e48360c4beab759591e4a789c8--one-piece-manga-one-piece-chibi.jpg',
            ),
          ) +
          [
            Novel(
              author: 'Long Long Long Long Author',
              introduction: 'Long Long Long Long Long Introduction',
              name: 'Long Long Long Long Long Long Novel Name',
              tag: NovelTag.romance,
              imageUrl:
                  'https://i.pinimg.com/236x/1d/21/20/1d2120e48360c4beab759591e4a789c8--one-piece-manga-one-piece-chibi.jpg',
            ),
            Novel(
              author: 'Long Long Author',
              introduction: 'Long Long Introduction',
              name: 'Long Long Long Long Long Novel Name',
              tag: NovelTag.romance,
              imageUrl:
                  'https://i.pinimg.com/236x/1d/21/20/1d2120e48360c4beab759591e4a789c8--one-piece-manga-one-piece-chibi.jpg',
            ),
            Novel(
              author: 'Long Long Author',
              introduction:
                  'Long Long Long Long Long Long Long LongIntroduction',
              name: 'Novel Name',
              tag: NovelTag.romance,
              imageUrl:
                  'https://i.pinimg.com/236x/1d/21/20/1d2120e48360c4beab759591e4a789c8--one-piece-manga-one-piece-chibi.jpg',
            ),
            Novel(
              author: 'Long Long Long Long Long Long Long Long Long LongAuthor',
              introduction: 'Introduction',
              name:
                  'Long LongLong Long Long Long Long Long Long Long Long Novel Name',
              tag: NovelTag.romance,
              imageUrl:
                  'https://i.pinimg.com/236x/1d/21/20/1d2120e48360c4beab759591e4a789c8--one-piece-manga-one-piece-chibi.jpg',
            ),
          ],
    );
  }

  @override
  Future<Either<NovelDetail, Exception>> getOne({
    NovelQueryParam? queryParam,
  }) async {
    return Left(
      NovelDetail(
        author: 'Author',
        introduction: 'Introduction',
        name: 'Novel Name',
        tag: NovelTag.romance,
        imageUrl:
            'https://i.pinimg.com/236x/1d/21/20/1d2120e48360c4beab759591e4a789c8--one-piece-manga-one-piece-chibi.jpg',
      ),
    );
  }
}
