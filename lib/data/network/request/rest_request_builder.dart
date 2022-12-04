import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../../core/network/api_parameters.dart';
import 'rest_request.dart';

class RestRequestBuilder {
  String _uriString = '';
  Map<String, String>? _headers;
  Map<String, String>? _parameters;
  Map<String, dynamic>? _body;
  Encoding? _encoding;
  HttpMethod? _method;
  Duration? _timeout;
  bool? _isMultipart;
  Map<String, Uint8List>? _files;

  RestRequestBuilder addUri(String uriString) => this.._uriString += uriString;

  RestRequestBuilder setBody(Map<String, dynamic>? object) =>
      this.._body = object;

  RestRequestBuilder addParameters(Map<String, String>? parameters) => this
    .._parameters = {
      ...?_parameters,
      ...?parameters,
    };

  RestRequestBuilder addHeaders(Map<String, String>? headers) => this
    .._headers = {
      ...?_headers,
      ...?headers,
    };

  RestRequestBuilder setBearerToken(String? token) => this
    .._headers = {
      ...?_headers,
      ...{'Authorization': 'Bearer $token'}
    };

  RestRequestBuilder setEncoding(Encoding? encoding) =>
      this.._encoding = encoding;

  RestRequestBuilder setTimeout({required int seconds}) =>
      this.._timeout = Duration(seconds: seconds);

  RestRequestBuilder setMethod(HttpMethod method) => this.._method = method;

  RestRequestBuilder isMultipart(bool value) => this.._isMultipart = value;

  RestRequestBuilder addFiles(Map<String, Uint8List> files) =>
      this.._files = files;

  RestRequest build() => RestRequest(
        _uriString,
        method: _method,
        headers: _headers,
        parameters: _parameters,
        body: _body,
        encoding: _encoding,
        timeout: _timeout,
        isMultipart: _isMultipart,
        files: _files ?? {},
      );
}
