import 'package:arosa_je/core/data/entities/plant/plants.dart';
import 'package:arosa_je/core/data/repositories/plants/all_plants/all_plants_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier.g.dart';

@Riverpod(keepAlive: false)
class AllPlants extends _$AllPlants {
  @override
  FutureOr<Plants?> build() {
    return fetchAllPlants();
  }

  Future<Plants?> fetchAllPlants() async {
    final repository = ref.read(allPlantsRepositoryProvider);
    final plants = await repository.allPlants();
    print(await plants.toString());
    return plants;
  }
}
