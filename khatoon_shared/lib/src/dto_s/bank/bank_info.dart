import 'package:json_annotation/json_annotation.dart';

part 'bank_info.g.dart';

@JsonSerializable()
class BankInfo {
  @JsonKey(required: true)
  final String bankName;

  @JsonKey(required: true)
  final String accountNumber;

  @JsonKey(required: true)
  final String shebaNumber;

  final String? cardNumber;

  BankInfo({
    required this.bankName,
    required this.accountNumber,
    required this.shebaNumber,
    this.cardNumber,
  });

  factory BankInfo.fromJson(Map<String, dynamic> json) =>
      _$BankInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BankInfoToJson(this);
}
