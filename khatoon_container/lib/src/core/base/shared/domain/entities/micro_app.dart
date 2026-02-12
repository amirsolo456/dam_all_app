import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_container/index.dart';

part 'micro_app.g.dart';

@JsonSerializable()
class MicroApp {
  final int userId;
  // @JsonEnum(alwaysCreate: true)
  final MicroAppsName microAppsName;
  final bool bookmarked;

  const MicroApp({
    required this.bookmarked,
    required this.userId,
    required this.microAppsName,
  });

  factory MicroApp.fromJson(Map<String, dynamic> json) =>
      _$MicroAppFromJson(json);


  Map<String, dynamic> toJson() => _$MicroAppToJson(this);
}
