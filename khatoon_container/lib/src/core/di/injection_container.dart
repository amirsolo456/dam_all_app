import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:khatoon_container/index.dart';

// Core Services
import 'package:khatoon_container/src/core/storage/services/api_service.dart';

// Features - App Shortcuts
import 'package:khatoon_container/src/features/app_shortcuts/data/respositories/shortcuts_repository.dart';
import 'package:khatoon_container/src/features/app_shortcuts/domain/entities/shortcut.dart';

// Features - Persons (Parties)
import 'package:khatoon_container/src/features/persons/data/data_sources/person_data_source.dart';
import 'package:khatoon_container/src/features/persons/domain/repositories/i_person_repository.dart';
import 'package:khatoon_container/src/features/persons/domain/usecases/person_usecase.dart';

// Features - Animal
import 'package:khatoon_container/src/features/animal/data/data_source/animal_local_datasource.dart';
import 'package:khatoon_container/src/features/animal/data/data_source/animal_remote_datasource.dart';
import 'package:khatoon_container/src/features/animal/data/repositories/animal_repository.dart';
import 'package:khatoon_container/src/features/animal/domain/repositories/i_animal_repository.dart';

// Features - Products
import 'package:khatoon_container/src/features/products/data/datasources/product_remote_data_source.dart';
import 'package:khatoon_container/src/features/products/data/repositories/product_repository.dart';
import 'package:khatoon_container/src/features/products/domain/repositories/i_product_repository.dart';
import 'package:khatoon_container/src/features/products/domain/usecases/product_usecase.dart';

// Features - Purchase (Invoices & Payments)
import 'package:khatoon_container/src/features/purchase/data/datasources/purchase_local_data_source.dart';
import 'package:khatoon_container/src/features/purchase/data/datasources/purchase_remote_data_source.dart';
import 'package:khatoon_container/src/features/purchase/data/repositories/purchase_repository.dart';
import 'package:khatoon_container/src/features/purchase/domain/repositories/i_purchase_repository.dart';
import 'package:khatoon_container/src/features/purchase/domain/usecases/purchase_usecase.dart';
import 'package:khatoon_container/src/features/purchase/domain/usecases/payment_usecase.dart';
import 'package:khatoon_container/src/features/purchase/domain/usecases/purchase_item_usecase.dart';
import 'package:khatoon_container/src/features/purchase/presentation/bloc/purchase_bloc.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/purchase_list/bloc/purchase_list_bloc.dart';

// Features - User & Auth
import 'package:khatoon_container/src/features/user/data/data_sources/user_local_data_source.dart';
import 'package:khatoon_container/src/features/user/data/data_sources/user_remote_datasource.dart';

final GetIt sl = GetIt.instance;

class InjectionContainer {
  static Future<void> init() async {
    // ====================== 1. External & Core ======================

    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

    sl.registerLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: 'http://localhost:5130/api',
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          headers: <String, dynamic>{
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      )..interceptors.add(
          LogInterceptor(requestBody: true, responseBody: true),
        ),
    );

    sl.registerLazySingleton<ApiService>(() => ApiService());
    sl.registerLazySingleton<AppNotifier>(() => AppNotifier());
    sl.registerLazySingleton<ShortcutService>(() => ShortcutService());
    sl<ShortcutService>().registerHandler((Shortcut k) => k);

    // ====================== 2. Data Sources ======================

    sl.registerLazySingleton<PersonDataSource>(
      () => PersonDataSource(apiService: sl<ApiService>()),
    );

    sl.registerLazySingleton<AnimalLocalDataSource>(
      () => AnimalLocalDataSource(prefs: sl<SharedPreferences>()),
    );
    sl.registerLazySingleton<IAnimalRemoteDataSource>(
      () => AnimalRemoteDataSource(dioClient: sl<Dio>()),
    );

    sl.registerLazySingleton<IProductRemoteDataSource>(
      () => ProductRemoteDataSource(sl<Dio>()),
    );

    sl.registerLazySingleton<IPurchaseRemoteDataSource>(
      () => PurchaseRemoteDataSource(dioClient: sl<Dio>()),
    );
    sl.registerLazySingleton<PurchaseLocalDataSource>(
      () => PurchaseLocalDataSource(sharedPreferences: sl<SharedPreferences>()),
    );

    sl.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSource());
    sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSource(sl<ApiService>()));

    // ====================== 3. Repositories ======================

    sl.registerLazySingleton<IPersonRepository>(() => sl<PersonDataSource>());

    sl.registerLazySingleton<IAnimalRepository>(
      () => AnimalRepository(
        remote: sl<IAnimalRemoteDataSource>() as AnimalRemoteDataSource,
        local: sl<AnimalLocalDataSource>(),
      ),
    );

    sl.registerLazySingleton<IProductRepository>(
      () => ProductRepository(sl<IProductRemoteDataSource>()),
    );

    sl.registerLazySingleton<IPurchaseRepository>(
      () => PurchaseRepository(
        remoteDataSource: sl<IPurchaseRemoteDataSource>() as PurchaseRemoteDataSource,
      ),
    );

    // ====================== 4. Use Cases ======================

    sl.registerLazySingleton(() => GetPersonUseCase(personDataSource: sl<PersonDataSource>()));
    sl.registerLazySingleton(() => UpdatePersonUseCase(personDataSource: sl<PersonDataSource>()));
    sl.registerLazySingleton(() => DeletePersonUseCase(personDataSource: sl<PersonDataSource>()));
    sl.registerLazySingleton(() => InsertPersonUseCase(personDataSource: sl<PersonDataSource>()));

    sl.registerLazySingleton(() => CreateProductUseCase(repository: sl<IProductRepository>()));

    sl.registerLazySingleton(() => GetPurchasesUseCase(repository: sl<IPurchaseRemoteDataSource>() as PurchaseRemoteDataSource));
    sl.registerLazySingleton(() => GetPurchasesByIdUseCase(repository: sl<IPurchaseRemoteDataSource>() as PurchaseRemoteDataSource));
    sl.registerLazySingleton(() => CreatePurchaseUseCase(repository: sl<IPurchaseRemoteDataSource>() as PurchaseRemoteDataSource));
    sl.registerLazySingleton(() => UpdatePurchaseUseCase(repository: sl<IPurchaseRemoteDataSource>() as PurchaseRemoteDataSource));
    sl.registerLazySingleton(() => DeletePurchaseUseCase(repository: sl<IPurchaseRemoteDataSource>() as PurchaseRemoteDataSource));

    sl.registerLazySingleton(() => GetPaymentsByInvoiceIdUseCase(repository: sl<IPurchaseRemoteDataSource>() as PurchaseRemoteDataSource));
    sl.registerLazySingleton(() => UpdatePaymentUseCase(repository: sl<IPurchaseRemoteDataSource>() as PurchaseRemoteDataSource));
    sl.registerLazySingleton(() => DeletePaymentUseCase(repository: sl<IPurchaseRemoteDataSource>() as PurchaseRemoteDataSource));
    sl.registerLazySingleton(() => DeletePaymentsByIdUseCase(repository: sl<IPurchaseRemoteDataSource>() as PurchaseRemoteDataSource));
    sl.registerLazySingleton(() => CreatePaymentUseCase(repository: sl<IPurchaseRemoteDataSource>() as PurchaseRemoteDataSource));
    sl.registerLazySingleton(() => CreatePaymentsUseCase(repository: sl<IPurchaseRemoteDataSource>() as PurchaseRemoteDataSource));

    sl.registerLazySingleton(() => GetPurchasesItemsByPurchaseIdUseCase(repository: sl<IPurchaseRemoteDataSource>() as PurchaseRemoteDataSource));
    sl.registerLazySingleton(() => CreatePurchaseItemUseCase(repository: sl<IPurchaseRemoteDataSource>() as PurchaseRemoteDataSource));
    sl.registerLazySingleton(() => UpdatePurchaseItemUseCase(repository: sl<IPurchaseRemoteDataSource>() as PurchaseRemoteDataSource));
    sl.registerLazySingleton(() => DeletePurchaseItemByIdUseCase(repository: sl<IPurchaseRemoteDataSource>() as PurchaseRemoteDataSource));

    // ====================== 5. BLoCs ======================

    sl.registerFactory(
      () => PurchaseListBloc(
        getPurchasesUseCase: sl<GetPurchasesUseCase>(),
        getPurchasesByIdUseCase: sl<GetPurchasesByIdUseCase>(),
        createPurchaseUseCase: sl<CreatePurchaseUseCase>(),
        updatePurchaseUseCase: sl<UpdatePurchaseUseCase>(),
        deletePurchaseUseCase: sl<DeletePurchaseUseCase>(),
      ),
    );

    sl.registerFactory(
      () => PurchaseBloc(
        getPurchasesUseCase: sl<GetPurchasesUseCase>(),
        getPurchasesItemsUseCase: sl<GetPurchasesItemsByPurchaseIdUseCase>(),
        createPurchaseItemUseCase: sl<CreatePurchaseItemUseCase>(),
        updatePurchaseItemUseCase: sl<UpdatePurchaseItemUseCase>(),
        deletePurchaseItemUseCase: sl<DeletePurchaseItemByIdUseCase>(),
        getPaymentsUseCase: sl<GetPaymentsByInvoiceIdUseCase>(),
        createPaymentUseCase: sl<CreatePaymentUseCase>(),
        createPaymentsUseCase: sl<CreatePaymentsUseCase>(),
        updatePaymentUseCase: sl<UpdatePaymentUseCase>(),
        deletePaymentUseCase: sl<DeletePaymentUseCase>(),
        deletePaymentByIdUseCase: sl<DeletePaymentsByIdUseCase>(),
      ),
    );

    try {
      await sl<AppNotifier>().initialize();
    } catch (e) {
      // Ignore initialization errors
    }
  }
}
