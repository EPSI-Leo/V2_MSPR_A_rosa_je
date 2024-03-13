import 'package:arosa_je/core/data/entities/plant/plant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plants.freezed.dart';
part 'plants.g.dart';

@freezed
class Plants with _$Plants {
  const factory Plants({
    required int totalItems,
    required List<Plant>? plants,
  }) = _Plants;

  factory Plants.fromJson(Map<String, dynamic> json) => _$PlantsFromJson(json);
}
