import 'package:dartz/dartz.dart';

abstract class NetworkClient {
  Future<Either<Exception, T>> requestJson<T>();
}
