import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_container/src/features/persons/domain/entities/person.dart';

part 'person_model.g.dart';

@JsonSerializable()
class PersonModel extends Person {
  @JsonKey(includeFromJson: false, includeToJson: false)
  late bool isSelected;

  PersonModel(
    super.id, {
    required super.town,
    required super.street,
    required super.fullAddress,
    required super.description,
    required super.name,
    required super.familyName,
    required super.phoneNumber,
    required super.createDate,
    this.isSelected = false,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PersonModelToJson(this);
}
