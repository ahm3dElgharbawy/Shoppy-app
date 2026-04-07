import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppy/core/common/widgets/products_grid.dart';
import 'package:shoppy/feature/search/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:shoppy/feature/search/presentation/view_model/search_cubit/search_state.dart';
import 'package:shoppy/feature/search/presentation/widgets/custom_search_field.dart';
import 'package:shoppy/feature/search/presentation/widgets/recent_search.dart';
import 'package:shoppy/feature/search/presentation/widgets/search_header_background.dart';

class SearchProductScreen extends StatefulWidget {
  const SearchProductScreen({super.key});

  @override
  State<SearchProductScreen> createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  final TextEditingController searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Column(
          children: [
            SearchHeaderBackground(
              child: CustomSearchField(
                onSubmitted: (value) {
                  cubit.onSearchSubmitted(value.trim());
                },
                controller: searchTextController,
              ),
            ),

            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchInitial) {
                    return RecentSearch(
                      onClear: cubit.clearRecent,
                      onChanged: (q) {
                        searchTextController.text = q;
                        cubit.search(q);
                      },
                    );
                  } else if (state is SearchFailure) {
                    return Icon(Icons.error);
                  }
                  return ProductsGrid(
                    products: cubit.products,
                    onScrollEnded: () {
                      cubit.search(searchTextController.text.trim());
                    },
                    isLoading: state is SearchLoading,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
