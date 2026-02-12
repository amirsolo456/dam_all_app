/*
import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_shared/models/enums.dart';
import 'package:khatoon_shared/models/order.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel extends Order {
    OrderModel({
    required super.id,
    required super.itemId,
    required super.userId,
    required super.quantity,
    required super.price,
    required super.date,
  }) : super(totalWeight: 0.0, userRank: UserRank.viewer);

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
*/
