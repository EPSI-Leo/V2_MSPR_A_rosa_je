import 'dart:convert';
import 'dart:io';

import 'package:arosa_je/core/api_client.dart';
import 'package:arosa_je/core/arosaje_endpoints.dart';
import 'package:arosa_je/core/data/entities/plant/plant.dart';
import 'package:arosa_je/core/foundation/config.dart';
import 'package:arosa_je/core/local/session_manager/secure_storage_keys.dart';
import 'package:arosa_je/core/local/session_manager/session_manager.dart';
import 'package:camera/camera.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_plants.g.dart';

@riverpod
ApiPlants apiPlants(ApiPlantsRef ref) {
  final client = Client();
  final sessionManager = ref.read(sessionManagerProvider);
  final config = ref.watch(configProvider);

  return ApiPlants(
    innerClient: client,
    sessionManager: sessionManager,
    config: config,
  );
}

class ApiPlants extends ApiClient {
  ApiPlants({
    required super.innerClient,
    required this.sessionManager,
    required this.config,
  });

  final SessionManager sessionManager;

  final Config config;

  @override
  String get baseUrl => config.baseUrl;

  Future<bool> addPlants(
    String name,
    String beginAt,
    String endAt,
    String description,
    XFile picture,
  ) async {
    final currentLocation = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Encode image bytes
    String base64Image = await encodeImage(picture);

    var body = {
      "name": name,
      "beginAt": beginAt,
      "endAt": endAt,
      "description": description,
      "picture": base64Image,
      "latitude": currentLocation.latitude,
      "longitude": currentLocation.longitude,
    };

    final token =
        await sessionManager.readSecureStorage(SecureStorageKeys.token);

    this.post(
      ArosajeEndpoints.addPlant,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
      body: jsonEncode(body),
    );

    return true;
    /* if (response?.message == "Plante créée avec succès.") {
        return true;
      } else {
        return false;
      } */
  }

  Future<String> encodeImage(XFile picture) async {
    File imageFile = File(picture.path);

    List<int> imageBytes = await imageFile.readAsBytes();
    return base64Encode(imageBytes);
  }

  Future<List<Plant>?> myPlants() async {
    final token =
        await sessionManager.readSecureStorage(SecureStorageKeys.token);

    final response = await this.get(
      ArosajeEndpoints.getMyPlants,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
      deserializer: (json) {
        final List<dynamic> plantJsonList = json as List<dynamic>;
        return plantJsonList
            .map((plantJson) => Plant.fromJson(plantJson))
            .toList();
      },
    );

    if (response != null) {
      return response;
    } else {
      // Gérer le cas où la réponse est null ou n'est pas une liste de plantes
      return null;
    }
  }

  Future<List<Plant>?> allPlants() async {
    final token =
        await sessionManager.readSecureStorage(SecureStorageKeys.token);

    return this.get(
      ArosajeEndpoints.getAllPlants,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
      deserializer: (json) {
        final List<dynamic> plantJsonList = json as List<dynamic>;
        return plantJsonList
            .map((plantJson) => Plant.fromJson(plantJson))
            .toList();
      },
    );
  }
}
