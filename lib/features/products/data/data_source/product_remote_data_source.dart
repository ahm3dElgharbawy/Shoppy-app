import 'package:shoppy/core/constants/api_endpoints.dart';
import 'package:shoppy/core/network/dio_helper.dart';
import 'package:shoppy/core/common/models/product.dart';

class ProductRemoteDataSource {
  final DioHelper dio;

  ProductRemoteDataSource(this.dio);

  Future<List<Product>> getProducts(int skip,[String? category]) async {
    final res = await dio.get(
      category==null ? ApiEndpoints.productsRoute : '${ApiEndpoints.productsRoute}/category/$category',
      query: {"limit": 10, "skip": skip},
    );

    return List.from(
      res.data['products'],
    ).map((e) => Product.fromJson(e)).toList();
  }
}
