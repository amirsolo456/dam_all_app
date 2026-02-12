// مدل جامع‌تر
import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_shared/index.dart';



part 'sale.g.dart';

@JsonSerializable()
class Sale {
  // final Order purchaseOrder;
  final List<InvoiceLine> invoices;
  final Invoice invoice;
  // final List<Delivery> deliveries;
  final List<Payment> payments;

  const Sale({
    // required this.purchaseOrder,
    required this.invoices,
    required this.invoice,

    // required this.deliveries,
    required this.payments,
  });

  // static int _toJson(DateTime value) => value.millisecondsSinceEpoch;
  //
  // static DateTime _fromJson(dynamic value) {
  //   if (value is int) {
  //     return DateTime.fromMillisecondsSinceEpoch(value);
  //   } else if (value is String) {
  //     return DateTime.parse(value);
  //   }
  //   return DateTime.now();
  // }

  factory Sale.fromJson(Map<String, dynamic> json) => _$SaleFromJson(json);

  Map<String, dynamic> toJson() => _$SaleToJson(this);
}
