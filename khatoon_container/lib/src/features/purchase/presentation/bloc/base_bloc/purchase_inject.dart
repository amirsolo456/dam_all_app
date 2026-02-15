import 'package:dio/dio.dart';
import 'package:khatoon_container/src/features/purchase/data/datasources/purchase_custom_actions_data_source.dart';
import 'package:khatoon_container/src/features/purchase/data/datasources/purchase_local_data_source.dart';
import 'package:khatoon_container/src/features/purchase/data/datasources/purchase_remote_data_source.dart';
import 'package:khatoon_container/src/features/purchase/domain/usecases/purchase_item_usecase.dart';
import 'package:khatoon_container/src/features/purchase/domain/usecases/purchase_usecase.dart';
import 'package:khatoon_container/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Inject {
  static void initialize() {
    if (!sl.isRegistered<PurchaseCustomActionsDataSource>()) {
      sl.lazySingleton<PurchaseCustomActionsDataSource>(
        () => PurchaseCustomActionsDataSource(),
      );

      sl.lazySingleton<GetPurchaseMoreActionsUseCase>(
        () => GetPurchaseMoreActionsUseCase(
          purchaseCustomActionsDataSource:
              sl<PurchaseCustomActionsDataSource>(),
        ),
      );

      sl.lazySingleton<GetPurchaseInvoiceTypesUseCase>(
        () => GetPurchaseInvoiceTypesUseCase(
          purchaseCustomActionsDataSource:
              sl<PurchaseCustomActionsDataSource>(),
        ),
      );

      sl.lazySingleton<GetPurchaseMainActionsUseCase>(
        () => GetPurchaseMainActionsUseCase(
          purchaseCustomActionsDataSource:
              sl<PurchaseCustomActionsDataSource>(),
        ),
      );

      sl.lazySingleton<PurchaseRemoteDataSource>(
        () => PurchaseRemoteDataSource(dioClient: sl<Dio>()),
      );

      sl.lazySingleton<PurchaseLocalDataSource>(
        () =>
            PurchaseLocalDataSource(sharedPreferences: sl<SharedPreferences>()),
      );

      sl.lazySingleton<GetPurchasesUseCase>(
        () => GetPurchasesUseCase(repository: sl<PurchaseRemoteDataSource>()),
      );

      sl.lazySingleton<GetPurchasesByIdUseCase>(
        () =>
            GetPurchasesByIdUseCase(repository: sl<PurchaseRemoteDataSource>()),
      );

      sl.lazySingleton<GetPurchasesItemsByPurchaseIdUseCase>(
        () => GetPurchasesItemsByPurchaseIdUseCase(
          repository: sl<PurchaseRemoteDataSource>(),
        ),
      );

      sl.lazySingleton<UpdatePurchaseUseCase>(
        () => UpdatePurchaseUseCase(repository: sl<PurchaseRemoteDataSource>()),
      );

      sl.lazySingleton<UpdatePurchaseItemUseCase>(
        () => UpdatePurchaseItemUseCase(
          repository: sl<PurchaseRemoteDataSource>(),
        ),
      );

      sl.lazySingleton<DeletePurchaseUseCase>(
        () => DeletePurchaseUseCase(repository: sl<PurchaseRemoteDataSource>()),
      );

      sl.lazySingleton<DeletePurchaseItemByIdUseCase>(
        () => DeletePurchaseItemByIdUseCase(
          repository: sl<PurchaseRemoteDataSource>(),
        ),
      );


      sl.lazySingleton<CreatePurchaseUseCase>(
        () => CreatePurchaseUseCase(repository: sl<PurchaseRemoteDataSource>()),
      );

      sl.lazySingleton<CreatePurchaseItemUseCase>(
        () => CreatePurchaseItemUseCase(
          repository: sl<PurchaseRemoteDataSource>(),
        ),
      );
    }
  }
}
