import 'dart:convert';

import 'package:arosa_je/core/api_client.dart';
import 'package:arosa_je/core/data/entities/plant/plants.dart';
import 'package:arosa_je/core/local/session_manager/secure_storage_keys.dart';
import 'package:arosa_je/core/local/session_manager/session_manager.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_my_plants.g.dart';

@riverpod
ApiMyPlants apiMyPlants(ApiMyPlantsRef ref) {
  final client = Client();
  final sessionManager = ref.read(sessionManagerProvider);

  return ApiMyPlants(
    innerClient: client,
    sessionManager: sessionManager,
  );
}

class ApiMyPlants extends ApiClient {
  ApiMyPlants({
    required super.innerClient,
    required this.sessionManager,
  });

  final SessionManager sessionManager;

  Future<Plants?> myplants() async {
    final userInfos =
        await sessionManager.readSecureStorage(SecureStorageKeys.userInfos);
    if (userInfos != null) {
      final String idUser = userInfos;
      return this.get(
        '/api/Plants/GetPlantsByUserId/$idUser',
        deserializer: (json) => Plants.fromJson(json as Map<String, dynamic>),
      );
    }
    return null;
  }
}
