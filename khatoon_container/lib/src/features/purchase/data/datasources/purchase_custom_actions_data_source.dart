import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/base/common/domain/entities/action_buttons.dart';
import 'package:khatoon_container/src/features/purchase/domain/entities/enums.dart';

abstract class IPurchaseCustomActionsDataSource {
  List<PopupMenuItem<dynamic>> getMoreActions();

  List<ActionButtons<dynamic>> getMainActions();

  List<PopupMenuItem<dynamic>> getPurchaseInvoiceType();
}

class PurchaseCustomActionsDataSource
    implements IPurchaseCustomActionsDataSource {
  @override
  List<ActionButtons<dynamic>> getMainActions() {
    return Actions().mainActions;
  }

  @override
  List<PopupMenuItem<dynamic>> getMoreActions() {
    return Actions().moreActions;
  }

  @override
  List<PopupMenuItem<dynamic>> getPurchaseInvoiceType() {
    return Actions().invoiceType;
  }
}

class Actions {
  final List<PopupMenuItem<dynamic>> moreActions = <PopupMenuItem<dynamic>>[
    const PopupMenuItem<dynamic>(
      child: Row(
        spacing: 10,
        children: <Widget>[Icon(Icons.info_outlined), Text('جزِِییات')],
      ),
    ),
    const PopupMenuItem<dynamic>(
      child: Row(
        spacing: 10,
        children: <Widget>[Icon(Icons.warning_amber_outlined), Text('خطاها')],
      ),
    ),
    const PopupMenuItem<dynamic>(
      child: Row(
        spacing: 10,
        children: <Widget>[Icon(Icons.share_outlined), Text('اشتراک گذاری')],
      ),
    ),
    const PopupMenuItem<dynamic>(
      child: Row(
        spacing: 10,
        children: <Widget>[Icon(Icons.archive_outlined), Text('بایگانی')],
      ),
    ),
  ];

  final List<ActionButtons<dynamic>> mainActions = <ActionButtons<dynamic>>[
    //Edit
    ActionButtons<dynamic>(
      PageActionsTypes.edit.persianName,
      const Icon(Icons.edit_outlined),
      () {},
    ),
    //Delete
    ActionButtons<dynamic>(
      PageActionsTypes.delete.persianName,
      const Icon(Icons.save_alt_outlined),
      () {},
    ),
    //New
    ActionButtons<dynamic>(
      PageActionsTypes.createNew.persianName,
      const Icon(Icons.add_chart_outlined),
      () {},
    ),
  ];

  final List<PopupMenuItem<dynamic>> invoiceType = <PopupMenuItem<dynamic>>[
    const PopupMenuItem<dynamic>(
      value:  'فروش',
      child: Row(
        spacing: 10,
        children: <Widget>[Icon(Icons.info_outlined), Text('فروش')],
      ),
    ),
    const PopupMenuItem<dynamic>(
      value:  'خرید',
      child: Row(
        spacing: 10,
        children: <Widget>[Icon(Icons.warning_amber_outlined), Text('خرید')],
      ),
    ),
  ];
}
