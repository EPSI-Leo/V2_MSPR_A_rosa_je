import 'dart:convert';
import 'dart:io';

import 'package:arosa_je/core/api_client.dart';
import 'package:arosa_je/core/core.dart';
import 'package:arosa_je/core/local/session_manager/secure_storage_keys.dart';
import 'package:arosa_je/core/local/session_manager/session_manager.dart';
import 'package:camera/camera.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_add_plant.g.dart';

@riverpod
ApiAddPlants apiAddPlants(ApiAddPlantsRef ref) {
  final client = Client();
  final sessionManager = ref.read(sessionManagerProvider);

  return ApiAddPlants(
    innerClient: client,
    sessionManager: sessionManager,
  );
}

class ApiAddPlants extends ApiClient {
  ApiAddPlants({
    required super.innerClient,
    required this.sessionManager,
  });

  final SessionManager sessionManager;

  Future<bool?> postNewPlant(
    String name,
    String beginAt,
    String endAt,
    String description,
    XFile picture,
  ) async {
    final currentLocation = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    final idUser =
        await sessionManager.readSecureStorage(SecureStorageKeys.userInfos);

    // Encode image bytes
    String base64Image = await encodeImage(picture);

    var body = {
      "id": "0",
      "idUser": "$idUser",
      "name": name,
      "beginAt": beginAt,
      "endAt": endAt,
      "description": description,
      "picture": base64Image,
      "latitude": currentLocation.latitude,
      "longitude": currentLocation.longitude,
    };
    printDebug(body.toString());

    return this.post(
      '/api/Plants/CreatePlant',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
      deserializer: (json) {
        return true;
      },
    );
  }

  Future<String> encodeImage(XFile picture) async {
    File imageFile = File(picture.path);

    List<int> imageBytes = await imageFile.readAsBytes();
    return base64Encode(imageBytes);
  }
}
