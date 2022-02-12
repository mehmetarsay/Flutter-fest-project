
import 'package:json_annotation/json_annotation.dart';
import 'package:zam/core/base/base_model.dart';
part 'street_user_data.g.dart';

@JsonSerializable()
class StreetUserData {
  String? id;
  int? carPark;//araba park
  int? smell;//koku
  int? buildQuality; //yapım kalitesi
  int? internetQuality; //internet  1-5 arası puan
  int? electricityQuality; //elektirik  1-5 arası puan
  int? waterQuality; //su  1-5 arası puan

  StreetUserData({
    this.id,
    this.carPark,
    this.smell,
    this.electricityQuality,
    this.internetQuality,
    this.buildQuality,
    this.waterQuality,
  });

  @override
  factory StreetUserData.fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw _$StreetUserDataFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    return _$StreetUserDataToJson(this);
  }


}