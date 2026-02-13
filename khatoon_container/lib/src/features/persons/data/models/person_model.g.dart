// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonModel _$PersonModelFromJson(Map<String, dynamic> json) => PersonModel(
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

Map<String, dynamic> _$PersonModelToJson(PersonModel instance) =>
    <String, dynamic>{
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
