
import 'package:shoppy/feature/products/data/models/category.dart';

sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<Category> categories;
  CategorySuccess(this.categories);
}

class CategoryFailure extends CategoryState {}