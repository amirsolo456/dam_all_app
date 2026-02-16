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
      sl.registerLazySingleton<PurchaseCustomActionsDataSource>(
        () => PurchaseCustomActionsDataSource(),
      );

      sl.registerLazySingleton<GetPurchaseMoreActionsUseCase>(
        () => GetPurchaseMoreActionsUseCase(
          purchaseCustomActionsDataSource:
              sl<PurchaseCustomActionsDataSource>(),
        ),
      );

      sl.registerLazySingleton<GetPurchaseInvoiceTypesUseCase>(
        () => GetPurchaseInvoiceTypesUseCase(
          purchaseCustomActionsDataSource:
              sl<PurchaseCustomActionsDataSource>(),
        ),
      );

      sl.registerLazySingleton<GetPurchaseMainActionsUseCase>(
        () => GetPurchaseMainActionsUseCase(
          purchaseCustomActionsDataSource:
              sl<PurchaseCustomActionsDataSource>(),
        ),
      );

      sl.registerLazySingleton<PurchaseRemoteDataSource>(
        () => PurchaseRemoteDataSource(dioClient: sl<Dio>()),
      );

      sl.registerLazySingleton<PurchaseLocalDataSource>(
        () =>
            PurchaseLocalDataSource(sharedPreferences: sl<SharedPreferences>()),
      );

      sl.registerLazySingleton<GetPurchasesUseCase>(
        () => GetPurchasesUseCase(repository: sl<PurchaseRemoteDataSource>()),
      );

      sl.registerLazySingleton<GetPurchasesByIdUseCase>(
        () =>
            GetPurchasesByIdUseCase(repository: sl<PurchaseRemoteDataSource>()),
      );

      sl.registerLazySingleton<GetPurchasesItemsByPurchaseIdUseCase>(
        () => GetPurchasesItemsByPurchaseIdUseCase(
          repository: sl<PurchaseRemoteDataSource>(),
        ),
      );

      sl.registerLazySingleton<UpdatePurchaseUseCase>(
        () => UpdatePurchaseUseCase(repository: sl<PurchaseRemoteDataSource>()),
      );

      sl.registerLazySingleton<UpdatePurchaseItemUseCase>(
        () => UpdatePurchaseItemUseCase(
          repository: sl<PurchaseRemoteDataSource>(),
        ),
      );

      sl.registerLazySingleton<DeletePurchaseUseCase>(
        () => DeletePurchaseUseCase(repository: sl<PurchaseRemoteDataSource>()),
      );

      sl.registerLazySingleton<DeletePurchaseItemByIdUseCase>(
        () => DeletePurchaseItemByIdUseCase(
          repository: sl<PurchaseRemoteDataSource>(),
        ),
      );


      sl.registerLazySingleton<CreatePurchaseUseCase>(
        () => CreatePurchaseUseCase(repository: sl<PurchaseRemoteDataSource>()),
      );

      sl.registerLazySingleton<CreatePurchaseItemUseCase>(
        () => CreatePurchaseItemUseCase(
          repository: sl<PurchaseRemoteDataSource>(),
        ),
      );
    }
  }
}
