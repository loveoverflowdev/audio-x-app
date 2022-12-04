import 'package:dartz/dartz.dart';

abstract class QueryParam {}

abstract class Repository<Model, QueryParam> {
  Future<Either<Iterable<Model>, Exception>> getList({QueryParam? queryParam});
  Future<Either<Model, Exception>> getOne({QueryParam? queryParam});
}
