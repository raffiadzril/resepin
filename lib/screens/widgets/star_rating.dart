import 'package:flutter/material.dart';
import 'package:resepin/core/constants/app_colors.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double size;
  final bool showRatingNumber;
  final VoidCallback? onTap;

  const StarRating({
    super.key,
    required this.rating,
    this.size = 16.0,
    this.showRatingNumber = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              return Icon(
                index < rating.floor()
                    ? Icons.star
                    : (index == rating.floor() && rating % 1 > 0)
                    ? Icons.star_half
                    : Icons.star_border,
                color: AppColors.orange,
                size: size,
              );
            }),
          ),
          if (showRatingNumber)
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                rating.toString(),
                style: TextStyle(
                  fontSize: size * 0.8,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
