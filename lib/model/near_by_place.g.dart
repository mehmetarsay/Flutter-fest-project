// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'near_by_place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NearByPlace _$NearByPlaceFromJson(Map<String, dynamic> json) => NearByPlace(
      businessStatus: json['businessStatus'] as String?,
      geometry: json['geometry'] == null
          ? null
          : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      icon: json['icon'] as String?,
      iconBackgroundColor: json['iconBackgroundColor'] as String?,
      iconMaskBaseUri: json['iconMaskBaseUri'] as String?,
      name: json['name'] as String?,
      placeId: json['placeId'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      reference: json['reference'] as String?,
      scope: json['scope'] as String?,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
      userRatingsTotal: json['userRatingsTotal'] as int?,
      vicinity: json['vicinity'] as String?,
    );

Map<String, dynamic> _$NearByPlaceToJson(NearByPlace instance) =>
    <String, dynamic>{
      'businessStatus': instance.businessStatus,
      'geometry': instance.geometry,
      'icon': instance.icon,
      'iconBackgroundColor': instance.iconBackgroundColor,
      'iconMaskBaseUri': instance.iconMaskBaseUri,
      'name': instance.name,
      'placeId': instance.placeId,
      'rating': instance.rating,
      'reference': instance.reference,
      'scope': instance.scope,
      'types': instance.types,
      'userRatingsTotal': instance.userRatingsTotal,
      'vicinity': instance.vicinity,
    };
