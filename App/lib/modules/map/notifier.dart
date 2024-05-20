import 'package:arosa_je/core/data/entities/plant/plant.dart';
import 'package:arosa_je/core/data/repositories/plants/plants/plants_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier.g.dart';

@Riverpod(keepAlive: false)
class AllPlants extends _$AllPlants {
  @override
  FutureOr<List<Plant>?> build() {
    return fetchAllPlants();
  }

  Future<List<Plant>?> fetchAllPlants() async {
    final repository = ref.read(plantsRepositoryProvider);
    final plants = await repository.allPlants();
    return plants;
  }
}
