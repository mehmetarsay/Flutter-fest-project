// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceUserData _$PlaceUserDataFromJson(Map<String, dynamic> json) =>
    PlaceUserData(
      id: json['id'] as String?,
      buildingAge: json['buildingAge'] as int?,
      durability: json['durability'] as int?,
      electricityQuality: json['electricityQuality'] as int?,
      internetQuality: json['internetQuality'] as int?,
      plumbingQuality: json['plumbingQuality'] as int?,
      rentMoney: json['rentMoney'] as int?,
      waterQuality: json['waterQuality'] as int?,
    );

Map<String, dynamic> _$PlaceUserDataToJson(PlaceUserData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'buildingAge': instance.buildingAge,
      'rentMoney': instance.rentMoney,
      'durability': instance.durability,
      'internetQuality': instance.internetQuality,
      'electricityQuality': instance.electricityQuality,
      'waterQuality': instance.waterQuality,
      'plumbingQuality': instance.plumbingQuality,
    };
