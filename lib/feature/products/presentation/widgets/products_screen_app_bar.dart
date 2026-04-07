import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppy/core/common/widgets/custom_icon_button.dart';
import 'package:shoppy/core/di/injections.dart';
import 'package:shoppy/core/extensions/navigation.dart';
import 'package:shoppy/core/extensions/theme_mode.dart';
import 'package:shoppy/core/theme/app_theme.dart';
import 'package:shoppy/feature/cart/presentation/view/cart_screen.dart';
import 'package:shoppy/feature/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:shoppy/feature/search/presentation/view/search_product_screen.dart';
import 'package:shoppy/feature/search/presentation/view_model/search_cubit/search_cubit.dart';

class ProductsScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductsScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    return AppBar(
      scrolledUnderElevation: 0,
      title: Text("Products"),
      actions: [
        CustomIconButton(
          onPressed: () => context.push(
            BlocProvider(
              create: (_) => getIt<SearchCubit>(),
              child: SearchProductScreen(),
            ),
          ),
          icon: Icons.search_rounded,
          backgroundColor: Colors.grey.withValues(alpha: .5),
          foregroundColor: context.isDark ? Colors.white : Colors.black,
        ),
        CustomIconButton(
          onPressed: () => context.push(
            BlocProvider(
              create: (_) => getIt<CartCubit>(),
              child: CartScreen(),
            ),
          ),
          icon: Icons.shopping_cart_rounded,
          backgroundColor: Colors.transparent,
          foregroundColor: context.isDark ? Colors.amber : Colors.black,
        ),
        CustomIconButton(
          onPressed: () => themeCubit.toggle(),
          icon: themeCubit.state == ThemeMode.dark
              ? Icons.dark_mode
              : Icons.sunny,
        ),
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
