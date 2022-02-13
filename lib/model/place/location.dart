import 'package:json_annotation/json_annotation.dart';

import '../../core/base/base_model.dart';

part 'location.g.dart';

@JsonSerializable()
class Location extends BaseModel{
  Location({
    this.lat,
    this.lng,
  });

  double? lat;
  double? lng;


  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);


  @override
  Map<String, dynamic> toJson() => _$LocationToJson(this);


  @override
  fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);



}