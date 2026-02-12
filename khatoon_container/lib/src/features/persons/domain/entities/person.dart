import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  final int id;
  final String name;
  final String familyName;
  final String phoneNumber;
  final String town;
  final String street;
  final String fullAddress;
  final String description;
  final int createDate;

  const Person(
    this.id, {
    required this.town,
    required this.street,
    required this.fullAddress,
    required this.description,
    required this.name,
    required this.familyName,
    required this.phoneNumber,
    required this.createDate,
  });

  factory Person.fromJson(Map<String, dynamic> json) =>
      _$PersonFromJson(json);


  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
