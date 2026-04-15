import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppy/core/common/models/product.dart';
import 'package:shoppy/features/products/data/repositories/product_repository.dart';
import 'package:shoppy/features/products/presentation/view_model/products_cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repo;

  ProductCubit(this.repo) : super(ProductInitial());

  List<Product> products = [];
  int skip = 0;
  bool reachedToEnd = false;
  Future<void> fetch() async {
    if (state is ProductLoading || reachedToEnd) return;
    emit(ProductLoading());
    try {
      final data = await repo.getProducts(skip);
      skip += 10; // paginate data
      products.addAll(data);
      if (data.length < 10) {
        reachedToEnd = true;
      }
      emit(ProductSuccess(products));
    } catch (e) {
      emit(ProductFailure());
    }
  }

  Future<void> fetchCategoryProducts(String category) async {
    if (state is ProductLoading || reachedToEnd) return;
    emit(ProductLoading());
    try {
      final data = await repo.getCategoryProducts(skip, category);
      skip += 10; // paginate data
      products.addAll(data);
      if (data.length < 10) {
        reachedToEnd = true;
      }
      emit(ProductSuccess(products));
    } catch (e) {
      emit(ProductFailure());
    }
  }
}
