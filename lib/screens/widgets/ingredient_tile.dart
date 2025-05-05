import 'package:flutter/material.dart';
import 'package:resepin/models/ingredient.dart';
import 'package:resepin/core/constants/app_colors.dart';



class IngredientTile extends StatelessWidget {
  final Ingredient ingredient;
  final VoidCallback onTap;

  const IngredientTile({required this.ingredient, required this.onTap, super.key});


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black;
    return ListTile(
      leading: Image.asset(ingredient.imagePath, width: 40),
      title: Text(
        ingredient.name,
        style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: Checkbox(
        value: ingredient.isSelected,
        onChanged: (_) => onTap(),
        activeColor: AppColors.primary,
        checkColor: Colors.white, // Replace with your desired checkmark color
      ),
      onTap: onTap,
    );
  }
}
