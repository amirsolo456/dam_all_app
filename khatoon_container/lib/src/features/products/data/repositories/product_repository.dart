import 'package:khatoon_shared/index.dart';
import '../../domain/repositories/i_product_repository.dart';
import '../datasources/product_remote_data_source.dart';

class ProductRepository implements IProductRepository {
  final IProductRemoteDataSource remoteDataSource;

  ProductRepository(this.remoteDataSource);

  @override
  Future<List<Product>> getProducts() {
    return remoteDataSource.getProducts();
  }

  @override
  Future<Product> createProduct(Product product) {
    return remoteDataSource.createProduct(product);
  }

  @override
  Future<Product> updateProduct(Product product) {
    return remoteDataSource.updateProduct(product);
  }

  @override
  Future<void> deleteProduct(int id) {
    return remoteDataSource.deleteProduct(id);
  }
}
