import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppy/core/di/injections.dart';
import 'package:shoppy/features/products/presentation/view_model/category_cubit/category_cubit.dart';
import 'package:shoppy/features/products/presentation/widgets/products_screen_body.dart';
import 'package:shoppy/features/products/presentation/widgets/products_screen_app_bar.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});
  static final String route = '/products';
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late CategoryCubit categoryCubit;
  @override
  void initState() {
    super.initState();
    categoryCubit = getIt<CategoryCubit>()..fetch();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => categoryCubit)],
      child: Scaffold(
        appBar: ProductsScreenAppBar(),
        body: ProductsScreenBody(),
      ),
    );
  }
}
