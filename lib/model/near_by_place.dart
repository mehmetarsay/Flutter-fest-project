import 'package:json_annotation/json_annotation.dart';
import 'package:zam/core/base/base_model.dart';
import 'place/geometry.dart';

part 'near_by_place.g.dart';

@JsonSerializable()
class NearByPlace extends BaseModel{
  NearByPlace({
    this.businessStatus,
    this.geometry,
    this.icon,
    this.iconBackgroundColor,
    this.iconMaskBaseUri,
    this.name,
    this.placeId,
    this.rating,
    this.reference,
    this.scope,
    this.types,
    this.userRatingsTotal,
    this.vicinity,
  });

  String? businessStatus;
  Geometry? geometry;
  String? icon;
  String? iconBackgroundColor;
  String? iconMaskBaseUri;
  String? name;
  String? placeId;
  double? rating;
  String? reference;
  String? scope;
  List<String>? types;
  int? userRatingsTotal;
  String? vicinity;

  @override
  NearByPlace fromJson(Map<String, dynamic> json) => _$NearByPlaceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NearByPlaceToJson(this);
}



