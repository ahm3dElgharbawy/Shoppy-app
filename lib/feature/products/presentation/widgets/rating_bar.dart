import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final double rating;
  final int maxRating;
  final double size;
  final Color filledColor;
  final Color emptyColor;

  const RatingBar({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.size = 20,
    this.filledColor = Colors.amber,
    this.emptyColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(maxRating, (index) {
        if (index < rating.floor()) {
          // full star
          return Icon(Icons.star, size: size, color: filledColor);
        } else if (index < rating && rating % 1 != 0) {
          // half star
          return Icon(Icons.star_half, size: size, color: filledColor);
        } else {
          // empty star
          return Icon(Icons.star_border, size: size, color: emptyColor);
        }
      }),
    );
  }
}
