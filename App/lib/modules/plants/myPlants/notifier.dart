import 'package:arosa_je/core/data/entities/plant/plants.dart';
import 'package:arosa_je/core/data/repositories/plants/my_plants/my_plants_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier.g.dart';

@Riverpod(keepAlive: false)
class MyPlants extends _$MyPlants {
  @override
  FutureOr<Plants?> build() {
    return fetchMyPlants();
  }

  Future<Plants?> fetchMyPlants() async {
    final repository = ref.read(myPlantsRepositoryProvider);
    final plants = await repository.myPlants();
    return plants;
  }
}
