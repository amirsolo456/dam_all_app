import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'warranty_info.g.dart';

@JsonSerializable()
class WarrantyInfo extends Equatable {
  @JsonKey(required: true)
  final int durationMonths;

  @JsonKey(required: true)
  final String description;

  @JsonKey()
  final List<String> coveredItems;

  @JsonKey()
  final List<String> excludedItems;

  const WarrantyInfo({
    required this.durationMonths,
    required this.description,
    this.coveredItems = const <String>[],
    this.excludedItems = const <String>[],
  });

  @override
  List<Object?> get props => [
    durationMonths,
    description,
    coveredItems,
    excludedItems,
  ];

  factory WarrantyInfo.fromJson(Map<String, dynamic> json) =>
      _$WarrantyInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WarrantyInfoToJson(this);
}
