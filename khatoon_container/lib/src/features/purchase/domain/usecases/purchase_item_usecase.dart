

import 'package:khatoon_container/src/features/purchase/data/datasources/purchase_remote_data_source.dart';
import 'package:khatoon_container/src/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';
import 'package:khatoon_container/src/features/purchase/data/models/purchase_item/purchase_item_model.dart';
import 'package:khatoon_shared/index.dart';

class CreatePurchaseItemUseCase {
  final PurchaseRemoteDataSource repository;

  const CreatePurchaseItemUseCase({required this.repository});

  Future<void> execute(Invoice   purchase,PurchaseItemModel purchaseItem) async{
      await repository.createInvoice(purchase, );
  }
}

class GetPurchasesItemsByPurchaseIdUseCase {
  final PurchaseRemoteDataSource repository;

  const GetPurchasesItemsByPurchaseIdUseCase({required this.repository});

  Future<List<PurchaseItemModel>> execute(PurchaseInvoiceModel purchase) async {
    return await repository.getPurchaseItemsByPurchaseId( purchase.id,  );
  }
}



class DeletePurchaseItemByIdUseCase {
  final PurchaseRemoteDataSource repository;

  const DeletePurchaseItemByIdUseCase({required this.repository});

  Future<void> execute(PurchaseItemModel purchaseItem) async {
    return await repository.deletePurchaseItemsById(purchaseItem.id);
  }
}

class DeletePurchaseItemUseCase {
  final PurchaseRemoteDataSource repository;

  const DeletePurchaseItemUseCase({required this.repository});

  Future<void> execute(PurchaseItemModel purchase) async {
    return await repository.deletePurchaseItem(purchase);
  }
}

class UpdatePurchaseItemUseCase {
  final PurchaseRemoteDataSource repository;

  const UpdatePurchaseItemUseCase({required this.repository});

  Future<void> execute(PurchaseItemModel purchase) {
    return repository.updatePurchaseItem (purchase);
  }
}
