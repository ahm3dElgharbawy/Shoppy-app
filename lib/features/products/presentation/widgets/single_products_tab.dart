import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppy/core/common/widgets/products_grid.dart';
import 'package:shoppy/core/di/injections.dart';
import 'package:shoppy/features/products/presentation/view_model/products_cubit/product_cubit.dart';
import 'package:shoppy/features/products/presentation/view_model/products_cubit/product_state.dart';

class SingleProductsTab extends StatefulWidget {
  const SingleProductsTab({super.key, this.category});
  final String? category;
  @override
  State<SingleProductsTab> createState() => _SingleProductsTabState();
}

class _SingleProductsTabState extends State<SingleProductsTab>
    with AutomaticKeepAliveClientMixin {
  final ProductCubit productCubit = getIt();
  @override
  void initState() {
    _fetchProducts();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider.value(
      value: productCubit,
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return ProductsGrid(
            products: productCubit.products,
            onScrollEnded: () {
              _fetchProducts();
            },
            isLoading: state is ProductLoading,
          );
        },
      ),
    );
  }

  void _fetchProducts() {
    if (widget.category != null) {
      productCubit.fetchCategoryProducts(widget.category!);
    } else {
      productCubit.fetch();
    }
  }
}


