import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/core/constants/app_colors.dart';
import 'package:resepin/core/constants/recipe_model.dart';
import 'package:resepin/providers/theme_notifier.dart';
import 'package:resepin/screens/widgets/backButtonFloating.dart';
import 'package:resepin/screens/widgets/custom_bottom_nav.dart';
import 'package:resepin/screens/recipe/start_cooking_page.dart';

class CookingStepsPage extends StatelessWidget {
  final Recipe recipe;

  const CookingStepsPage({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;
    final theme = Theme.of(context);
    final textColor =
        isDarkMode ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final greyColor = AppColors.grey;

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: AppColors.primary),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.bookmark_border, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: const BackButtonFloating(),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Waktu Memasak',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 16),

            // Cooking Time Info
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDarkMode ? AppColors.darkBox : AppColors.lightBox2,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTimeInfo(
                    context,
                    'Persiapan',
                    '${recipe.prepTime ~/ 60} jam',
                  ),
                  _buildTimeInfo(
                    context,
                    'Memasak',
                    '${recipe.cookTime ~/ 60} jam',
                  ),
                  _buildTimeInfo(
                    context,
                    'Total Waktu',
                    '${recipe.totalTime ~/ 60} jam',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            Text(
              'Langkah-langkah',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 16),

            // Cooking Steps
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: recipe.steps.length,
              itemBuilder: (context, index) {
                final step = recipe.steps[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDarkMode ? AppColors.darkBox : AppColors.lightBox2,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grey.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${step.number}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              step.instruction,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (step.tip != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0, left: 44.0),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.orange.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColors.orange.withOpacity(0.3),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.lightbulb_outline,
                                  color: AppColors.orange,
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    step.tip!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: greyColor,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StartCookingPage(recipe: recipe),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Mulai memasak',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeInfo(BuildContext context, String label, String time) {
    final isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;
    final greyColor = AppColors.grey;
    final textColor =
        isDarkMode ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;

    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: greyColor)),
        const SizedBox(height: 4),
        Text(
          time,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
