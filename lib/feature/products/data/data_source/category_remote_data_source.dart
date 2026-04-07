import 'package:shoppy/core/constants/api_endpoints.dart';
import 'package:shoppy/core/network/dio_helper.dart';
import 'package:shoppy/feature/products/data/models/category.dart';

class CategoryRemoteDataSource {
  final DioHelper dio;

  CategoryRemoteDataSource(this.dio);

  Future<List<Category>> getCategories() async {
    final res = await dio.get(ApiEndpoints.categoriesRoute);

    return List.from(res.data).map((e) => Category.fromJson(e)).toList();
  }
}
