import 'package:flutter/material.dart';
import 'package:resepin/core/constants/app_colors.dart';
import 'package:resepin/data/ingridient.dart';
import 'package:resepin/models/ingredient.dart';
import 'ingredient_tile.dart';

class IngredientList extends StatefulWidget {
  const IngredientList({super.key});

  @override
  State<IngredientList> createState() => _IngredientListState();
}

class _IngredientListState extends State<IngredientList> {
  List<Ingredient> ingredients = allIngredients;
  String selectedLetter = '';
  final ScrollController _scrollController = ScrollController();

  void toggleIngredient(Ingredient ingredient) {
    setState(() {
      ingredient.isSelected = !ingredient.isSelected;
    });
  }

  void goToLetter(String letter) {
    setState(() {
      selectedLetter = letter;
    });

    // Find the index of the first ingredient that starts with the selected letter
    final index = ingredients.indexWhere(
      (ingredient) =>
          ingredient.name.toLowerCase().startsWith(letter.toLowerCase()),
    );

    // Scroll to the found index if it exists
    if (index != -1) {
      _scrollController.animateTo(
        index *
            80.0, // Assuming each item has a height of 80. Adjust as needed.
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                // Ingredient list
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: ingredients.length,
                    itemBuilder: (context, index) {
                      final ingredient = ingredients[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        child: Card(
                          elevation: 4,
                          color: theme.cardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: IngredientTile(
                            ingredient: ingredient,
                            onTap: () => toggleIngredient(ingredient),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Letter index (A-Z)
                Container(
                  width: 28,
                  padding: const EdgeInsets.only(right: 6.0, top: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(26, (index) {
                      final letter = String.fromCharCode(65 + index);
                      return GestureDetector(
                        onTap: () => goToLetter(letter),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Container(
                            width: 24,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color:
                                  selectedLetter == letter
                                      ? AppColors.primary
                                      : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              letter,
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color:
                                    selectedLetter == letter
                                        ? Colors.white
                                        : AppColors.darkTextSecondary,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),

          // Selected ingredients text
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${ingredients.where((i) => i.isSelected).length} bahan terpilih: ${ingredients.where((i) => i.isSelected).map((i) => i.name).join(', ')}",
              style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
            ),
          ),

          // Search button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/cari-resep',
                  arguments: ingredients.where((i) => i.isSelected).toList(),
                );
              },
              icon: const Icon(Icons.search),
              label: const Text("Cari Resep"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.darkTextPrimary,
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
