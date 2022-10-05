import 'package:dartz/dartz.dart';

abstract class Repository<T> {
  Future<Either<List<T>, Exception>> getList();
  Future<Either<T, Exception>> getOne();
}
