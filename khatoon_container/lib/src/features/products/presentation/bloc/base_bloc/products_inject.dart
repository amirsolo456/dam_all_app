
import 'package:dio/dio.dart';
import 'package:khatoon_container/src/features/animal/data/data_source/animal_local_datasource.dart';
import 'package:khatoon_container/src/features/animal/data/data_source/animal_remote_datasource.dart';
import 'package:khatoon_container/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Inject {
  static void initialize() {
    // sl.registerFactory(() => const SignInPage());
    if (!sl.isRegistered<AnimalLocalDataSource>()) {
      sl.registerLazySingleton<AnimalLocalDataSource>(
            () => AnimalLocalDataSource(prefs: sl<SharedPreferences>()),
      );
    }

    if (!sl.isRegistered<AnimalRemoteDataSource>()) {
      sl.registerLazySingleton<AnimalRemoteDataSource>(
            () => AnimalRemoteDataSource(dioClient:  sl<Dio>()),
      );
    }
  }
}
