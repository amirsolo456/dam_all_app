// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map json) => Order(
  id: (json['id'] as num).toInt(),
  date: (json['date'] as num).toInt(),
  quantity: (json['quantity'] as num).toInt(),
  totalWeight: (json['totalWeight'] as num).toDouble(),
  itemId: (json['itemId'] as num).toInt(),
  userId: (json['userId'] as num).toInt(),
  userRank: $enumDecode(_$UserRankEnumMap, json['userRank']),
  price: (json['price'] as num).toDouble(),
);

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date,
  'quantity': instance.quantity,
  'totalWeight': instance.totalWeight,
  'itemId': instance.itemId,
  'userId': instance.userId,
  'userRank': _$UserRankEnumMap[instance.userRank]!,
  'price': instance.price,
};

const _$UserRankEnumMap = {
  UserRank.accountant: 'accountant',
  UserRank.support: 'support',
  UserRank.analyst: 'analyst',
  UserRank.developer: 'developer',
  UserRank.assistant: 'assistant',
  UserRank.user: 'user',
  UserRank.viewer: 'viewer',
};
