import 'package:shoppy/core/common/models/product.dart';
import 'package:shoppy/feature/cart/data/data_source/cart_data_source.dart';

abstract class CartRepository {
  Future<List<Product>> getCart();
  Future<void> removeFromCart(int productId);
  Future<void> addToCart(Product product);
  Future<void> clearCart();
}

class CartRepositoryImpl implements CartRepository {
  CartDataSource remote;
  CartRepositoryImpl(this.remote);
  @override
  Future<List<Product>> getCart() {
    return remote.getCartData();
  }

  @override
  Future<void> removeFromCart(int productId) {
    return remote.removeFromCart(productId);
  }

  @override
  Future<void> addToCart(Product product) {
    return remote.addToCart(product);
  }

  @override
  Future<void> clearCart() {
    return remote.clearCart();
  }
}
