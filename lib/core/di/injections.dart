import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shoppy/core/helpers/shared_preferences_helper.dart';
import 'package:shoppy/core/network/dio_helper.dart';
import 'package:shoppy/core/theme/app_theme.dart';
import 'package:shoppy/features/cart/data/data_source/cart_data_source.dart';
import 'package:shoppy/features/cart/data/repositories/cart_repository.dart';
import 'package:shoppy/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:shoppy/features/products/data/data_source/category_remote_data_source.dart';
import 'package:shoppy/features/products/data/data_source/product_remote_data_source.dart';
import 'package:shoppy/features/products/data/repositories/category_repository.dart';
import 'package:shoppy/features/products/data/repositories/product_repository.dart';
import 'package:shoppy/features/products/presentation/view_model/category_cubit/category_cubit.dart';
import 'package:shoppy/features/products/presentation/view_model/products_cubit/product_cubit.dart';
import 'package:shoppy/features/search/data/data_source/search_product_remote_data_source.dart';
import 'package:shoppy/features/search/data/repositories/search_product_repository.dart';
import 'package:shoppy/features/search/presentation/view_model/search_cubit/search_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  await Hive.initFlutter();
  await SharedPrefsHelper.init();
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => DioHelper(getIt()));
  // Data Sources =======================================================
  getIt.registerLazySingleton(() => ProductRemoteDataSource(getIt()));
  getIt.registerLazySingleton(() => CategoryRemoteDataSource(getIt()));
  getIt.registerLazySingleton(() => SearchProductRemoteDataSource(getIt()));
  getIt.registerLazySingleton(() => CartDataSource());
  // Repositories =======================================================
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<SearchProductRepository>(
    () => SearchProductRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(getIt()),
  );
  // Cubits =============================================================
  getIt.registerFactory(() => ProductCubit(getIt()));
  getIt.registerFactory(() => CategoryCubit(getIt()));
  getIt.registerFactory(() => SearchCubit(getIt()));
  getIt.registerFactory(() => CartCubit(getIt()));
  getIt.registerFactory(() => ThemeCubit());
}
