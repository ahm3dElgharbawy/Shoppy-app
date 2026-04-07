import 'package:flutter/material.dart';
import 'package:shoppy/core/common/widgets/custom_icon_button.dart';
import 'package:shoppy/core/constants/app_colors.dart';
import 'package:shoppy/core/constants/app_sizes.dart';
import 'package:shoppy/core/constants/app_text_styles.dart';
import 'package:shoppy/core/extensions/navigation.dart';

class ProductDetailsTopBar extends StatelessWidget {
  const ProductDetailsTopBar({super.key, required this.rating});
  final double rating;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icons.arrow_back,
            ),
            Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: StadiumBorder(),
              ),
              padding: EdgeInsets.symmetric(horizontal: AppSizes.sm),
              child: Row(
                children: [
                  Text(
                    rating.round().toString(),
                    style: AppTextStyles.bodyText2.copyWith(color: Colors.black),
                  ),
                  AppSizes.wSpaceXs,
                  Icon(
                    Icons.star_rounded,
                    color: AppColors.secondary,
                    size: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
