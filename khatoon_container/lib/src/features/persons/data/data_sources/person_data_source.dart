// ignore: implementation_imports
import 'package:dio/src/response.dart';
import 'package:khatoon_container/src/core/storage/services/api_service.dart';
import 'package:khatoon_container/src/features/persons/data/models/person_model.dart';
import 'package:khatoon_container/src/features/persons/domain/repositories/i_person_repository.dart';

class PersonDataSource implements IPersonRepository {
  final ApiService apiService;
  static String personPath = 'person';

  const PersonDataSource({required this.apiService});

  @override
  Future<void> addPerson(PersonModel person) async {
    await apiService.post(
      personPath,
      data: person,
      options: .new(method: 'post'),
    );
  }

  @override
  Future<void> deletePerson(String id) async {
    final Map<String, String> a = <String, String>{'ID': id};
    await apiService.delete(
      personPath,
      queryParameters: a,
      options: .new(method: 'delete'),
    );
  }

  @override
  Future<List<PersonModel>> getPersons() async {
    final Response<List<PersonModel>> data = await apiService.get<PersonModel>(
      personPath,
      options: .new(method: 'get'),
    );

    return data.data!
        .map((dynamic json) => PersonModel.fromJson(json))
        .toList();
  }

  @override
  Future<void> updatePerson(PersonModel person) async {
    await apiService.put<PersonModel>(personPath, options: .new(method: 'put'));
  }
}

final String json =
    '{ PersonModel : [id:0,name:amir,familyName:soleymani,phoneNumber:09109947300,town:zanjan,street:karmandan,fullAddress:zanjan_shahrak karmandan kh 10 west part 183}';
