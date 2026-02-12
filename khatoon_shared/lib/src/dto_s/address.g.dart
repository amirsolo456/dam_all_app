// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'id',
      'province',
      'city',
      'street',
      'plaque',
      'postalCode',
    ],
  );
  return Address(
    province: json['province'] as String,
    city: json['city'] as String,
    district: json['district'] as String?,
    street: json['street'] as String,
    alley: json['alley'] as String?,
    plaque: json['plaque'] as String,
    floor: json['floor'] as String?,
    unit: json['unit'] as String?,
    postalCode: json['postalCode'] as String,
    coordinates: const LatLngNullableConverter().fromJson(
      json['coordinates'] as Map<String, dynamic>?,
    ),
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
  'id': instance.id,
  'province': instance.province,
  'city': instance.city,
  'district': instance.district,
  'street': instance.street,
  'alley': instance.alley,
  'plaque': instance.plaque,
  'floor': instance.floor,
  'unit': instance.unit,
  'postalCode': instance.postalCode,
  'coordinates': const LatLngNullableConverter().toJson(instance.coordinates),
};

AddressWithId _$AddressWithIdFromJson(Map json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'province',
      'city',
      'street',
      'plaque',
      'postalCode',
      'id',
      'addressType',
      'recipientName',
      'recipientPhone',
    ],
  );
  return AddressWithId(
    id: json['id'] as String,
    recipientName: json['recipientName'] as String,
    recipientPhone: json['recipientPhone'] as String,
    addressType: json['addressType'] as String,
    province: json['province'] as String,
    city: json['city'] as String,
    district: json['district'] as String?,
    street: json['street'] as String,
    alley: json['alley'] as String?,
    plaque: json['plaque'] as String,
    floor: json['floor'] as String?,
    unit: json['unit'] as String?,
    postalCode: json['postalCode'] as String,
    coordinates: const LatLngNullableConverter().fromJson(
      json['coordinates'] as Map<String, dynamic>?,
    ),
    isDefaultShipping: json['isDefaultShipping'] as bool? ?? false,
    isDefaultBilling: json['isDefaultBilling'] as bool? ?? false,
    notes: json['notes'] as String?,
    verified: json['verified'] as bool? ?? false,
  );
}

Map<String, dynamic> _$AddressWithIdToJson(
  AddressWithId instance,
) => <String, dynamic>{
  'province': instance.province,
  'city': instance.city,
  'district': instance.district,
  'street': instance.street,
  'alley': instance.alley,
  'plaque': instance.plaque,
  'floor': instance.floor,
  'unit': instance.unit,
  'postalCode': instance.postalCode,
  'coordinates': const LatLngNullableConverter().toJson(instance.coordinates),
  'id': instance.id,
  'addressType': instance.addressType,
  'recipientName': instance.recipientName,
  'recipientPhone': instance.recipientPhone,
  'isDefaultShipping': instance.isDefaultShipping,
  'isDefaultBilling': instance.isDefaultBilling,
  'notes': instance.notes,
  'verified': instance.verified,
};
