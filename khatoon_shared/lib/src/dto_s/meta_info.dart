import 'package:json_annotation/json_annotation.dart';

part 'meta_info.g.dart';

@JsonSerializable()
class MetaInfo {
  final String? title;
  final String? description;
  final String? keywords;

  MetaInfo({this.title, this.description, this.keywords});

  factory MetaInfo.fromJson(Map<String, dynamic> json) =>
      _$MetaInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MetaInfoToJson(this);
}
