import 'package:arosa_je/core/data/entities/plant/plants.dart';
import 'package:arosa_je/core/data/sources/remote/plants/api_my_plants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_plants_repository.g.dart';

@riverpod
MyPlantsRepository myPlantsRepository(MyPlantsRepositoryRef ref) {
  final api = ref.watch(apiMyPlantsProvider);

  return MyPlantsRepository(
    api: api,
  );
}

class MyPlantsRepository {
  const MyPlantsRepository({
    required this.api,
  });
  final ApiMyPlants api;

  Future<Plants?> myPlants() async {
    return await api.myplants();
  }
}
