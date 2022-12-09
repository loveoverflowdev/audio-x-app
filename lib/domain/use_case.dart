import 'package:dartz/dartz.dart';

abstract class UseCase<Response, Params> {
  Future<Either<Response, Exception>> invoke(Params params);
}
