// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdvicesImpl _$$AdvicesImplFromJson(Map<String, dynamic> json) =>
    _$AdvicesImpl(
      totalItems: json['totalItems'] as int,
      advices: (json['advices'] as List<dynamic>?)
          ?.map((e) => Advice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AdvicesImplToJson(_$AdvicesImpl instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'advices': instance.advices,
    };
