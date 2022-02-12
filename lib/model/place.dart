
import 'package:json_annotation/json_annotation.dart';

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

@JsonSerializable()
class AddressComponent {
  AddressComponent({
    this.longName,
    this.shortName,
    this.types,
  });

  String? longName;
  String? shortName;
  List<String>? types;
  @override
  factory AddressComponent.fromJson(Map<String, dynamic> json) => _$AddressComponentFromJson(json);
}

@JsonSerializable()
class Geometry {
  Geometry({
    this.location,
    this.viewport,
  });

  Location? location;
  Viewport? viewport;
  @override
  factory Geometry.fromJson(Map<String, dynamic> json) => _$GeometryFromJson(json);
}

@JsonSerializable()
class Location {
  Location({
    this.lat,
    this.lng,
  });

  double? lat;
  double? lng;

  @override
  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}

@JsonSerializable()
class Viewport {
  Viewport({
    this.northeast,
    this.southwest,
  });

  Location? northeast;
  Location? southwest;

  @override
  factory Viewport.fromJson(Map<String, dynamic> json) => _$ViewportFromJson(json);
}
