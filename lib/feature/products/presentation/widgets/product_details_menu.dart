import 'package:flutter/material.dart';
import 'package:shoppy/core/common/models/product.dart';
import 'package:shoppy/core/constants/app_sizes.dart';
import 'package:shoppy/core/constants/app_text_styles.dart';
import 'package:shoppy/core/extensions/screen_size.dart';
import 'package:shoppy/core/extensions/theme_mode.dart';
import 'package:shoppy/feature/products/presentation/widgets/product_reviews.dart';

class ProductDetailsMenu extends StatelessWidget {
  const ProductDetailsMenu({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: AppSizes.md,
        end: AppSizes.md,
        top: AppSizes.lg,
      ),
      width: context.screenWidth,
      decoration: BoxDecoration(
        color: context.isDark ? Color(0xff1E1E1E) : Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.radiusXl),
        ),
      ),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.title, style: AppTextStyles.headline3),
            _buildPrice(),
            AppSizes.hSpaceMd,
            Text(product.description, style: AppTextStyles.bodyText2),
            AppSizes.hSpaceMd,
            _buildShippingInfo(),
            AppSizes.hSpaceMd,
            ProductReviews(product: product),
          ],
        ),
      ),
    );
  }

  Widget _buildShippingInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("🚚 ${product.shippingInformation}"),
        Text("🛡 ${product.warrantyInformation}"),
        Text("🔄 ${product.returnPolicy}"),
      ],
    );
  }

  Widget _buildPrice() {
    return Row(
      children: [
        Text(
          "\$${product.priceAfterDiscount.toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10),
        Text(
          "\$${product.price.toStringAsFixed(2)}",
          style: const TextStyle(
            decoration: TextDecoration.lineThrough,
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "-${product.discountPercentage}%",
          style: const TextStyle(color: Colors.red),
        ),
      ],
    );
  }
}
