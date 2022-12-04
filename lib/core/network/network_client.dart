import 'dart:io';

import 'package:dartz/dartz.dart';

import 'network_request.dart';

abstract class NetworkClient {
  Future<Either<Map<String, dynamic>, HttpException>> requestJson(
    NetworkRequest networkRequest,
  );
}
