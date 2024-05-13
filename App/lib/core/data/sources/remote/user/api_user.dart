import 'dart:io';

import 'package:arosa_je/core/api_client.dart';
import 'package:arosa_je/core/arosaje_endpoints.dart';
import 'package:arosa_je/core/data/entities/user/user.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_user.g.dart';

@riverpod
ApiUser apiUser(ApiUserRef ref) {
  final client = Client();

  return ApiUser(
    innerClient: client,
  );
}

class ApiUser extends ApiClient {
  ApiUser({
    required super.innerClient,
  });

  Future<User?> getUserInfos(String? token) async {
    return this.get(ArosajeEndpoints.userInfos, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    }, deserializer: (json) {
      return User.fromJson(json as Map<String, dynamic>);
    });
  }
}
