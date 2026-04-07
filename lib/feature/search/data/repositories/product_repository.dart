import 'package:shoppy/feature/products/data/data_source/product_remote_data_source.dart';
import 'package:shoppy/core/common/models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts(int skip);
  Future<List<Product>> getCategoryProducts(int skip, String category );
}

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remote;

  ProductRepositoryImpl(this.remote);

  @override
  Future<List<Product>> getProducts(int skip) {
    return remote.getProducts(skip);
  }
  
  @override
  Future<List<Product>> getCategoryProducts(int skip, String category) {
    return remote.getProducts(skip,category);
  }
}
