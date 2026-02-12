import 'package:khatoon_container/src/features/persons/data/data_sources/person_data_source.dart';
import 'package:khatoon_container/src/features/persons/data/models/person_model.dart';

class GetPersonUseCase {
  final PersonDataSource personDataSource;

  const GetPersonUseCase({required this.personDataSource});

  Future<List<PersonModel>> execute() async {
    return await personDataSource.getPersons();
  }
}

class UpdatePersonUseCase {
  final PersonDataSource personDataSource;

  const UpdatePersonUseCase({required this.personDataSource});

  Future<void> execute(PersonModel person) async {
    return await personDataSource.updatePerson(person);
  }
}

class DeletePersonUseCase {
  final PersonDataSource personDataSource;

  const DeletePersonUseCase({required this.personDataSource});

  Future<void> execute(String personId) async {
    return await personDataSource.deletePerson(personId);
  }
}

class InsertPersonUseCase {
  final PersonDataSource personDataSource;

  const InsertPersonUseCase({required this.personDataSource});

  Future<void> execute(PersonModel person) async {
    return await personDataSource.addPerson(person);
  }
}
