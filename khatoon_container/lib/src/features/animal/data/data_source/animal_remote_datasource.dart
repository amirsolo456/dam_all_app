import 'package:dio/dio.dart';
import 'package:khatoon_container/src/core/storage/services/errors/exceptions.dart';
import 'package:khatoon_container/src/features/animal/data/models/animal_model.dart';

abstract class IAnimalRemoteDataSource {
  Future<List<AnimalModel>> getAnimals({int page = 1, int pageSize = 50});
  Future<AnimalModel> fetchAnimalById(int id);
  Future<AnimalModel> postAnimal(AnimalModel animal);
  Future<AnimalModel> putAnimal(AnimalModel animal);
  Future<void> deleteAnimal(int id);
}

class AnimalRemoteDataSource implements IAnimalRemoteDataSource {
  final Dio dioClient;

  AnimalRemoteDataSource({required this.dioClient});

  @override
  Future<List<AnimalModel>> getAnimals({int page = 1, int pageSize = 50}) async {
    try {
      final Response<dynamic> response = await dioClient.get('/Animals');
      final List<dynamic> data = response.data;
      return data.map((dynamic json) => AnimalModel.fromJson(json as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Error fetching animals');
    }
  }

  @override
  Future<AnimalModel> fetchAnimalById(int id) async {
    try {
      final Response<dynamic> response = await dioClient.get('/Animals/$id');
      return AnimalModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Error fetching animal');
    }
  }

  @override
  Future<AnimalModel> postAnimal(AnimalModel animal) async {
    try {
      final Response<dynamic> response = await dioClient.post('/Animals', data: animal.toJson());
      return AnimalModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Error creating animal');
    }
  }

  @override
  Future<AnimalModel> putAnimal(AnimalModel animal) async {
    try {
      final Response<dynamic> response = await dioClient.put('/Animals/${animal.id}', data: animal.toJson());
      return AnimalModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Error updating animal');
    }
  }

  @override
  Future<void> deleteAnimal(int id) async {
    try {
      await dioClient.delete('/Animals/$id');
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Error deleting animal');
    }
  }
}
