import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_shared/index.dart';


part 'daily_stat.g.dart';
@JsonSerializable()
class DailyStat {
  @DateTimeConverter()
  @JsonKey(required: true)
  final DateTime date;

  @JsonKey(required: true)
  final int orders;

  @JsonKey(required: true)
  final double revenue;

  DailyStat({
    required this.date,
    required this.orders,
    required this.revenue,
  });

  factory DailyStat.fromJson(Map<String, dynamic> json) => _$DailyStatFromJson(json);
  Map<String, dynamic> toJson() => _$DailyStatToJson(this);
}