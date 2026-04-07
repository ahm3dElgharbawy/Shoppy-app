import 'package:flutter/material.dart';
import 'package:shoppy/core/constants/app_images.dart';
import 'package:shoppy/core/extensions/navigation.dart';
import 'package:shoppy/core/extensions/screen_size.dart';
import 'package:shoppy/feature/products/presentation/view/products_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..addListener(() {
            if (_controller.isCompleted) {
              context.pushAndRemoveAll(ProductsScreen());
            }
          });

    _animation = Tween<Offset>(
      begin: Offset(-1, 0), // from left
      end: Offset(0, 0), // to center
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SlideTransition(
          position: _animation,
          child: Image.asset(
            AppImages.logo,
            height: context.screenHeight * .25,
          ),
        ),
      ),
    );
  }
}
