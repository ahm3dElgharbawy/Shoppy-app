import 'package:flutter/material.dart';
import 'package:shoppy/core/constants/app_colors.dart';
import 'package:shoppy/core/constants/app_sizes.dart';

class SearchHeaderBackground extends StatelessWidget {
  const SearchHeaderBackground({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppSizes.radiusXl),
        ),
      ),
      child: SafeArea(
        child: Padding(padding: const EdgeInsets.only(top: 20,bottom: 5), child: child),
      ),
    );
  }
}
