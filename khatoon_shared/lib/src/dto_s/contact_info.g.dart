// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactInfo _$ContactInfoFromJson(Map json) {
  $checkKeys(json, requiredKeys: const ['name', 'phone']);
  return ContactInfo(
    email: json['email'] as String?,
    name: json['name'] as String,
    address: json['address'] as String?,
    phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$ContactInfoToJson(ContactInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
    };
