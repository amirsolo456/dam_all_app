// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimalDTO _$AnimalDTOFromJson(Map json) => AnimalDTO(
  id: (json['id'] as num).toInt(),
  tagNumber: json['tagNumber'] as String,
  name: json['name'] as String?,
  type: $enumDecode(_$AnimalTypeEnumMap, json['type']),
  breed: json['breed'] as String?,
  gender: $enumDecode(_$GenderEnumMap, json['gender']),
  birthDate: json['birthDate'] == null
      ? null
      : DateTime.parse(json['birthDate'] as String),
  purchaseDate: json['purchaseDate'] == null
      ? null
      : DateTime.parse(json['purchaseDate'] as String),
  purchasePrice: (json['purchasePrice'] as num?)?.toDouble(),
  purchaseSource: json['purchaseSource'] as String?,
  currentWeight: (json['currentWeight'] as num?)?.toDouble(),
  color: json['color'] as String?,
  healthStatus: $enumDecodeNullable(
    _$HealthStatusEnumMap,
    json['healthStatus'],
  ),
  reproductionStatus: $enumDecodeNullable(
    _$ReproductionStatusEnumMap,
    json['reproductionStatus'],
  ),
  notes: json['notes'] as String?,
  version: (json['version'] as num).toInt(),
  isDeleted: json['isDeleted'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$AnimalDTOToJson(AnimalDTO instance) => <String, dynamic>{
  'id': instance.id,
  'tagNumber': instance.tagNumber,
  'name': instance.name,
  'type': _$AnimalTypeEnumMap[instance.type]!,
  'breed': instance.breed,
  'gender': _$GenderEnumMap[instance.gender]!,
  'birthDate': instance.birthDate?.toIso8601String(),
  'purchaseDate': instance.purchaseDate?.toIso8601String(),
  'purchasePrice': instance.purchasePrice,
  'purchaseSource': instance.purchaseSource,
  'currentWeight': instance.currentWeight,
  'color': instance.color,
  'healthStatus': _$HealthStatusEnumMap[instance.healthStatus],
  'reproductionStatus':
      _$ReproductionStatusEnumMap[instance.reproductionStatus],
  'notes': instance.notes,
  'version': instance.version,
  'isDeleted': instance.isDeleted,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

const _$AnimalTypeEnumMap = {
  AnimalType.cow: 'cow',
  AnimalType.sheep: 'sheep',
  AnimalType.goat: 'goat',
  AnimalType.camel: 'camel',
  AnimalType.horse: 'horse',
  AnimalType.poultry: 'poultry',
  AnimalType.other: 'other',
};

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
};

const _$HealthStatusEnumMap = {
  HealthStatus.excellent: 'excellent',
  HealthStatus.good: 'good',
  HealthStatus.average: 'average',
  HealthStatus.recovering: 'recovering',
  HealthStatus.underTreatment: 'underTreatment',
  HealthStatus.critical: 'critical',
  HealthStatus.unknown: 'unknown',
};

const _$ReproductionStatusEnumMap = {
  ReproductionStatus.pregnant: 'pregnant',
  ReproductionStatus.readyForPregnancy: 'readyForPregnancy',
  ReproductionStatus.recentlyGaveBirth: 'recentlyGaveBirth',
  ReproductionStatus.notReady: 'notReady',
  ReproductionStatus.infertile: 'infertile',
  ReproductionStatus.unknown: 'unknown',
};
