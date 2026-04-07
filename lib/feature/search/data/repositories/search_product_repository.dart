import 'package:shoppy/core/common/models/product.dart';
import 'package:shoppy/feature/search/data/data_source/search_product_remote_data_source.dart';

abstract class SearchProductRepository {
  Future<List<Product>> searchProducts(String query, int skip);
}

class SearchProductRepositoryImpl implements SearchProductRepository {
  final SearchProductRemoteDataSource remote;

  SearchProductRepositoryImpl(this.remote);
  @override
  Future<List<Product>> searchProducts(query, skip) {
    return remote.getProducts(query, skip);
  }
}
