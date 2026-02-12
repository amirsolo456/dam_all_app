import 'package:json_annotation/json_annotation.dart';

part 'coordinates.g.dart';

@JsonSerializable()
class Coordinates {
  final double latitude;
  final double longitude;

  Coordinates({required this.latitude, required this.longitude});

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);

  factory Coordinates.fromJson(Map<String, dynamic> map) =>
      _$CoordinatesFromJson(map);
}
