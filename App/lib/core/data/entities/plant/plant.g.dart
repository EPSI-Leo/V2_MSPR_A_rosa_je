// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlantImpl _$$PlantImplFromJson(Map<String, dynamic> json) => _$PlantImpl(
      id: json['id'] as int?,
      idUser: json['idUser'] as int?,
      name: json['name'] as String?,
      beginAt: json['beginAt'] as String?,
      endAt: json['endAt'] as String?,
      description: json['description'] as String?,
      picture: json['picture'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      userFirebaseUid: json['userFirebaseUid'] as String,
      userUsername: json['userUsername'] as String,
    );

Map<String, dynamic> _$$PlantImplToJson(_$PlantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idUser': instance.idUser,
      'name': instance.name,
      'beginAt': instance.beginAt,
      'endAt': instance.endAt,
      'description': instance.description,
      'picture': instance.picture,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'userFirebaseUid': instance.userFirebaseUid,
      'userUsername': instance.userUsername,
    };
