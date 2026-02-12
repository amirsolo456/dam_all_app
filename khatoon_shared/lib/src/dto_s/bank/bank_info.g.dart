// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankInfo _$BankInfoFromJson(Map json) {
  $checkKeys(
    json,
    requiredKeys: const ['bankName', 'accountNumber', 'shebaNumber'],
  );
  return BankInfo(
    bankName: json['bankName'] as String,
    accountNumber: json['accountNumber'] as String,
    shebaNumber: json['shebaNumber'] as String,
    cardNumber: json['cardNumber'] as String?,
  );
}

Map<String, dynamic> _$BankInfoToJson(BankInfo instance) => <String, dynamic>{
  'bankName': instance.bankName,
  'accountNumber': instance.accountNumber,
  'shebaNumber': instance.shebaNumber,
  'cardNumber': instance.cardNumber,
};
