import 'package:freezed_annotation/freezed_annotation.dart';

part 'plant.freezed.dart';
part 'plant.g.dart';

@freezed
class Plant with _$Plant {
  const factory Plant({
    required int? id,
    required int? idUser,
    required String? name,
    required String? beginAt,
    required String? endAt,
    required String? description,
    required String? picture,
    required double? latitude,
    required double? longitude,
  }) = _Plant;

  factory Plant.fromJson(Map<String, dynamic> json) => _$PlantFromJson(json);
}
