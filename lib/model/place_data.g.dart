// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceData _$PlaceDataFromJson(Map<String, dynamic> json) => PlaceData(
      location: json['location'] == null
          ? null
          : MyLocation.fromJson(json['location'] as Map<String, dynamic>),
      title: json['title'] as String?,
      placeId: json['placeId'] as String?,
      type: json['type'] as String?,
      userlist: (json['userlist'] as List<dynamic>?)
          ?.map((e) => PlaceUserData.fromJson(e as Map<String, dynamic>))
          .toList(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$PlaceDataToJson(PlaceData instance) => <String, dynamic>{
      'location': locationToJson(instance.location),
      'title': instance.title,
      'type': instance.type,
      'placeId': instance.placeId,
      'userlist': instance.userlist,
      'date': instance.date?.toIso8601String(),
    };
