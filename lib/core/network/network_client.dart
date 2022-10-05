import 'package:dartz/dartz.dart';

abstract class NetworkClient {
  Future<Either<T, Exception>> requestJson<T>();
}
