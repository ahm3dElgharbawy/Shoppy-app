import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(15),
    this.backgroundColor = Colors.blueAccent,
  });
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
      child: child,
    );
  }
}
