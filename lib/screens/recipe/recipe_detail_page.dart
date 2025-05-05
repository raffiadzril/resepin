import 'dart:async'; // Tambahkan untuk Timer
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/core/constants/app_colors.dart';
import 'package:resepin/core/constants/recipe_model.dart';
import 'package:resepin/core/constants/sample_data.dart';
import 'package:resepin/providers/theme_notifier.dart';
import 'package:resepin/screens/recipe/cooking_steps_page.dart';
import 'package:resepin/screens/recipe/reviews_page.dart';
import 'package:resepin/screens/recipe/start_cooking_page.dart';
import 'package:resepin/screens/widgets/star_rating.dart';

class RecipeDetailPage extends StatefulWidget {
  const RecipeDetailPage({super.key});

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  final Recipe recipe = SampleData.getRendangRecipe();
  int servings = 1;
  bool _isExpanded = false;

  final ScrollController _scrollController =
      ScrollController(); // ScrollController
  bool _isBackButtonVisible = true; // State untuk visibilitas tombol
  Timer? _visibilityTimer; // Timer untuk menunda kemunculan tombol

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll); // Tambahkan listener scroll
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _visibilityTimer?.cancel(); // Bersihkan timer saat dispose
    super.dispose();
  }

  void _onScroll() {
    // Sembunyikan tombol saat scroll
    if (_isBackButtonVisible) {
      setState(() {
        _isBackButtonVisible = false;
      });
    }

    // Reset timer untuk menampilkan tombol setelah 2 detik
    _visibilityTimer?.cancel();
    _visibilityTimer = Timer(const Duration(seconds: 1), () {
      setState(() {
        _isBackButtonVisible = true;
      });
    });
  }

  List<Map<String, dynamic>> getUpdatedIngredients() {
    return recipe.ingredients.map((ingredient) {
      return {
        'name': ingredient.name,
        'quantity': ingredient.quantity * servings,
        'unit': ingredient.unit,
      };
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;
    final theme = Theme.of(context);
    final textColor =
        isDarkMode ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final greyColor = AppColors.grey;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          recipe.title,
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
      floatingActionButton: AnimatedOpacity(
        opacity:
            _isBackButtonVisible ? 1.0 : 0.0, // Fade in/out berdasarkan state
        duration: const Duration(milliseconds: 500), // Durasi animasi
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context); // Navigasi kembali
          },
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController, // Tambahkan controller ke scroll
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recipe Image
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      recipe.imageUrl,
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.9,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 180,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.image_not_supported,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.play_arrow, color: Colors.white),
                      onPressed: () {
                        // Play video
                      },
                    ),
                  ),
                ),
              ],
            ),

            // Recipe Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      recipe.title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    recipe.description,
                    maxLines: _isExpanded ? null : 3,
                    overflow:
                        _isExpanded
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, color: greyColor),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: IconButton(
                      icon: Icon(
                        _isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                      ),
                      onPressed: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Rating Section
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReviewsPage(recipe: recipe),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Text(
                              'Lihat Rating',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ), // Jarak antara teks dan bintang
                            StarRating(
                              rating: recipe.rating,
                              showRatingNumber: true,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 16, color: greyColor),
                          const SizedBox(width: 4),
                          Text(
                            'Siap dalam ${recipe.totalTime ~/ 60} jam',
                            style: TextStyle(fontSize: 14, color: greyColor),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Cooking Steps Section
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => CookingStepsPage(recipe: recipe),
                          ),
                        );
                      },
                      child: Text(
                        'Lihat langkah memasak',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary, // Warna teks sesuai tema
                        ),
                      ),
                    ),
                  ),

                  // Ingredients Section Header
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bahan untuk',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: textColor,
                              ),
                            ),
                            Text(
                              '$servings porsi',
                              style: TextStyle(fontSize: 14, color: greyColor),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                if (servings > 1) {
                                  setState(() {
                                    servings--;
                                  });
                                }
                              },
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Text(
                                '$servings',
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  servings++;
                                });
                              },
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Full Ingredients List
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: recipe.ingredients.length,
                    itemBuilder: (context, index) {
                      final updatedIngredients = getUpdatedIngredients();
                      final ingredient = updatedIngredients[index];
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.grey.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ingredient['name'],
                              style: TextStyle(color: textColor, fontSize: 16),
                            ),
                            Text(
                              '${ingredient['quantity']} ${ingredient['unit']}',
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 24),

                  // Start Cooking Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => StartCookingPage(recipe: recipe),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          AppColors.primary, // Warna background tetap
                      foregroundColor:
                          Colors.white, // Warna teks diubah menjadi putih
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Mulai memasak',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Navigation Arrow
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
