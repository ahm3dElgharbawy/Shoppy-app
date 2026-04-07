import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppy/feature/products/data/models/category.dart';
import 'package:shoppy/feature/products/data/repositories/category_repository.dart';
import 'package:shoppy/feature/products/presentation/view_model/category_cubit/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository repo;
  CategoryCubit(this.repo) : super(CategoryInitial());
  List<Category> categories = [];
  Future<void> fetch() async {
    emit(CategoryLoading());
    try {
      final data = await repo.getCategories();
      categories.addAll(data);
      
      emit(CategorySuccess(categories));
    } catch (e) {
      emit(CategoryFailure());
    }
  }
}
