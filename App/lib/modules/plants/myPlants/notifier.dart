import 'package:arosa_je/core/data/entities/plant/plant.dart';
import 'package:arosa_je/core/data/entities/plant/plants.dart';
import 'package:arosa_je/core/data/repositories/plants/plants/plants_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier.g.dart';

@Riverpod(keepAlive: false)
class MyPlants extends _$MyPlants {
  @override
  FutureOr<List<Plant>?> build() {
    return fetchMyPlants();
  }

  Future<List<Plant>?> fetchMyPlants() async {
    final repository = ref.read(plantsRepositoryProvider);
    final plants = await repository.myPlants();
    return plants;
  }
}
