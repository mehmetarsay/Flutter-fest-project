import 'package:json_annotation/json_annotation.dart';
import 'package:zam/core/base/base_model.dart';

part 'user.g.dart';

@JsonSerializable()
class MyUser extends BaseModel {

  String? id;
  String? name;
  String? surname;
  String? email;

  MyUser({this.id, this.name, this.surname, this.email});

  @override
  fromJson(Map<String, dynamic> json) => _$MyUserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MyUserToJson(this);
}
