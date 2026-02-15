import 'package:khatoon_container/src/features/animal/domain/entities/animal.dart';
import 'package:khatoon_shared/index.dart';

class AnimalModel extends Animal {
    AnimalModel({
    required super.id,
    super.name,
    required super.tagNumber,
    super.breed,
    required super.type,
    required super.gender,
    super.birthDate,
    super.purchasePrice,
    super.estimatedValue,
    super.purchaseSource,
    super.notes,
    super.isActive = true,
    required super.version,
    required super.isDeleted,
    required super.createdAt,
    required super.updatedAt,
    HealthStatus? healthStatus,
    super.reproductionStatus,
  }) : super(
         healthStatus: healthStatus ?? HealthStatus.good,
       );

  factory AnimalModel.fromJson(Map<String, dynamic> json) {
    return AnimalModel(
      id: json['id'] as int,
      name: (json['name'] as String?)?.trim(),
      tagNumber: json['tagNumber'] as String,
      breed: (json['breed'] as String?)?.trim(),
      type: AnimalType.values.firstWhere(
        (AnimalType e) => e.name == (json['type'] ?? ''),
        orElse: () => AnimalType.sheep,
      ),
      gender: Gender.values.firstWhere(
        (Gender e) => e.name == (json['gender'] ?? ''),
        orElse: () => Gender.male,
      ),
      birthDate: json['birthDate'] != null
          ? DateTime.parse(json['birthDate'])
          : null,
      purchasePrice: json['purchasePrice'] != null
          ? (json['purchasePrice'] as num).toDouble()
          : null,
      estimatedValue: json['estimatedValue'] != null
          ? (json['estimatedValue'] as num).toDouble()
          : null,
      purchaseSource: (json['purchaseSource'] as String?)?.trim(),
      notes: (json['notes'] as String?)?.trim(),
      isActive: json['isActive'] == null || (json['isActive'] as bool),
      healthStatus: json['healthStatus'] != null
          ? (json['healthStatus'] is int
              ? HealthStatus.values[json['healthStatus']]
              : HealthStatus.values.firstWhere((e) => e.name == json['healthStatus']))
          : HealthStatus.good,
      reproductionStatus: json['reproductionStatus'] != null
          ? (json['reproductionStatus'] is int
              ? ReproductionStatus.values[json['reproductionStatus']]
              : ReproductionStatus.values.firstWhere((e) => e.name == json['reproductionStatus']))
          : ReproductionStatus.notReady,
      version: json['version'] ?? 0,
      isDeleted: json['isDeleted'] ?? false,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'tagNumber': tagNumber,
      'breed': breed,
      'type': type.name,
      'gender': gender.name,
      'birthDate': birthDate?.toIso8601String(),
      'purchasePrice': purchasePrice,
      'estimatedValue': estimatedValue,
      'purchaseSource': purchaseSource,
      'notes': notes,
      'isActive': isActive,
      'healthStatus': healthStatus?.name,
      'reproductionStatus': reproductionStatus?.name,
      'version': version,
      'isDeleted': isDeleted,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
