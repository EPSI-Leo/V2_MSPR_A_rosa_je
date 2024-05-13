// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdviceImpl _$$AdviceImplFromJson(Map<String, dynamic> json) => _$AdviceImpl(
      id: json['id'] as int,
      idUser: json['idUser'] as int,
      idPlant: json['idPlant'] as int?,
      name: json['name'] as String,
      advice1: json['advice1'] as String,
    );

Map<String, dynamic> _$$AdviceImplToJson(_$AdviceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idUser': instance.idUser,
      'idPlant': instance.idPlant,
      'name': instance.name,
      'advice1': instance.advice1,
    };
