import 'package:dio/dio.dart';
import 'package:khatoon_shared/index.dart';

abstract class IProductRemoteDataSource {
  Future<List<Product>> getProducts();
  Future<Product> createProduct(Product product);
  Future<Product> updateProduct(Product product);
  Future<void> deleteProduct(int id);
}

class ProductRemoteDataSource implements IProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSource(this.dio);

  @override
  Future<List<Product>> getProducts() async {
    final response = await dio.get('/Products');
    final List<dynamic> data = response.data;
    return data.map((e) => Product.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<Product> createProduct(Product product) async {
    final response = await dio.post('/Products', data: product.toJson());
    return Product.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<Product> updateProduct(Product product) async {
    final response = await dio.put('/Products/${product.id}', data: product.toJson());
    return Product.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> deleteProduct(int id) async {
    await dio.delete('/Products/$id');
  }
}
