import 'package:dartz/dartz.dart';

abstract class Repository<Model, QueryParam> {
  Future<Either<Iterable<Model>, Exception>> getList(
      {required QueryParam queryParam});
  Future<Either<Model, Exception>> getOne({required QueryParam queryParam});
}
