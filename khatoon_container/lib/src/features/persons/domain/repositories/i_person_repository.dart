import 'package:khatoon_container/src/features/persons/data/models/person_model.dart';

abstract class IPersonRepository {
  // Purchase Invoices
  Future<List<PersonModel>> getPersons();

  Future<void> addPerson(PersonModel person);

  Future<void> deletePerson(int id);

  Future<void> updatePerson(PersonModel person);
}
