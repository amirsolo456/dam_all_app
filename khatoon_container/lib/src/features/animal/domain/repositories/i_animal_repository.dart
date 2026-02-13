import 'package:khatoon_container/src/features/animal/domain/entities/animal.dart';

abstract class IAnimalRepository {
  Future<List<Animal>> getAnimals({int page = 1, int pageSize = 50});
  Future<Animal> getAnimalById(int id);
  Future<Animal> createAnimal(Animal animal);
  Future<Animal> updateAnimal(Animal animal);
  Future<void> deleteAnimal(int id);
}