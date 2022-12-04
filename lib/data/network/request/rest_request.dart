import 'dart:convert';
import 'dart:typed_data';

import '../../../core/network/api_parameters.dart';
import '../../../core/network/network_request.dart';

class RestRequest extends NetworkRequest {
  final String _uriString;
  final Map<String, String>? _headers;
  final Map<String, String>? _parameters;

  final Map<String, dynamic>? _body;
  final Encoding? _encoding;

  final HttpMethod _method;

  final Duration _timeout;
  final bool _isMultipart;
  final Map<String, Uint8List> _files;

  RestRequest(
    this._uriString, {
    HttpMethod? method,
    required Map<String, String>? headers,
    required Map<String, String>? parameters,
    required Map<String, dynamic>? body,
    required Encoding? encoding,
    required Duration? timeout,
    required bool? isMultipart,
    required Map<String, Uint8List> files,
  })  : _method = method ?? HttpMethod.get,
        _headers =
            headers ?? {"Content-Type": "application/json; charset=utf8"},
        _parameters = parameters,
        _body = body,
        _encoding = encoding,
        _timeout = ApiParameters().timeout,
        _isMultipart = isMultipart ?? false,
        _files = files;

  @override
  Uri get uri => Uri.parse(_uriString).replace(queryParameters: _parameters);

  @override
  Map<String, String>? get headers => _headers;

  @override
  Map<String, dynamic>? get body => _body;

  @override
  Encoding? get encoding => _encoding;

  @override
  HttpMethod get method => _method;

  @override
  Duration get timeout => _timeout;

  @override
  bool get isMultipart => _isMultipart;

  @override
  Map<String, Uint8List> get files => _files;
}
