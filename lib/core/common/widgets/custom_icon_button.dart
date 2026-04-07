import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
  });
  final VoidCallback onPressed;
  final IconData icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      padding: EdgeInsets.zero,
      color: foregroundColor,
      constraints: BoxConstraints(minHeight: 35, minWidth: 35),
      style: IconButton.styleFrom(backgroundColor: backgroundColor),
      // constraints: const BoxConstraints(),
    );
  }
}
