import 'package:json_annotation/json_annotation.dart';

import 'location.dart';
import 'viewport.dart';

part 'geometry.g.dart';

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