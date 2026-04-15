import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppy/core/common/models/product.dart';
import 'package:shoppy/core/common/widgets/custom_dismissible_widget.dart';
import 'package:shoppy/core/constants/app_sizes.dart';
import 'package:shoppy/core/constants/app_text_styles.dart';
import 'package:shoppy/core/extensions/screen_size.dart';
import 'package:shoppy/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.item});
  final Product item;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
      child: CustomDismissibleWidget(
        key: ValueKey(widget.item.id),
        onTap: () {
          context.read<CartCubit>().removeFromCart(widget.item.id);
        },
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(AppSizes.radiusLg),
              ),
              child: CachedNetworkImage(
                imageUrl: widget.item.images.first,
                height: 80,
              ),
            ),
            AppSizes.wSpaceMd,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.screenWidth * .5,
                  child: Text(widget.item.title),
                ),
                AppSizes.hSpaceSm,
                Text(
                  "\$${widget.item.priceAfterDiscount.toStringAsFixed(2)}",
                  style: AppTextStyles.bodyText2.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
