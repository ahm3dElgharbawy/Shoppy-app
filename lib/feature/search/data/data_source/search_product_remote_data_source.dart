import 'package:shoppy/core/constants/api_endpoints.dart';
import 'package:shoppy/core/network/dio_helper.dart';
import 'package:shoppy/core/common/models/product.dart';

class SearchProductRemoteDataSource {
  final DioHelper dio;

  SearchProductRemoteDataSource(this.dio);

  Future<List<Product>> getProducts(String query, int skip) async {
    final res = await dio.get(
      ApiEndpoints.searchProductsRoute,
      query: {"q": query, "limit": 10, "skip": skip},
    );

    return List.from(
      res.data['products'],
    ).map((e) => Product.fromJson(e)).toList();
  }
}
