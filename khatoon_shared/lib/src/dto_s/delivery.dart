import 'package:json_annotation/json_annotation.dart';



part 'delivery.g.dart';


@JsonSerializable()
class Delivery  {
  final int id;
  final int date;
  final int count;
  final double totalWeight;

  const Delivery({
    required this.id,
    required this.date,
    required this.count,
    required this.totalWeight,
  });


  factory Delivery.fromJson(Map<String, dynamic> json) =>
      _$DeliveryFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryToJson(this);


}