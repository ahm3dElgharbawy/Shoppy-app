import 'package:shoppy/core/common/models/product.dart';

final class CartState {
  final List<Product> items;

  CartState({required this.items});

  CartState copyWith({List<Product>? items, double? total}) {
    return CartState(items: items ?? this.items);
  }

  double get totalPrice {
    double price = 0;
    for (final item in items) {
      price += item.priceAfterDiscount;
    }
    return price;
  }
}
