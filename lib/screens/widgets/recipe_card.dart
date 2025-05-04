import 'package:flutter/material.dart';
import 'package:resepin/core/constants/app_colors.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String chef;
  final String time;
  final String imagePath;
  final double rating; // ✅ Tambahkan rating
  final Color textColor;
  final Color greyColor;

  const RecipeCard({
    super.key,
    required this.title,
    required this.chef,
    required this.time,
    required this.imagePath,
    required this.rating, // ✅ Tambahkan rating ke konstruktor
    required this.textColor,
    required this.greyColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              margin: const EdgeInsets.only(top: 8, right: 8, left: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imagePath,
                  height: 90,
                  width: 140,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 90,
                    width: 140,
                    color: Colors.grey,
                    child: const Center(
                      child: Icon(Icons.image_not_supported),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(chef, style: TextStyle(fontSize: 9, color: greyColor)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, size: 8, color: AppColors.orange),
                    const SizedBox(width: 4),
                    Text(
                      rating.toStringAsFixed(1), // ✅ Gunakan rating dinamis
                      style: TextStyle(
                        fontSize: 8,
                        color: AppColors.lightTextSecondary,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.access_time,
                      size: 14,
                      color: AppColors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 8,
                        color: AppColors.lightTextSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
