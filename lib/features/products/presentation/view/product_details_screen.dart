
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppy/core/constants/app_colors.dart';
import 'package:shoppy/core/extensions/theme_mode.dart';
import 'package:shoppy/core/common/models/product.dart';
import 'package:shoppy/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:shoppy/features/products/presentation/widgets/product_details_bottom_bar.dart';
import 'package:shoppy/features/products/presentation/widgets/product_details_menu.dart';
import 'package:shoppy/features/products/presentation/widgets/product_details_sliver_app_bar.dart';
import 'package:shoppy/features/products/presentation/widgets/product_details_top_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.product,
    required this.heroId,
  });
  final Product product;
  final String heroId;
  static final route = 'productDetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDark ? Color(0xff272727) : AppColors.grey300,
      bottomNavigationBar: ProductDetailsBottomBar(
        onTap: (context) => context.read<CartCubit>().addToCart(product),
        price: product.priceAfterDiscount,
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              ProductDetailsSliverAppBar(product: product, heroId: heroId),
              SliverFillRemaining(child: ProductDetailsMenu(product: product)),
            ],
          ),
          ProductDetailsTopBar(rating: product.rating),
        ],
      ),
    );
  }
}
