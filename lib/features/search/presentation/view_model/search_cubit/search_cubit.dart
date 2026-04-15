import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppy/core/common/models/product.dart';
import 'package:shoppy/core/constants/pref_keys.dart';
import 'package:shoppy/core/helpers/shared_preferences_helper.dart';
import 'package:shoppy/features/search/data/repositories/search_product_repository.dart';
import 'package:shoppy/features/search/presentation/view_model/search_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchProductRepository repo;

  SearchCubit(this.repo) : super(SearchInitial()) {
    _loadRecentFromCache();
  }

  List<Product> products = [];
  Set<String> recent = {};
  int skip = 0;
  bool reachedToEnd = false;
  Timer? _debounce;

  // bool reachedToEnd = false;
  Future<void> search(String query) async {
    if (state is SearchLoading || reachedToEnd) return;
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());
    try {
      final data = await repo.searchProducts(query, skip);
      skip += 10; // paginate data
      products.addAll(data);
      if (data.length < 10) {
        reachedToEnd = true;
      }
      emit(SearchSuccess(products));
    } catch (e) {
      emit(SearchFailure());
    }
  }

  void onSearchSubmitted(String query) {
    // if (_debounce?.isActive ?? false) _debounce!.cancel();
    clearSearch();
    if (query.isNotEmpty) {
      recent.add(query);
      _saveRecentToCache();
    }
    search(query);
    // _debounce = Timer(const Duration(milliseconds: 1000), () {
    //   products.clear(); // avoid re append products
    //   search(query);
    // });
  }

  Future<void> _saveRecentToCache() async {
    await SharedPrefsHelper.setStringList(
      PrefKeys.recentSearches,
      recent.toList(),
    );
  }

  void _loadRecentFromCache() {
    final data = SharedPrefsHelper.getStringList(PrefKeys.recentSearches);

    recent = data.toSet();
    emit(SearchInitial()); // optional to refresh UI
  }

  void clearRecent() {
    recent.clear();
    SharedPrefsHelper.remove(PrefKeys.recentSearches);
    emit(SearchInitial());
  }

  clearSearch() {
    reachedToEnd = false;
    skip = 0;
    products.clear();
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
