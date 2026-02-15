import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/base/common/domain/entities/action_buttons.dart';
import 'package:khatoon_container/src/features/purchase/data/datasources/purchase_custom_actions_data_source.dart';
import 'package:khatoon_container/src/features/purchase/data/datasources/purchase_remote_data_source.dart';
import 'package:khatoon_container/src/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';
import 'package:khatoon_shared/index.dart';


class CreatePurchaseUseCase {
  final PurchaseRemoteDataSource repository;

  const CreatePurchaseUseCase({required this.repository});

  Future<PurchaseInvoiceModel> execute(PurchaseInvoiceModel invoice) async {
    return await repository.createInvoice(invoice);
  }
}

class GetPurchasesUseCase {
  final PurchaseRemoteDataSource repository;

  const GetPurchasesUseCase({required this.repository});

  Future<List<PurchaseInvoiceModel>> execute() async {
    return await repository.getInvoices();
  }
}

class GetPurchasesByIdUseCase {
  final PurchaseRemoteDataSource repository;

  const GetPurchasesByIdUseCase({required this.repository});

  Future<PurchaseInvoiceModel> execute(int purchasesId) async {
    return await repository.getInvoiceById(purchasesId);
  }
}

class DeletePurchaseUseCase {
  final PurchaseRemoteDataSource repository;

  const DeletePurchaseUseCase({required this.repository});

  Future<void> execute(int id) async {
    return await repository.deleteInvoice(id);
  }
}

class UpdatePurchaseUseCase {
  final PurchaseRemoteDataSource repository;

  const UpdatePurchaseUseCase({required this.repository});

  Future<PurchaseInvoiceModel> execute(PurchaseInvoiceModel invoice) {
    return repository.updateInvoice(invoice);
  }
}


class GetPurchaseMoreActionsUseCase{
   final PurchaseCustomActionsDataSource purchaseCustomActionsDataSource;

   const GetPurchaseMoreActionsUseCase({required this.purchaseCustomActionsDataSource});

   List<PopupMenuItem<dynamic>> execute( ){
     return purchaseCustomActionsDataSource.getMoreActions();
   }
}

class GetPurchaseMainActionsUseCase{
  final PurchaseCustomActionsDataSource purchaseCustomActionsDataSource;

  const GetPurchaseMainActionsUseCase({required this.purchaseCustomActionsDataSource});

  List<ActionButtons<dynamic>> execute( ){
    return purchaseCustomActionsDataSource.getMainActions();
  }
}

class GetPurchaseInvoiceTypesUseCase{
  final PurchaseCustomActionsDataSource purchaseCustomActionsDataSource;

  const GetPurchaseInvoiceTypesUseCase({required this.purchaseCustomActionsDataSource});

  List<PopupMenuItem<dynamic>> execute( ){
    return purchaseCustomActionsDataSource.getPurchaseInvoiceType();
  }
}
