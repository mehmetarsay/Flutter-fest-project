// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'street_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreetUserData _$StreetUserDataFromJson(Map<String, dynamic> json) =>
    StreetUserData(
      id: json['id'] as String?,
      carPark: json['carPark'] as int?,
      smell: json['smell'] as int?,
      electricityQuality: json['electricityQuality'] as int?,
      internetQuality: json['internetQuality'] as int?,
      buildQuality: json['buildQuality'] as int?,
      waterQuality: json['waterQuality'] as int?,
    );

Map<String, dynamic> _$StreetUserDataToJson(StreetUserData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'carPark': instance.carPark,
      'smell': instance.smell,
      'buildQuality': instance.buildQuality,
      'internetQuality': instance.internetQuality,
      'electricityQuality': instance.electricityQuality,
      'waterQuality': instance.waterQuality,
    };
