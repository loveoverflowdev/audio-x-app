import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'api_parameters.dart';

abstract class NetworkRequest {
  Map<String, String>? get headers;
  Map<String, dynamic>? get body;
  Encoding? get encoding;
  HttpMethod get method;
  Duration get timeout;
  Uri get uri;
  bool get isMultipart;
  Map<String, Uint8List> get files;

  @override
  String toString() {
    return method.raw + uri.toString() + body.toString();
  }
}
