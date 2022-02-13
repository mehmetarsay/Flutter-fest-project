
import 'package:json_annotation/json_annotation.dart';
import 'package:zam/core/base/base_model.dart';

import 'place/address_component.dart';
import 'place/geometry.dart';
import 'place/location.dart';
import 'place/viewport.dart';

part 'place.g.dart';

@JsonSerializable()
class Place {
  Place({
    this.htmlAttributions,
    this.result,
    this.status,
  });

  List<dynamic>? htmlAttributions;
  Result? result;
  String? status;

  @override
  fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
}

@JsonSerializable()
class Result {
  Result({
    this.addressComponents,
    this.adrAddress,
    this.formattedAddress,
    this.geometry,
    this.icon,
    this.iconBackgroundColor,
    this.iconMaskBaseUri,
    this.name,
    this.placeId,
    this.reference,
    this.types,
    this.url,
    this.utcOffset,
  });

  List<AddressComponent>? addressComponents;
  String? adrAddress;
  String? formattedAddress;
  Geometry? geometry;
  String? icon;
  String? iconBackgroundColor;
  String? iconMaskBaseUri;
  String? name;
  String? placeId;
  String? reference;
  List<String>? types;
  String? url;
  int? utcOffset;

  @override
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}





