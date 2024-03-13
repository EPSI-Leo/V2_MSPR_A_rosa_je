import 'package:arosa_je/core/data/sources/remote/plants/api_add_plant.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_plants_repository.g.dart';

@riverpod
AddPlantsRepository addPlantsRepository(AddPlantsRepositoryRef ref) {
  final api = ref.watch(apiAddPlantsProvider);

  return AddPlantsRepository(
    api: api,
  );
}

class AddPlantsRepository {
  const AddPlantsRepository({
    required this.api,
  });
  final ApiAddPlants api;

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

    await api.postNewPlant(
      name,
      formattedBeginAt,
      formattedEndAt,
      description,
      picture,
    );
    return true;
  }
}
