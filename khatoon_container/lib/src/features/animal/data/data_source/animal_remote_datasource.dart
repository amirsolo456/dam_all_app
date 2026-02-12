import 'package:dio/dio.dart';
import 'package:khatoon_container/src/core/storage/services/errors/exceptions.dart';
import 'package:khatoon_container/src/features/animal/data/models/animal_model.dart';
// ignore: depend_on_referenced_packages
import 'dart:convert';
abstract class IAnimalRemoteDataSource {
  Future<List<AnimalModel>> getAnimals({int page = 1, int pageSize = 50});
  Future<AnimalModel> fetchAnimalById(String id);
  Future<AnimalModel> postAnimal(AnimalModel animal);
  Future<AnimalModel> putAnimal(AnimalModel animal);
  Future<void> deleteAnimal(String id);
}

class AnimalRemoteDataSource implements IAnimalRemoteDataSource {
  final Dio dioClient;
  final String baseUrl;


  AnimalRemoteDataSource({required this.dioClient, required this.baseUrl});


  @override
  Future<List<AnimalModel>> getAnimals({int page = 1, int pageSize = 50}) async {
    final Uri _ = Uri.parse('$baseUrl/animals?page=$page&pageSize=$pageSize');
    final Response<dynamic> response = await dioClient.get('$baseUrl/animals?page=$page&pageSize=$pageSize');

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((dynamic json) =>  AnimalModel.fromJson(json)).toList();
    }
    throw ServerException(   message: '');
  }


  @override
  Future<AnimalModel> fetchAnimalById(String id) async {
    // final Uri uri = Uri.parse('$baseUrl/animals/$id');
    final Response<dynamic> response = await dioClient.get('$baseUrl/animals/$id');
    if (response.statusCode == 200) {
      final dynamic data = response.data;
      return data.map((dynamic json) =>  AnimalModel.fromJson(json));
    }
    throw ServerException(   message: '');
  }


  @override
  Future<AnimalModel> postAnimal(AnimalModel animal) async {
    final Response<dynamic> response  = await dioClient.post('$baseUrl/animals',data: animal.toJson());
    if (response.statusCode == 201 || response.statusCode == 200) {
      return AnimalModel.fromJson(json.decode(response.data) as Map<String, dynamic>);
    }
    throw ServerException(   message: '');
  }


  @override
  Future<AnimalModel> putAnimal(AnimalModel animal) async {
    final  Response<dynamic> response = await dioClient.put('$baseUrl/animals/${animal.id}', data: json.encode(animal.toJson()));
    if (response.statusCode == 200) {
      return AnimalModel.fromJson(json.decode(response.data) as Map<String, dynamic>);
    }
    throw ServerException(   message: '');
  }


  @override
  Future<void> deleteAnimal(String id) async {
    final Response<dynamic> response = await dioClient.delete('$baseUrl/animals/$id');
    if (response.statusCode == 200 || response.statusCode == 204) return;
    throw ServerException(   message: '');
  }
}