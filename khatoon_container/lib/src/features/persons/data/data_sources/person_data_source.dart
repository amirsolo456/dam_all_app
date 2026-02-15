// ignore: implementation_imports
import 'package:dio/src/response.dart';
import 'package:khatoon_container/src/core/storage/services/api_service.dart';
import 'package:khatoon_container/src/features/persons/data/models/person_model.dart';
import 'package:khatoon_container/src/features/persons/domain/repositories/i_person_repository.dart';

class PersonDataSource implements IPersonRepository {
  final ApiService apiService;
  static String personPath = 'Parties'; // Changed from 'person' to match backend

  const PersonDataSource({required this.apiService});

  @override
  Future<void> addPerson(PersonModel person) async {
    await apiService.post(
      personPath,
      data: person.toJson(),
    );
  }

  @override
  Future<void> deletePerson(int id) async {
    await apiService.delete(
      '$personPath/$id',
    );
  }

  @override
  Future<List<PersonModel>> getPersons() async {
    final Response<dynamic> response = await apiService.get<dynamic>(
      personPath,
    );

    final List<dynamic> data = response.data as List<dynamic>;
    return data
        .map((dynamic json) => PersonModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> updatePerson(PersonModel person) async {
    await apiService.put(
      '$personPath/${person.id}',
      data: person.toJson(),
    );
  }
}
