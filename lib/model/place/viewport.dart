import 'package:json_annotation/json_annotation.dart';

import 'location.dart';

part 'viewport.g.dart';

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