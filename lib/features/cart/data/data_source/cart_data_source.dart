import 'package:hive_flutter/hive_flutter.dart';
import 'package:shoppy/core/common/models/product.dart';

class CartDataSource {
  static const String _boxName = 'cartBox';
  Box? _box;

  /// Open the box only once
  Future<Box> _getBox() async {
    if (_box != null && _box!.isOpen) return _box!;
    _box = await Hive.openBox(_boxName);
    return _box!;
  }

  Future<List<Product>> getCartData() async {
    final box = await _getBox();
    return box.values
        .map((e) => Product.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  Future<void> addToCart(Product product) async {
    final box = await _getBox();
    await box.put(product.id, product.toJson());
  }

  Future<void> removeFromCart(int productId) async {
    final box = await _getBox();
    await box.delete(productId);
  }

  Future<void> clearCart() async {
    final box = await _getBox();
    await box.clear();
  }

  Future<bool> isInCart(int productId) async {
    final box = await _getBox();
    return box.containsKey(productId);
  }
}
