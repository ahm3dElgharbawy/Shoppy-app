import 'package:flutter/cupertino.dart';
import 'package:shoppy/core/common/models/product.dart';

@immutable
sealed class SearchState {}

class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Product> products;
  SearchSuccess(this.products);
}

class SearchFailure extends SearchState {}
