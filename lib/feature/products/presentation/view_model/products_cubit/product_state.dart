import 'package:flutter/cupertino.dart';
import 'package:shoppy/core/common/models/product.dart';

@immutable
sealed class ProductState {}

class ProductInitial extends ProductState {}
class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<Product> products;
  ProductSuccess(this.products);
}

class ProductFailure extends ProductState {}
