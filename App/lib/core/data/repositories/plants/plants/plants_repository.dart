import 'package:arosa_je/core/data/entities/plant/plant.dart';
import 'package:arosa_je/core/data/entities/plant/plant_with_advices.dart';
import 'package:arosa_je/core/data/sources/remote/plants/api_plants.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'plants_repository.g.dart';

@riverpod
PlantsRepository plantsRepository(PlantsRepositoryRef ref) {
  final api = ref.watch(apiPlantsProvider);

  return PlantsRepository(
    api: api,
  );
}

class PlantsRepository {
  const PlantsRepository({
    required this.api,
  });
  final ApiPlants api;

  Future<bool> addPlants(
    String name,
    String beginAt,
    String endAt,
    String description,
    picture,
  ) async {
    // Conversion de beginAt
    DateTime beginDateTime = DateFormat('dd/MM/yyyy').parse(beginAt);
    String formattedBeginAt =
        DateFormat('yyyy-MM-ddTHH:mm:ss.sssZ').format(beginDateTime);

    // Conversion de endAt
    DateTime endDateTime = DateFormat('dd/MM/yyyy').parse(endAt);
    String formattedEndAt =
        DateFormat('yyyy-MM-ddTHH:mm:ss.sssZ').format(endDateTime);

    return await api.addPlants(
      name,
      formattedBeginAt,
      formattedEndAt,
      description,
      picture,
    );
  }

  Future<List<MyPlantsWithAdvices>?> myPlants() async {
    return await api.myPlants();
  }

  Future<List<Plant>?> allPlants() async {
    return await api.allPlants();
  }
}
