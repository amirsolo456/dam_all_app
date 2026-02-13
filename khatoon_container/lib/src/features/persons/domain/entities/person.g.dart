// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
  (json['id'] as num).toInt(),
  town: json['town'] as String,
  street: json['street'] as String,
  fullAddress: json['fullAddress'] as String,
  description: json['description'] as String,
  name: json['name'] as String,
  familyName: json['familyName'] as String,
  phoneNumber: json['phoneNumber'] as String,
  createDate: (json['createDate'] as num).toInt(),
);

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'familyName': instance.familyName,
  'phoneNumber': instance.phoneNumber,
  'town': instance.town,
  'street': instance.street,
  'fullAddress': instance.fullAddress,
  'description': instance.description,
  'createDate': instance.createDate,
};
