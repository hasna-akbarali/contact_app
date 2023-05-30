import 'package:flutter/material.dart';

const Color yellow = Colors.yellow;
const size = 24.0;

class StarRating extends StatelessWidget {
  final double rating;

  const StarRating({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) {
          if (index < rating) {
            return const Icon(
              Icons.star,
              color: yellow,
              size: size,
            );
          } else {
            return const Icon(
              Icons.star_border,
              color: yellow,
              size: size,
            );
          }
        },
      ),
    );
  }
}
