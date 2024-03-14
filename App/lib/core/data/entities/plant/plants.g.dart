// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plants.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlantsImpl _$$PlantsImplFromJson(Map<String, dynamic> json) => _$PlantsImpl(
      totalItems: json['totalItems'] as int,
      plants: (json['plants'] as List<dynamic>?)
          ?.map((e) => Plant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PlantsImplToJson(_$PlantsImpl instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'plants': instance.plants,
    };
