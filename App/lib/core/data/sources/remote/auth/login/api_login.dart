import 'dart:convert';
import 'dart:io';

import 'package:arosa_je/core/api_client.dart';
import 'package:arosa_je/core/data/entities/login/login_response.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_login.g.dart';

@riverpod
ApiLogin apiLogin(ApiLoginRef ref) {
  final client = Client();

  return ApiLogin(
    innerClient: client,
  );
}

class ApiLogin extends ApiClient {
  ApiLogin({
    required super.innerClient,
  });

  Future<LoginResponse?> login(
    String username,
    String password,
  ) async {
    var body = {
      'username': username,
      'password': password,
    };
    return this.post('/api/Users/Login',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body), deserializer: (json) {
      return LoginResponse.fromJson(json as Map<String, dynamic>);
    });
  }
}
