import 'package:arosa_je/core/data/repositories/plants/add_plants/add_plants_repository.dart';
import 'package:arosa_je/modules/plants/add_plants/model/add_plant_status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier.g.dart';

@Riverpod(keepAlive: false)
class AddPlants extends _$AddPlants {
  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<void> addPlants(
    String name,
    String beginAt,
    String endAt,
    String description,
    picture,
  ) async {
    state = const AsyncLoading();

    final addPlantsRepository = ref.read(addPlantsRepositoryProvider);
    state = await AsyncValue.guard(() => addPlantsRepository.addPlants(
          name,
          beginAt,
          endAt,
          description,
          picture,
        ));
  }
}

@Riverpod(keepAlive: false)
class AddPlantsForm extends _$AddPlantsForm {
  @override
  AddPlantStatus build() {
    return AddPlantStatus();
  }

  void setName(String name) {
    state = state.copyWith(
      name: name,
    );

    isFieldsEmpty();
  }

  void setBeginAt(String beginAt) {
    state = state.copyWith(
      beginAt: beginAt,
    );

    isFieldsEmpty();
  }

  void setEndAt(String endAt) {
    state = state.copyWith(
      endAt: endAt,
    );

    isFieldsEmpty();
  }

  void setDescription(String description) {
    state = state.copyWith(
      description: description,
    );

    isFieldsEmpty();
  }

  void setIsButtonActive(bool isActive) {
    state = state.copyWith(
      isButtonActive: isActive,
    );
  }

  void isFieldsEmpty() {
    setIsButtonActive(state.name.isNotEmpty &&
        state.beginAt.isNotEmpty &&
        state.endAt.isNotEmpty &&
        state.description.isNotEmpty);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}
