import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_shared/index.dart';

part 'person_model.g.dart';

@JsonSerializable()
class PersonModel extends Party {
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool isSelected = false;

  PersonModel({
    required super.id,
    required super.type,
    required super.name,
    super.phone,
    super.address,
    super.notes,
    required super.version,
    required super.isDeleted,
    required super.createdAt,
    required super.updatedAt,
    this.isSelected = false,
  });

  // Keep compatibility with old code if possible or refactor
  String get familyName => '';
  String get phoneNumber => phone ?? '';
  String get fullAddress => address ?? '';

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PersonModelToJson(this);
}
