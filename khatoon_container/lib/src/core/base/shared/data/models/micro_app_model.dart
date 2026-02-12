import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_container/src/core/base/shared/domain/entities/micro_app.dart';
import 'package:khatoon_container/src/core/event_base_core/utils/enum.dart';

part 'micro_app_model.g.dart';

@JsonSerializable()
class MicroAppModel extends MicroApp {


  MicroAppModel({
    required super.bookmarked,
    required super.userId,
    required super.microAppsName,

  });

  factory MicroAppModel.fromJson(Map<String, dynamic> json) =>
      _$MicroAppModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MicroAppModelToJson(this);
}
