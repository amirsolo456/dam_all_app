import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/base/common/domain/entities/enums.dart';
import 'package:khatoon_container/src/core/components/custom_information_card/custom_card.dart';
import 'package:khatoon_container/src/core/components/custom_information_card/custom_rial_label.dart';
import 'package:khatoon_container/src/features/persons/data/models/person_model.dart';
import 'package:khatoon_container/src/features/purchase/data/models/purchase_item/purchase_item_model.dart';
import 'package:khatoon_container/src/features/user/data/models/user_model/user_model.dart';

class InvoiceSumWidget extends StatelessWidget {
  final double tax;
  final List<PurchaseItemModel> items;
  final double discounts;
  final String description;
  final PersonModel buyer;
  final UserModel saler;
  final bool autoTax;
  final InvoiceType invoiceType;

  const InvoiceSumWidget({
    super.key,
    this.tax = 0,
    required this.items,
    this.discounts = 0,
    this.description = '',
    this.autoTax = true,
    required this.buyer,
    required this.invoiceType,
    required this.saler,
  });

  @override
  Widget build(BuildContext context) {
    return   CustomCard(cardChild: Column(children: <Widget>[
      Row(children: <Widget>[
         CustomRialLabel(value: discounts,bef: 'تخفیف :',past: 'تومان',),
         CustomRialLabel(value: discounts,bef: 'تخفیف :',past: 'تومان',),
         CustomRialLabel(value: discounts,bef: 'تخفیف :',past: 'تومان',),
      ],),
      Row(children: <Widget>[
        CustomRialLabel(value: discounts,bef: 'تخفیف :',past: 'تومان',),
        CustomRialLabel(value: discounts,bef: 'تخفیف :',past: 'تومان',),
        CustomRialLabel(value: discounts,bef: 'تخفیف :',past: 'تومان',),
      ],),
      Row(children: <Widget>[
        CustomRialLabel(value: discounts,bef: 'تخفیف :',past: 'تومان',),
        CustomRialLabel(value: discounts,bef: 'تخفیف :',past: 'تومان',),
      ],),
    ]));
  }
}
