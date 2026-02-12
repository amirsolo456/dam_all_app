import 'package:khatoon_container/src/features/animal/data/repositories/animal_repository.dart';
import 'package:khatoon_container/src/features/animal/domain/entities/animal.dart';

class GetAnimalsParamsUseCase {
  final int page;
  final int pageSize;
  GetAnimalsParamsUseCase({this.page = 1, this.pageSize = 50});
}


class GetAnimalsUseCase {
  final AnimalRepository repository;
  GetAnimalsUseCase(this.repository);


  Future<List<Animal>> call(GetAnimalsParamsUseCase params) async {
    return repository.getAnimals(page: params.page, pageSize: params.pageSize);
  }
}