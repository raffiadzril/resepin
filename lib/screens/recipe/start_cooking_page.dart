import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/core/constants/app_colors.dart';
import 'package:resepin/core/constants/recipe_model.dart';
import 'package:resepin/providers/theme_notifier.dart';
import 'package:resepin/screens/widgets/backButtonFloating.dart';

class StartCookingPage extends StatefulWidget {
  final Recipe recipe;
  const StartCookingPage({
    super.key,
    required this.recipe,
  });

  @override
  State<StartCookingPage> createState() => _StartCookingPageState();
}

class _StartCookingPageState extends State<StartCookingPage> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;
    final theme = Theme.of(context);
    final textColor =
        isDarkMode ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final greyColor = AppColors.grey;

    final step = widget.recipe.steps[currentStep];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.recipe.title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
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
      body: Column(
        children: [
          // Progress Indicator
          LinearProgressIndicator(
            value: (currentStep + 1) / widget.recipe.steps.length,
            backgroundColor: Colors.grey[800],
            color: AppColors.primary,
            minHeight: 6,
          ),

          // Step Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          'Langkah ${step.number} dari ${widget.recipe.steps.length}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'Waktu: ${widget.recipe.totalTime ~/ 60} jam',
                        style: TextStyle(fontSize: 14, color: greyColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color:
                          isDarkMode ? AppColors.darkBox : AppColors.lightBox2,
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
                        Text(
                          step.instruction,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: textColor,
                          ),
                        ),
                        if (step.tip != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
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
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // Show ingredients in a bottom sheet
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: theme.scaffoldBackgroundColor,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        builder:
                            (context) => DraggableScrollableSheet(
                              initialChildSize: 0.6,
                              minChildSize: 0.3,
                              maxChildSize: 0.9,
                              expand: false,
                              builder: (context, scrollController) {
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Container(
                                          width: 40,
                                          height: 4,
                                          margin: const EdgeInsets.only(
                                            bottom: 16,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[600],
                                            borderRadius: BorderRadius.circular(
                                              2,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Bahan-bahan',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: textColor,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Untuk ${widget.recipe.servings} porsi',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: greyColor,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Expanded(
                                        child: ListView.builder(
                                          controller: scrollController,
                                          itemCount:
                                              widget.recipe.ingredients.length,
                                          itemBuilder: (context, index) {
                                            final ingredient =
                                                widget
                                                    .recipe
                                                    .ingredients[index];
                                            return Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    vertical: 12,
                                                  ),
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                    color: AppColors.grey
                                                        .withOpacity(0.2),
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    ingredient.name,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: textColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${ingredient.quantity} ${ingredient.unit}',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: textColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: textColor,
                      elevation: 0,
                      side: BorderSide(color: AppColors.primary),
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: const Text('Lihat Bahan'),
                  ),
                ],
              ),
            ),
          ),

          // Navigation Buttons
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Row(
              children: [
                if (currentStep > 0)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          currentStep--;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: textColor,
                        elevation: 0,
                        side: BorderSide(color: AppColors.primary),
                      ),
                      child: const Text('Sebelumnya'),
                    ),
                  ),
                if (currentStep > 0) const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (currentStep < widget.recipe.steps.length - 1) {
                        setState(() {
                          currentStep++;
                        });
                      } else {
                        // Last step, show completion dialog
                        showDialog(
                          context: context,
                          builder:
                              (context) => AlertDialog(
                                title: const Text('Selamat!'),
                                content: const Text(
                                  'Anda telah menyelesaikan resep ini.',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Kembali ke Resep'),
                                  ),
                                ],
                              ),
                        );
                      }
                    },
                    child: Text(
                      currentStep < widget.recipe.steps.length - 1
                          ? 'Selanjutnya'
                          : 'Selesai',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
