import 'package:json_annotation/json_annotation.dart';

part 'party.g.dart';

@JsonSerializable()
class Party {
  final int id;
  final String type; // customer, supplier, etc
  final String name;
  final String? phone;
  final String? address;
  final String? notes;
  final int version;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  Party({
    required this.id,
    required this.type,
    required this.name,
    this.phone,
    this.address,
    this.notes,
    required this.version,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Party.fromJson(Map<String, dynamic> json) =>
      _$PartyFromJson(json);

  Map<String, dynamic> toJson() => _$PartyToJson(this);
}
