import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppy/core/di/injections.dart';
import 'package:shoppy/core/theme/app_theme.dart';
import 'package:shoppy/features/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ThemeCubit>()..loadTheme(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp(
            title: "Shoppy",
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: mode,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
