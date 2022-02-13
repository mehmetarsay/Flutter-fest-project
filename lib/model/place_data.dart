import 'package:json_annotation/json_annotation.dart';
import 'package:zam/core/base/base_model.dart';
import 'package:zam/model/place_user_data.dart';

import 'place/location.dart';

part 'place_data.g.dart';

locationToJson(Location? location){
  return location!.toJson();
}

@JsonSerializable()
class PlaceData extends BaseModel{
  @JsonKey(toJson: locationToJson)
  Location? location;
  String? title;
  String? type;
  String? placeId;
  List<PlaceUserData>? userlist;
  DateTime? date;

  PlaceData({
    this.location,
    this.title,
    this.placeId,
    this.type,
    this.userlist,
    this.date
  });

  @override
  fromJson(Map<String, dynamic> json) => _$PlaceDataFromJson(json);


  @override
  Map<String, dynamic> toJson() => _$PlaceDataToJson(this);

}