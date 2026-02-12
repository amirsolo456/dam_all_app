import 'package:json_annotation/json_annotation.dart';

part 'party.g.dart';

@JsonSerializable()
class Party {
  final int id;
  final String type; // customer, supplier, etc
  final String name;
  final String? contact;

  Party({
    required this.id,
    required this.type,
    required this.name,
    this.contact,
  });

  factory Party.fromJson(Map<String, dynamic> json) =>
      _$PartyFromJson(json);

  Map<String, dynamic> toJson() => _$PartyToJson(this);
}
