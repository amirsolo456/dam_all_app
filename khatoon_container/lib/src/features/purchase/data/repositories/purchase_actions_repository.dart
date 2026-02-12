import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/base/common/domain/entities/action_buttons.dart';
import 'package:khatoon_container/src/features/purchase/data/datasources/purchase_custom_actions_data_source.dart';

class PurchaseActionsRepository implements IPurchaseCustomActionsDataSource {
  final PurchaseCustomActionsDataSource purchaseCustomActionsDataSource;

  PurchaseActionsRepository(this.purchaseCustomActionsDataSource);

  @override
  List<ActionButtons<dynamic>> getMainActions() {
    return purchaseCustomActionsDataSource.getMainActions();
  }

  @override
  List<PopupMenuItem<dynamic>> getMoreActions() {
    return purchaseCustomActionsDataSource.getMoreActions();
  }

  @override
  List<PopupMenuItem<dynamic>> getPurchaseInvoiceType() {
    return purchaseCustomActionsDataSource.getPurchaseInvoiceType();
  }
}
