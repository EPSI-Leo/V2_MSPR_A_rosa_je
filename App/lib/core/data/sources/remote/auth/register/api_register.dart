import 'dart:convert';
import 'dart:io';

import 'package:arosa_je/core/api_client.dart';
import 'package:arosa_je/core/arosaje_endpoints.dart';
import 'package:arosa_je/core/foundation/config.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_register.g.dart';

@riverpod
ApiRegister apiRegister(ApiRegisterRef ref) {
  final client = Client();
  final config = ref.watch(configProvider);

  return ApiRegister(
    innerClient: client,
    config: config,
  );
}

class ApiRegister extends ApiClient {
  ApiRegister({
    required super.innerClient,
    required this.config,
  });

  final Config config;

  @override
  String get baseUrl => config.baseUrl;

  Future<bool?> register(
    String username,
    String password,
    String firstName,
    String lastName,
    String email,
  ) async {
    var body = {
      "id": 0,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "username": username,
      "password": password,
      "cgu": 1,
      "role": "user"
    };

    return this.post(ArosajeEndpoints.register,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body), deserializer: (json) {
      return true;
    });
  }
}
