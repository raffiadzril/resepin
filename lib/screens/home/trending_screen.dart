import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/core/constants/app_colors.dart';
import 'package:resepin/screens/widgets/recipe_card.dart';
import 'package:resepin/screens/widgets/custom_bottom_nav.dart';
import 'package:resepin/screens/widgets/banner_title.dart';
import '../../providers/theme_notifier.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black;
    final greyColor = theme.textTheme.bodyMedium?.color ?? Colors.grey;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BannerTittle(
              text: 'Trending Recipes',
              imageAsset: 'images/home/makanan.png',
              gradientColor1: AppColors.orange,
            ),
            const SizedBox(height: 16),
Wrap(
  spacing: 12,
  runSpacing: 12,
  children: [
    for (var recipe in [
      {
        'title': 'Lapis Legit',
        'chef': 'Chef Novalov',
        'time': '8 jam',
        'image': 'images/home/lapis_legit.jpg'
      },
      {
        'title': 'Nasi Goreng Tahu Wortel',
        'chef': 'Chef Juna',
        'time': '8 jam',
        'image': 'images/home/nasi_goreng.jpg'
      },
      {
        'title': 'Chocolate Mousse',
        'chef': 'Chef Reynold',
        'time': '1 jam',
        'image': 'images/home/chocolateMousse.png'
      },
      {
        'title': 'Ayam Panggang',
        'chef': 'Chef Juna',
        'time': '8 jam',
        'image': 'images/home/ayamPanggang.png'
      },
      {
        'title': 'Chinese Dimsum',
        'chef': 'Chef Arnold',
        'time': '1 jam',
        'image': 'images/home/chineseDimsum.png'
      },
      {
        'title': 'Rendang Lebaran',
        'chef': 'Chef',
        'time': '8 jam',
        'image': 'images/home/rendangLebaran.png'
      },
    ])
      SizedBox(
        width: (MediaQuery.of(context).size.width - 20 * 2 - 12) / 2,
        height: 180,
        child: RecipeCard(
          title: recipe['title']!,
          chef: recipe['chef']!,
          time: recipe['time']!,
          rating: 4.7,
          imagePath: recipe['image']!,
          textColor: textColor,
          greyColor: greyColor,
        ),
      ),
  ],
),

          ],
        ),
      ),
    );
  }
}
