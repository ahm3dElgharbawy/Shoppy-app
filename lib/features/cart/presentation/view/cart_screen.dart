import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppy/core/common/widgets/custom_elevated_button.dart';
import 'package:shoppy/core/common/widgets/empty_products.dart';
import 'package:shoppy/core/constants/app_sizes.dart';
import 'package:shoppy/core/constants/app_text_styles.dart';
import 'package:shoppy/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:shoppy/features/cart/presentation/view_model/cart_cubit/cart_state.dart';
import 'package:shoppy/features/cart/presentation/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                // appbar
                Padding(
                  padding: const EdgeInsets.all(AppSizes.md),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("My Cart", style: AppTextStyles.headline2),
                      Text(
                        "${state.items.length} Items",
                        style: AppTextStyles.bodyText1,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: state.items.isEmpty
                      ? EmptyPlaceholder(
                          message: "Your cart is empty",
                          description: "Find something you like and add it to your cart to get started.",
                          icon: Icons.shopping_cart,
                        )
                      : ListView.separated(
                          itemCount: state.items.length,
                          separatorBuilder: (_, __) => AppSizes.hSpaceMd,
                          itemBuilder: (_, i) => CartItem(item: state.items[i]),
                        ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.all(AppSizes.md),
                  child: CustomElevatedButton(
                    onPressed: () {},
                    title: "Check Out \$${state.totalPrice.toStringAsFixed(2)}",
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
