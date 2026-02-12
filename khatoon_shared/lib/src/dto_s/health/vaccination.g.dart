// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vaccination _$VaccinationFromJson(Map json) {
  $checkKeys(json, requiredKeys: const ['name', 'date']);
  return Vaccination(
    name: json['name'] as String,
    date: const DateTimeConverter().fromJson(json['date'] as String),
    nextDueDate: const DateTimeNullableConverter().fromJson(
      json['nextDueDate'] as String?,
    ),
    notes: json['notes'] as String?,
  );
}

Map<String, dynamic> _$VaccinationToJson(
  Vaccination instance,
) => <String, dynamic>{
  'name': instance.name,
  'date': const DateTimeConverter().toJson(instance.date),
  'nextDueDate': const DateTimeNullableConverter().toJson(instance.nextDueDate),
  'notes': instance.notes,
};
