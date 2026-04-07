import 'package:flutter/material.dart';

class StadiumContainer extends StatelessWidget {
  const StadiumContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
    this.backgroundColor = Colors.teal,
  });
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
