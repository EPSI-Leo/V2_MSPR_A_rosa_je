import 'package:arosa_je/core/api_client.dart';
import 'package:arosa_je/core/data/entities/plant/plants.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_all_plants.g.dart';

@riverpod
ApiAllPlants apiAllPlants(ApiAllPlantsRef ref) {
  final client = Client();

  return ApiAllPlants(
    innerClient: client,
  );
}

class ApiAllPlants extends ApiClient {
  ApiAllPlants({
    required super.innerClient,
  });

  Future<Plants?> allPlants() async {
    return this.get(
      '/api/Plants/GetAllPlants',
      deserializer: (json) => Plants.fromJson(json as Map<String, dynamic>),
    );
  }
}
