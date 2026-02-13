// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livestock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LivestockSummary _$LivestockSummaryFromJson(Map<String, dynamic> json) =>
    LivestockSummary(
      id: json['id'] as String,
      tagNumber: json['tagNumber'] as String,
      name: json['name'] as String?,
      type: $enumDecode(_$AnimalTypeEnumMap, json['type']),
      breed: json['breed'] as String?,
      imageUrl: json['imageUrl'] as String?,
      healthStatus: $enumDecode(_$HealthStatusEnumMap, json['healthStatus']),
      reproductionStatus: $enumDecode(
        _$ReproductionStatusEnumMap,
        json['reproductionStatus'],
      ),
      lastCheckupDate: (json['lastCheckupDate'] as num?)?.toInt(),
      location: json['location'] as String?,
    );

Map<String, dynamic> _$LivestockSummaryToJson(LivestockSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tagNumber': instance.tagNumber,
      'name': instance.name,
      'type': _$AnimalTypeEnumMap[instance.type]!,
      'breed': instance.breed,
      'imageUrl': instance.imageUrl,
      'healthStatus': _$HealthStatusEnumMap[instance.healthStatus]!,
      'reproductionStatus':
          _$ReproductionStatusEnumMap[instance.reproductionStatus]!,
      'lastCheckupDate': instance.lastCheckupDate,
      'location': instance.location,
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
