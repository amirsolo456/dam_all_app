import 'package:json_annotation/json_annotation.dart';
import '../enum/enum.dart';

part 'animal_dto.g.dart';

@JsonSerializable()
class AnimalDTO {
  final int id;
  final String tagNumber;
  final String? name;
  final AnimalType type;
  final String? breed;
  final Gender gender;
  final DateTime? birthDate;
  final DateTime? purchaseDate;
  final double? purchasePrice;
  final String? purchaseSource;
  final double? currentWeight;
  final String? color;
  final HealthStatus? healthStatus;
  final ReproductionStatus? reproductionStatus;
  final String? notes;
  final int version;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  AnimalDTO({
    required this.id,
    required this.tagNumber,
    this.name,
    required this.type,
    this.breed,
    required this.gender,
    this.birthDate,
    this.purchaseDate,
    this.purchasePrice,
    this.purchaseSource,
    this.currentWeight,
    this.color,
    this.healthStatus,
    this.reproductionStatus,
    this.notes,
    required this.version,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AnimalDTO.fromJson(Map<String, dynamic> json) =>
      _$AnimalDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AnimalDTOToJson(this);
}
