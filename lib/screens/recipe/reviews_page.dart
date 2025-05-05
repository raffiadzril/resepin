import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/core/constants/app_colors.dart';
import 'package:resepin/core/constants/recipe_model.dart';
import 'package:resepin/providers/theme_notifier.dart';
import 'package:resepin/screens/widgets/backButtonFloating.dart';
import 'package:resepin/screens/widgets/star_rating.dart';
import 'package:resepin/screens/widgets/custom_bottom_nav.dart';

class ReviewsPage extends StatefulWidget {
  final Recipe recipe;
  const ReviewsPage({
    super.key,
    required this.recipe,
  });

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  double userRating = 0;
  bool _showAllComments = false; // State untuk mengontrol jumlah komentar

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
          widget.recipe.title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color:
                isDarkMode
                    ? Colors.white
                    : Colors.black, // Warna berdasarkan tema
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
      floatingActionButton: const BackButtonFloating(),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Komentar & Rating',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 16),

            // Reviews List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  _showAllComments
                      ? widget
                          .recipe
                          .reviews
                          .length // Tampilkan semua komentar jika diperluas
                      : 2, // Tampilkan hanya 2 komentar secara default
              itemBuilder: (context, index) {
                final review = widget.recipe.reviews[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  padding: const EdgeInsets.all(16.0),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundImage: AssetImage(review.userImage),
                                onBackgroundImageError: (
                                  exception,
                                  stackTrace,
                                ) {
                                  // Handle error
                                },
                                child:
                                    review.userImage.isEmpty
                                        ? const Icon(Icons.person)
                                        : null,
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    review.userName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: textColor,
                                    ),
                                  ),
                                  Text(
                                    review.date,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: greyColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          StarRating(rating: review.rating, size: 14),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        review.comment,
                        style: TextStyle(fontSize: 14, color: textColor),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            // Show More or Less Button
            Center(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _showAllComments = !_showAllComments; // Toggle state
                  });
                },
                child: Text(
                  _showAllComments
                      ? 'Sembunyikan Komentar'
                      : 'Lihat Semua Komentar',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Rating Section
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Beri Rating',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      Row(
                        children: List.generate(5, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                userRating = index + 1.0;
                              });
                            },
                            child: Icon(
                              index < userRating
                                  ? Icons.star
                                  : Icons.star_border,
                              color: AppColors.orange,
                              size: 24,
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Comment Input
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isDarkMode ? AppColors.darkBox : AppColors.lightBox,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Beri Komentar...',
                          style: TextStyle(color: greyColor),
                        ),
                        Icon(Icons.chevron_right, color: greyColor),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
