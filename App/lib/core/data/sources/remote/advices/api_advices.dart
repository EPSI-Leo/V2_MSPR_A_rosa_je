import 'dart:convert';
import 'dart:io';

import 'package:arosa_je/core/api_client.dart';
import 'package:arosa_je/core/core.dart';
import 'package:arosa_je/core/data/entities/advice/advices.dart';
import 'package:arosa_je/core/local/session_manager/secure_storage_keys.dart';
import 'package:arosa_je/core/local/session_manager/session_manager.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_advices.g.dart';

@riverpod
ApiAdvices apiAdvices(ApiAdvicesRef ref) {
  final client = Client();
  final sessionManager = ref.read(sessionManagerProvider);

  return ApiAdvices(
    innerClient: client,
    sessionManager: sessionManager,
  );
}

class ApiAdvices extends ApiClient {
  ApiAdvices({
    required super.innerClient,
    required this.sessionManager,
  });

  final SessionManager sessionManager;

  Future<Advices?> getAllAdvices() async {
    return this.get(
      '/api/Advices',
      deserializer: (json) => Advices.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<bool?> postAdvice(
    String name,
    String advice1,
  ) async {
    final idUser =
        await sessionManager.readSecureStorage(SecureStorageKeys.userInfos);
    var body = {
      "id": null,
      "idUser": idUser.toString(),
      "idPlant": null,
      "name": name.toString(),
      "advice1": advice1.toString()
    };

    printDebug(body.toString());
    return this.post('/api/Advices',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body), deserializer: (json) {
      return true;
    });
  }
}
