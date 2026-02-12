// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defaults.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Defaults _$DefaultsFromJson(Map json) => Defaults(
  cashierId: (json['cashierId'] as num).toInt(),
  currencyId: (json['currencyId'] as num).toInt(),
  languageId: (json['languageId'] as num).toInt(),
  placeId: (json['placeId'] as num).toInt(),
  yearId: (json['yearId'] as num).toInt(),
);

Map<String, dynamic> _$DefaultsToJson(Defaults instance) => <String, dynamic>{
  'currencyId': instance.currencyId,
  'cashierId': instance.cashierId,
  'placeId': instance.placeId,
  'yearId': instance.yearId,
  'languageId': instance.languageId,
};
