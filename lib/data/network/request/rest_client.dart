import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';

import '../../../core/network/network_client.dart';
import '../../../core/network/network_request.dart';

class RestClient extends NetworkClient {
  final Logger? _logger;

  RestClient({
    final Logger? logger,
  }) : _logger = logger;

  @override
  Future<Either<Map<String, dynamic>, HttpException>> requestJson(
    NetworkRequest networkRequest,
  ) async {
    bool hasConnection = await InternetConnectionChecker().hasConnection;
    if (!hasConnection) {
      return const Right(
        HttpException(
          'Không có kết nối Internet',
        ),
      );
    }

    final request = await _httpRequestBuilder(networkRequest);

    _logger?.i('$request; header: ${request.headers};');

    final StreamedResponse streamedResponse;
    try {
      streamedResponse = await request.send().timeout(networkRequest.timeout);
    } on TimeoutException catch (e) {
      return Right(
        HttpException('Chưa nhận được phản hồi (${e.message})'),
      );
    }

    final httpResponse = await http.Response.fromStream(streamedResponse);

    if (httpResponse.bodyBytes.isEmpty) {
      return const Right(
        HttpException('No content'),
      );
    }
    final jsonResponse = json.decode(utf8.decode(httpResponse.bodyBytes))
        as Map<String, dynamic>;

    _logger?.i(
      '$request; statusCode: ${httpResponse.statusCode}; response: ${jsonResponse.toString().length} char',
    );

    return Left(jsonResponse);
  }

  Future<http.BaseRequest> _httpRequestBuilder(
      NetworkRequest networkRequest) async {
    if (!networkRequest.isMultipart) {
      return http.Request(networkRequest.method.raw, networkRequest.uri)
        ..body = json.encode(networkRequest.body)
        ..headers.addAll({
          ...{
            'content-type': 'application/json',
            'Accept': '*/*',
            'Connection': 'keep-alive',
            'Accept-Encoding': 'gzip, deflate, br',
            // 'Keep-Alive': 'timeout=10, max=1000',
          },
          ...?networkRequest.headers,
        })
        ..encoding = networkRequest.encoding ?? utf8;
    } else {
      final fields = networkRequest.body
              ?.map((key, value) => MapEntry(key, value.toString())) ??
          {};
      return http.MultipartRequest(
          networkRequest.method.raw, networkRequest.uri)
        ..headers.addAll({
          ...{
            'Accept': '*/*',
            'Connection': 'keep-alive',
            'Accept-Encoding': 'gzip, deflate, br',
          },
          ...?networkRequest.headers,
        })
        ..fields.addAll(fields)
        ..files.addAll(
          networkRequest.files.keys.map(
            (key) => http.MultipartFile.fromBytes(
              key,
              networkRequest.files[key]?.toList() ?? [],
              filename: 'filename',
            ),
          ),
        );
    }
  }
}

extension StatusCode on int {
  bool get isSuccess => this == 0;
}
