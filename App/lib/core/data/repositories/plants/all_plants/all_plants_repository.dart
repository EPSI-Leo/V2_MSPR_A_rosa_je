import 'package:arosa_je/core/data/entities/plant/plants.dart';
import 'package:arosa_je/core/data/sources/remote/plants/api_all_plants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'all_plants_repository.g.dart';

@riverpod
AllPlantsRepository allPlantsRepository(AllPlantsRepositoryRef ref) {
  final api = ref.watch(apiAllPlantsProvider);

  return AllPlantsRepository(
    api: api,
  );
}

class AllPlantsRepository {
  const AllPlantsRepository({
    required this.api,
  });
  final ApiAllPlants api;

  Future<Plants?> allPlants() async {
    return await api.allPlants();
  }
}
