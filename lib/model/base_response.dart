import 'package:json_annotation/json_annotation.dart';
import 'package:zam/core/base/base_model.dart';


part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse extends BaseModel{
  BaseResponse({
    this.htmlAttributions,
    this.results,
    this.status,
  });

  @JsonKey(name: 'html_attributions')
  List<dynamic>? htmlAttributions;
  Object? results;
  String? status;

  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);
  @override
  fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);


}


