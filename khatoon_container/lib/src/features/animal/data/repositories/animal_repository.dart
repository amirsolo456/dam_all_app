import 'package:khatoon_container/src/features/animal/data/data_source/animal_local_datasource.dart';
import 'package:khatoon_container/src/features/animal/data/data_source/animal_remote_datasource.dart';
import 'package:khatoon_container/src/features/animal/domain/entities/animal.dart';
import 'package:khatoon_container/src/features/animal/domain/repositories/i_animal_repository.dart';

// abstract class NetworkInfo {
//   Future<bool> get isConnected;
// }
// class NetworkInfoImpl implements NetworkInfo {
//   final Connectivity connectivity;
//
//   NetworkInfoImpl(this.connectivity);
//
//   @override
//   Future<bool> get isConnected async {
//     final result = await connectivity.checkConnectivity();
//     return result != ConnectivityResult.none;
//   }
// }

class AnimalRepository implements IAnimalRepository {
  final AnimalRemoteDataSource remote;
  final AnimalLocalDataSource local;

  // final NetworkInfo networkInfo;

  AnimalRepository({required this.remote, required this.local});

  @override
  Future<Animal> createAnimal(Animal animal) async {
    // TODO: implement createAnimal
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAnimal(String id) async {
    // if (await networkInfo.isConnected()) {
    return remote.deleteAnimal(id);
    // }
    // throw NoConnectionException();
  }

  @override
  Future<Animal> getAnimalById(String id) async {
    // TODO: implement getAnimalById
    throw UnimplementedError();
  }

  @override
  Future<List<Animal>> getAnimals({int page = 1, int pageSize = 50}) async {
    // TODO: implement getAnimals
    throw UnimplementedError();
  }

  @override
  Future<Animal> updateAnimal(Animal animal) async {
    // TODO: implement updateAnimal
    throw UnimplementedError();
  }
}
