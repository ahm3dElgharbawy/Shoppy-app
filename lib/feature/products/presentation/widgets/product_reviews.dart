import 'package:flutter/material.dart';
import 'package:shoppy/core/common/widgets/circle_container.dart';
import 'package:shoppy/core/constants/app_colors.dart';
import 'package:shoppy/core/constants/app_sizes.dart';
import 'package:shoppy/core/constants/app_text_styles.dart';
import 'package:shoppy/core/extensions/string.dart';
import 'package:shoppy/core/common/models/product.dart';
import 'package:shoppy/feature/products/presentation/widgets/rating_bar.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Reviews", style: AppTextStyles.headline3),
        ...product.reviews.map(
          (review) => Padding(
            padding: const EdgeInsets.only(bottom: AppSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleContainer(
                      backgroundColor: AppColors.primary.withValues(alpha: .4),
                      child: Text(review.reviewerName[0].toUpperCase()),
                    ),
                    AppSizes.wSpaceSm,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(review.reviewerName, style: AppTextStyles.caption),
                        AppSizes.hSpaceXs,
                        RatingBar(rating: review.rating, size: 18),
                      ],
                    ),
                    Spacer(),
                    Text(review.date.inAgo),
                  ],
                ),
                Text(review.comment),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
