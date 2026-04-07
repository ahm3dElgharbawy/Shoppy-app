import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppy/core/common/models/product.dart';
import 'package:shoppy/feature/cart/data/repositories/cart_repository.dart';
import 'package:shoppy/feature/cart/presentation/view_model/cart_cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository repo;
  CartCubit(this.repo) : super(CartState(items: [])) {
    loadCart();
  }

  void loadCart() async {
    final items = await repo.getCart();
    emit(CartState(items: items));
  }

  Future<void> clearCart() async {
    await repo.clearCart();
    loadCart();
  }
  Future<void> removeFromCart(int productId) async {
    await repo.removeFromCart(productId);
    loadCart();
  }

  Future<void> addToCart(Product product) async {
    await repo.addToCart(product);
    loadCart();
  }
}
