import 'dart:convert';
import 'dart:io';

import 'package:arosa_je/core/api_client.dart';
import 'package:arosa_je/core/arosaje_endpoints.dart';
import 'package:arosa_je/core/data/entities/login/login_response.dart';
import 'package:arosa_je/core/foundation/config.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_login.g.dart';

@riverpod
ApiLogin apiLogin(ApiLoginRef ref) {
  final client = Client();
  final config = ref.watch(configProvider);

  return ApiLogin(
    innerClient: client,
    config: config,
  );
}

class ApiLogin extends ApiClient {
  ApiLogin({
    required super.innerClient,
    required this.config,
  });

  final Config config;

  @override
  String get baseUrl => config.baseUrl;

  Future<LoginResponse?> login(
    String username,
    String password,
  ) async {
    var body = {
      'email': username,
      'password': password,
    };
    return this.post(ArosajeEndpoints.login,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body), deserializer: (json) {
      return LoginResponse.fromJson(json as Map<String, dynamic>);
    });
  }
}
