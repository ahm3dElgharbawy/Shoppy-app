import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shoppy/core/common/widgets/circle_container.dart';
import 'package:shoppy/core/extensions/screen_size.dart';

class EmptyPlaceholder extends StatelessWidget {
  final String message;
  final String description;
  final IconData icon;
  const EmptyPlaceholder({
    super.key,
    required this.message,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleContainer(
              padding: const EdgeInsets.all(20),
              backgroundColor: theme.primaryColor.withValues(alpha: 0.1),
              child: Icon(icon, size: 60, color: theme.primaryColor),
            ),
          
            const SizedBox(height: 20),
          
            Text(
              message,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          
            const SizedBox(height: 8),
          
            SizedBox(
              width: context.screenWidth * .7,
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey,height: 1.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
