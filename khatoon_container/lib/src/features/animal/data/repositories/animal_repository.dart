import 'package:khatoon_container/src/features/animal/data/data_source/animal_local_datasource.dart';
import 'package:khatoon_container/src/features/animal/data/data_source/animal_remote_datasource.dart';
import 'package:khatoon_container/src/features/animal/data/models/animal_model.dart';
import 'package:khatoon_container/src/features/animal/domain/entities/animal.dart';
import 'package:khatoon_container/src/features/animal/domain/repositories/i_animal_repository.dart';

class AnimalRepository implements IAnimalRepository {
  final AnimalRemoteDataSource remote;
  final AnimalLocalDataSource local;

  AnimalRepository({required this.remote, required this.local});

  @override
  Future<Animal> createAnimal(Animal animal) async {
    // Convert Animal to AnimalModel if needed
    final AnimalModel model = AnimalModel(
      id: animal.id,
      name: animal.name,
      tagNumber: animal.tagNumber,
      breed: animal.breed,
      type: animal.type,
      gender: animal.gender,
      birthDate: animal.birthDate,
      purchasePrice: animal.purchasePrice,
      estimatedValue: animal.estimatedValue,
      purchaseSource: animal.purchaseSource,
      notes: animal.notes,
      isActive: animal.isActive,
      healthStatus: animal.healthStatus,
      reproductionStatus: animal.reproductionStatus,
      createdAt: animal.createdAt,
      updatedAt: animal.updatedAt,
      isDeleted: animal.isDeleted,
      version: animal.version,
    );
    return await remote.postAnimal(model);
  }

  @override
  Future<void> deleteAnimal(int id) async {
    return await remote.deleteAnimal(id);
  }

  @override
  Future<Animal> getAnimalById(int id) async {
    return await remote.fetchAnimalById(id);
  }

  @override
  Future<List<Animal>> getAnimals({int page = 1, int pageSize = 50}) async {
    return await remote.getAnimals(page: page, pageSize: pageSize);
  }

  @override
  Future<Animal> updateAnimal(Animal animal) async {
    final AnimalModel model = AnimalModel(
      id: animal.id,
      name: animal.name,
      tagNumber: animal.tagNumber,
      breed: animal.breed,
      type: animal.type,
      gender: animal.gender,
      birthDate: animal.birthDate,
      purchasePrice: animal.purchasePrice,
      estimatedValue: animal.estimatedValue,
      purchaseSource: animal.purchaseSource,
      notes: animal.notes,
      isActive: animal.isActive,
      healthStatus: animal.healthStatus,
      reproductionStatus: animal.reproductionStatus,
      createdAt: animal.createdAt,
      updatedAt: animal.updatedAt,
      isDeleted: animal.isDeleted,
      version: animal.version,
    );
    return await remote.putAnimal(model);
  }
}
