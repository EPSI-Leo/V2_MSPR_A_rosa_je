import 'dart:convert';
import 'dart:io';

import 'package:arosa_je/core/api_client.dart';
import 'package:arosa_je/core/arosaje_endpoints.dart';
import 'package:arosa_je/core/data/entities/advice/advices.dart';
import 'package:arosa_je/core/foundation/config.dart';
import 'package:arosa_je/core/local/session_manager/secure_storage_keys.dart';
import 'package:arosa_je/core/local/session_manager/session_manager.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_advices.g.dart';

@riverpod
ApiAdvices apiAdvices(ApiAdvicesRef ref) {
  final client = Client();
  final sessionManager = ref.read(sessionManagerProvider);
  final config = ref.watch(configProvider);

  return ApiAdvices(
    innerClient: client,
    sessionManager: sessionManager,
    config: config,
  );
}

class ApiAdvices extends ApiClient {
  ApiAdvices({
    required super.innerClient,
    required this.sessionManager,
    required this.config,
  });

  final SessionManager sessionManager;

  final Config config;

  @override
  String get baseUrl => config.baseUrl;

  Future<Advices?> getAllAdvices() async {
    final token =
        await sessionManager.readSecureStorage(SecureStorageKeys.token);

    return this.get(
      ArosajeEndpoints.getAllAdvices,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
      deserializer: (json) => Advices.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<bool?> postAdvice(
    String name,
    String advice1,
  ) async {
    final token =
        await sessionManager.readSecureStorage(SecureStorageKeys.token);

    var body = {
      "name": name.toString(),
      "advice1": advice1.toString(),
    };

    return this.post(ArosajeEndpoints.postAdvice,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: 'Bearer $token'
        },
        body: jsonEncode(body), deserializer: (json) {
      return true;
    });
  }
}
