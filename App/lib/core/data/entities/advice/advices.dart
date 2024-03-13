import 'package:arosa_je/core/data/entities/advice/advice.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'advices.freezed.dart';
part 'advices.g.dart';

@freezed
class Advices with _$Advices {
  const factory Advices({
    required int? totalItems,
    required List<Advice>? advices,
  }) = _Advices;

  factory Advices.fromJson(Map<String, dynamic> json) =>
      _$AdvicesFromJson(json);
}
