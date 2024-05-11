import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:arosa_je/core/api_client_exception.dart';
import 'package:arosa_je/core/arosaje_endpoints.dart';
import 'package:http/http.dart';

abstract class ApiClient {
  ApiClient({
    required Client innerClient,
  }) : _innerClient = innerClient;

  final Client _innerClient;

  /// The base url for each service.
  String get baseUrl => ArosajeEndpoints.baseUrl;

  /// The timeout for each http calls.
  Duration get timeout => const Duration(seconds: 30);

  /// Sends get request through `innerClient`.
  ///
  /// if `deserializer` is specified, returns an object of type [T]
  Future<T?> get<T>(
    String relativeUrl, {
    Map<String, String>? headers,
    T Function(Object)? deserializer,
  }) async {
    final uri = Uri.parse('$baseUrl$relativeUrl');
    print(uri);
    final response = await _innerClient.get(
      uri,
      headers: headers,
    );

    return _handleResponse(
      response: response,
      deserializer: deserializer,
    );
  }

  Future<T?> post<T>(
    String relativeUrl, {
    Map<String, String>? headers,
    Object? body,
    T Function(Object)? deserializer,
  }) async {
    final uri = Uri.parse('$baseUrl$relativeUrl');
    print(uri);
    final response = await _innerClient.post(
      uri,
      headers: headers,
      body: body,
    );

    return _handleResponse(
      response: response,
      deserializer: deserializer,
    );
  }

  Future<T?> patch<T>(
    String relativeUrl, {
    Map<String, String>? headers,
    Object? body,
    T Function(Object)? deserializer,
  }) async {
    final uri = Uri.parse('$baseUrl$relativeUrl');

    final response = await _innerClient.patch(
      uri,
      headers: headers,
      body: body,
    );

    return _handleResponse(
      response: response,
      deserializer: deserializer,
    );
  }

  Future<T?> put<T>(
    String relativeUrl, {
    Map<String, String>? headers,
    Object? body,
    T Function(Object)? deserializer,
  }) async {
    final uri = Uri.parse('$baseUrl$relativeUrl');

    final response = await _innerClient.put(
      uri,
      headers: headers,
      body: body,
    );

    return _handleResponse(
      response: response,
      deserializer: deserializer,
    );
  }

  Future<T?> delete<T>(
    String relativeUrl, {
    Map<String, String>? headers,
    Object? body,
    T Function(Object)? deserializer,
  }) async {
    final uri = Uri.parse('$baseUrl$relativeUrl');

    final response = await _innerClient.delete(
      uri,
      headers: headers,
      body: body,
    );

    return _handleResponse(
      response: response,
      deserializer: deserializer,
    );
  }
}

T? _handleResponse<T>({
  required Response response,
  T Function(Object)? deserializer,
}) {
  if (response.statusCode == HttpStatus.ok ||
      response.statusCode == HttpStatus.created ||
      response.statusCode == HttpStatus.noContent) {
    if (deserializer != null) {
      final Object json = jsonDecode(response.body) as Object;
      return deserializer(json);
    } else {
      return null;
    }
  } else {
    throw ApiClientException(
      code: response.statusCode,
    );
  }
}
