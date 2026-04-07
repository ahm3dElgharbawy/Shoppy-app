import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppy/core/constants/app_colors.dart';
import 'package:shoppy/core/helpers/shared_preferences_helper.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,

    scaffoldBackgroundColor: AppColors.lightBackground,
    cardColor: Color(0xffEFEFEF),
    cardTheme: CardThemeData(color: AppColors.lightSurface),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.lightTextPrimary),
      bodyMedium: TextStyle(color: AppColors.lightTextSecondary),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightSurface,
      foregroundColor: AppColors.lightTextPrimary,
      elevation: 0,
    ),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,

    scaffoldBackgroundColor: AppColors.darkBackground,
    cardColor: AppColors.darkSurface,
    cardTheme: CardThemeData(color: AppColors.darkSurface),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.darkTextPrimary),
      bodyMedium: TextStyle(color: AppColors.darkTextSecondary),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkSurface,
      foregroundColor: AppColors.darkTextPrimary,
      elevation: 0,
    ),
  );
}

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.dark);

  void toggle() {
    emit(state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
    cacheTheme();
  }

  loadTheme() {
    bool isDark = SharedPrefsHelper.getBool('isDark', defaultValue: true);
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  void cacheTheme() {
    SharedPrefsHelper.setBool('isDark', state == ThemeMode.dark ? true : false);
  }
}
