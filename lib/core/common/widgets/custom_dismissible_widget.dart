
import 'package:flutter/material.dart';

class CustomDismissibleWidget extends StatefulWidget {
  const CustomDismissibleWidget({
    required Key super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 250),
    required this.onTap,
  });
  final Widget child;
  final Duration duration;
  final VoidCallback onTap;
  @override
  State<CustomDismissibleWidget> createState() =>
      _CustomDismissibleWidgetState();
}

class _CustomDismissibleWidgetState extends State<CustomDismissibleWidget> {
  double offsetX = 0;
  final double maxSlide = -60;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background button
        Positioned.fill(
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: widget.onTap,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(16),
                    left: Radius.circular(16),
                  ),
                ),
                width: maxSlide.abs(),
                alignment: Alignment.center,
                child: const Icon(Icons.delete, color: Colors.white),
              ),
            ),
          ),
        ),
        GestureDetector(
          onHorizontalDragUpdate: (details) {
            setState(() {
              if (details.delta.dx < 0) {
                offsetX = maxSlide;
              } else {
                offsetX = 0;
              }
            });
          },
          child: AnimatedContainer(
            duration: widget.duration,
            curve: Curves.easeOut,
            transform: Matrix4.translationValues(offsetX, 0, 0),
            child: ColoredBox(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: widget.child,
            ),
          ),
        ),
      ],
    );
  }
}
