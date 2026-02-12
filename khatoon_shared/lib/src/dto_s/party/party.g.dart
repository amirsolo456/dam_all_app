// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Party _$PartyFromJson(Map json) => Party(
  id: (json['id'] as num).toInt(),
  type: json['type'] as String,
  name: json['name'] as String,
  contact: json['contact'] as String?,
);

Map<String, dynamic> _$PartyToJson(Party instance) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'name': instance.name,
  'contact': instance.contact,
};
