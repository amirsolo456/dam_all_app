import 'package:khatoon_container/src/features/products/domain/repositories/i_product_repository.dart';
import 'package:khatoon_shared/index.dart';

class CreateProductUseCase {
  final IProductRepository repository;

  CreateProductUseCase({required this.repository});

  Future<Product> execute(Product product) {
    return repository.createProduct(product);
  }
}
