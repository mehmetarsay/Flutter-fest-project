
import 'package:json_annotation/json_annotation.dart';
import 'package:zam/core/base/base_model.dart';
part 'place_user_data.g.dart';

@JsonSerializable()
class PlaceUserData {
  String? id;
  int? buildingAge;//bina yaşı
  int? rentMoney;//Kira ücreti
  int? durability; //dayanıklılık 1-5 arası puan
  int? internetQuality; //internet  1-5 arası puan
  int? electricityQuality; //elektirik  1-5 arası puan
  int? waterQuality; //su  1-5 arası puan
  int? plumbingQuality; //tesisat kalitesi

PlaceUserData({
  this.id,
  this.buildingAge,
  this.durability,
  this.electricityQuality,
  this.internetQuality,
  this.plumbingQuality,
  this.rentMoney,
  this.waterQuality,
});

  @override
  factory PlaceUserData.fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return _$PlaceUserDataFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    return _$PlaceUserDataToJson(this);
  }


}