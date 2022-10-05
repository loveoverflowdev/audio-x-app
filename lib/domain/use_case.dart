import 'package:dartz/dartz.dart';

abstract class UseCase<T> {
  Future<Either<T, Exception>> invoke();
}
