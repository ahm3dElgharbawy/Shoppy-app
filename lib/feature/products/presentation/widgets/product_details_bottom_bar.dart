import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppy/core/common/widgets/custom_elevated_button.dart';
import 'package:shoppy/core/constants/app_colors.dart';
import 'package:shoppy/core/constants/app_sizes.dart';
import 'package:shoppy/core/constants/app_text_styles.dart';
import 'package:shoppy/core/di/injections.dart';
import 'package:shoppy/core/extensions/navigation.dart';
import 'package:shoppy/core/extensions/theme_mode.dart';
import 'package:shoppy/feature/cart/presentation/view_model/cart_cubit/cart_cubit.dart';

class ProductDetailsBottomBar extends StatelessWidget {
  const ProductDetailsBottomBar({
    super.key,
    required this.price,
    required this.onTap,
  });

  final double price;
  final Function(BuildContext) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.md),
      color: context.isDark ? Color(0xff272727) : AppColors.grey100,
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Total Price",
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                "\$${price.toStringAsFixed(2)}",
                style: AppTextStyles.headline3,
              ),
            ],
          ),
          AppSizes.wSpaceMd,
          Expanded(
            child: SizedBox(
              height: 50,
              child: BlocProvider(
                create: (context) => getIt<CartCubit>(),
                child: Builder(
                  builder: (context) {
                    return ElevatedButton.icon(
                      onPressed: () {
                        onTap(context);
                        context.pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppSizes.radiusSm,
                          ),
                        ),
                      ),
                      icon: Icon(Icons.shopping_cart_rounded),
                      label: Text("Add to cart",style: AppTextStyles.bodyText2,),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
