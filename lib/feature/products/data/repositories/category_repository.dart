import 'package:shoppy/feature/products/data/data_source/category_remote_data_source.dart';
import 'package:shoppy/feature/products/data/models/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getCategories();
}

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remote;

  CategoryRepositoryImpl(this.remote);
  @override
  Future<List<Category>> getCategories() {
    return remote.getCategories();
  }
}
