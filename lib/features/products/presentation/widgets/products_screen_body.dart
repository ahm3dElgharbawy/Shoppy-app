import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppy/features/products/presentation/widgets/category_tabs_app_bar.dart';
import 'package:shoppy/features/products/presentation/widgets/single_products_tab.dart';
import 'package:shoppy/features/products/presentation/view_model/category_cubit/category_cubit.dart';
import 'package:shoppy/features/products/presentation/view_model/category_cubit/category_state.dart';

class ProductsScreenBody extends StatelessWidget {
  const ProductsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        final categoriesCubit = context.read<CategoryCubit>();
        return DefaultTabController(
          length: categoriesCubit.categories.length + 1,
          child: NestedScrollView(
            headerSliverBuilder: (_, __) => [
              if (state is CategorySuccess)
                CategoryTabsAppBar(categories: state.categories),
            ],
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                // All tab
                SingleProductsTab(),
                // Category tabs
                ...categoriesCubit.categories.map((c) {
                  return SingleProductsTab(category: c.slug);
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
