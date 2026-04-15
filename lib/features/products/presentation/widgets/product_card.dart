import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoppy/core/common/widgets/stadium_container.dart';
import 'package:shoppy/core/constants/app_text_styles.dart';
import 'package:shoppy/core/extensions/navigation.dart';
import 'package:shoppy/core/helpers/helper_functions.dart';
import 'package:shoppy/core/common/models/product.dart';
import 'package:shoppy/features/products/presentation/view/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    String uId = generateShortId();
    return GestureDetector(
      onTap: () {
        context.push(ProductDetailsScreen(product: product, heroId: uId));
      },
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: Hero(
                      tag: uId,
                      child: CachedNetworkImage(imageUrl: product.thumbnail),
                    ),
                  ),
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "\$${product.priceAfterDiscount.toStringAsFixed(2)}",
                    style: AppTextStyles.bodyText2.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: StadiumContainer(
              backgroundColor: Colors.red.withValues(alpha: .8),
              padding: EdgeInsetsGeometry.all(5),
              child: Text(
                "-${product.discountPercentage.round()}%",
                style: AppTextStyles.caption.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
