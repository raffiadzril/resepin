import 'package:flutter/material.dart';
import 'package:resepin/core/constants/app_colors.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 40, // Reduce the height of the TextField
      child: TextField(
        decoration: InputDecoration(
          hintText: "Cari resep...",
          hintStyle: TextStyle(color: theme.textTheme.bodyMedium?.color ?? AppColors.grey),
          prefixIcon: Icon(Icons.search, color: theme.textTheme.bodyMedium?.color ?? AppColors.grey),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
          ), // Adjust vertical padding
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.grey), // Set border color
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.grey), // Set border color for enabled state
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: theme.primaryColor), // Set border color for focused state
          ),
        ),
      ),
    );
  }
}
