import 'package:freezed_annotation/freezed_annotation.dart';

part 'advice.freezed.dart';
part 'advice.g.dart';

@freezed
class Advice with _$Advice {
  const factory Advice({
    required int id,
    required int? idUser,
    int? idPlant,
    required String name,
    required String advice1,
  }) = _Advice;

  factory Advice.fromJson(Map<String, dynamic> json) => _$AdviceFromJson(json);
}
