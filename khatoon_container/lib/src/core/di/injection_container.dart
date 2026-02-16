import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:khatoon_container/index.dart';

// Core
import 'package:khatoon_container/src/core/storage/services/api_service.dart';

// Features - App Shortcuts
import 'package:khatoon_container/src/features/app_shortcuts/data/respositories/shortcuts_repository.dart';
import 'package:khatoon_container/src/features/app_shortcuts/domain/entities/shortcut.dart';

// Features - Persons
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

// Features - Purchase
import 'package:khatoon_container/src/features/purchase/data/datasources/purchase_local_data_source.dart';
import 'package:khatoon_container/src/features/purchase/data/datasources/purchase_remote_data_source.dart';
import 'package:khatoon_container/src/features/purchase/data/repositories/purchase_repository.dart';
import 'package:khatoon_container/src/features/purchase/domain/repositories/i_purchase_repository.dart';
import 'package:khatoon_container/src/features/purchase/domain/usecases/purchase_usecase.dart';
import 'package:khatoon_container/src/features/purchase/domain/usecases/payment_usecase.dart';
import 'package:khatoon_container/src/features/purchase/domain/usecases/purchase_item_usecase.dart';
import 'package:khatoon_container/src/features/purchase/presentation/bloc/purchase_bloc.dart';
import 'package:khatoon_container/src/features/purchase/presentation/widgets/purchase_list/bloc/purchase_list_bloc.dart';

// Features - User
import 'package:khatoon_container/src/features/user/data/data_sources/user_local_data_source.dart';
import 'package:khatoon_container/src/features/user/data/data_sources/user_remote_datasource.dart';

final GetIt sl = GetIt.instance;

class InjectionContainer {
  static Future<void> init() async {
    // ====================== External ======================
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

    // Dio
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

    // ====================== Core ======================
    sl.registerLazySingleton<ApiService>(() => ApiService());
    sl.registerLazySingleton<AppNotifier>(() => AppNotifier());
    sl.registerLazySingleton<ShortcutService>(() => ShortcutService());
    sl<ShortcutService>().registerHandler((Shortcut k) => k);

    // ====================== Data Sources ======================
    // Persons
    sl.registerLazySingleton<PersonDataSource>(
      () => PersonDataSource(apiService: sl<ApiService>()),
    );

    // Animal
    sl.registerLazySingleton<AnimalLocalDataSource>(
      () => AnimalLocalDataSource(prefs: sl<SharedPreferences>()),
    );
    sl.registerLazySingleton<AnimalRemoteDataSource>(
      () => AnimalRemoteDataSource(dioClient: sl<Dio>()),
    );

    // Products
    sl.registerLazySingleton<IProductRemoteDataSource>(
      () => ProductRemoteDataSource(sl<Dio>()),
    );

    // Purchase
    sl.registerLazySingleton<PurchaseRemoteDataSource>(
      () => PurchaseRemoteDataSource(dioClient: sl<Dio>()),
    );
    sl.registerLazySingleton<PurchaseLocalDataSource>(
      () => PurchaseLocalDataSource(sharedPreferences: sl<SharedPreferences>()),
    );

    // User
    sl.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSource());
    sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSource(sl<ApiService>()));

    // ====================== Repositories ======================
    sl.registerLazySingleton<IPersonRepository>(() => sl<PersonDataSource>());
    sl.registerLazySingleton<IAnimalRepository>(
      () => AnimalRepository(remote: sl<AnimalRemoteDataSource>(), local: sl<AnimalLocalDataSource>()),
    );
    sl.registerLazySingleton<IProductRepository>(
      () => ProductRepository(sl<IProductRemoteDataSource>()),
    );
    sl.registerLazySingleton<IPurchaseRepository>(
      () => PurchaseRepository(remoteDataSource: sl<PurchaseRemoteDataSource>()),
    );

    // ====================== Use Cases ======================
    // Persons
    sl.registerLazySingleton(() => GetPersonUseCase(personDataSource: sl<PersonDataSource>()));
    sl.registerLazySingleton(() => UpdatePersonUseCase(personDataSource: sl<PersonDataSource>()));
    sl.registerLazySingleton(() => DeletePersonUseCase(personDataSource: sl<PersonDataSource>()));
    sl.registerLazySingleton(() => InsertPersonUseCase(personDataSource: sl<PersonDataSource>()));

    // Products
    sl.registerLazySingleton(() => CreateProductUseCase(repository: sl<IProductRepository>()));

    // Purchase
    sl.registerLazySingleton(() => GetPurchasesUseCase(repository: sl<PurchaseRemoteDataSource>()));
    sl.registerLazySingleton(() => GetPurchasesByIdUseCase(repository: sl<PurchaseRemoteDataSource>()));
    sl.registerLazySingleton(() => CreatePurchaseUseCase(repository: sl<PurchaseRemoteDataSource>()));
    sl.registerLazySingleton(() => UpdatePurchaseUseCase(repository: sl<PurchaseRemoteDataSource>()));
    sl.registerLazySingleton(() => DeletePurchaseUseCase(repository: sl<PurchaseRemoteDataSource>()));

    sl.registerLazySingleton(() => GetPaymentsByInvoiceIdUseCase(repository: sl<PurchaseRemoteDataSource>()));
    sl.registerLazySingleton(() => UpdatePaymentUseCase(repository: sl<PurchaseRemoteDataSource>()));
    sl.registerLazySingleton(() => DeletePaymentUseCase(repository: sl<PurchaseRemoteDataSource>()));
    sl.registerLazySingleton(() => DeletePaymentsByIdUseCase(repository: sl<PurchaseRemoteDataSource>()));
    sl.registerLazySingleton(() => CreatePaymentUseCase(repository: sl<PurchaseRemoteDataSource>()));
    sl.registerLazySingleton(() => CreatePaymentsUseCase(repository: sl<PurchaseRemoteDataSource>()));

    // Purchase Items
    sl.registerLazySingleton(() => GetPurchasesItemsByPurchaseIdUseCase(repository: sl<PurchaseRemoteDataSource>()));
    sl.registerLazySingleton(() => CreatePurchaseItemUseCase(repository: sl<PurchaseRemoteDataSource>()));
    sl.registerLazySingleton(() => UpdatePurchaseItemUseCase(repository: sl<PurchaseRemoteDataSource>()));
    sl.registerLazySingleton(() => DeletePurchaseItemByIdUseCase(repository: sl<PurchaseRemoteDataSource>()));

    // ====================== BLoCs ======================
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

    // Initializations
    try {
      await sl<AppNotifier>().initialize();
    } catch (e) {
      // Handle initialization error
    }
  }
}
