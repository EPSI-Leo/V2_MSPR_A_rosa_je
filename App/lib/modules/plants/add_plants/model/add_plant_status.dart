import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_plant_status.freezed.dart';

@freezed
class AddPlantStatus with _$AddPlantStatus {
  factory AddPlantStatus({
    @Default('') String name,
    @Default('') String beginAt,
    @Default('') String endAt,
    @Default('') String description,
    @Default(false) bool isButtonActive,
    @Default(false) bool isLoading,
  }) = _AddPlantStatus;
}
