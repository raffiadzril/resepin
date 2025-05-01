import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/core/constants/app_colors.dart';
import 'package:resepin/screens/widgets/BackButtonFloating.dart';
import '../../providers/theme_notifier.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black;
    final greyColor = theme.textTheme.bodyMedium?.color ?? Colors.grey;

    return Scaffold(
        appBar: AppBar(
        toolbarHeight: 56, // Adjust the height of the AppBar
        title: const SearchBarWidget(),
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black, // Sesuaikan warna ikon dengan tema
        ),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: AppColors.primary,
            ),
            onPressed:
                () =>
                    Provider.of<ThemeNotifier>(context, listen: false).toggleTheme(),
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNav(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search & Carousel
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              height: 160,
              child: PageView(
                children: [
                  _buildCarouselCard(
                    context,
                    "Cari Resep Berdasarkan Bahan",
                    "assets/images/cari_resep.jpg",
                    textColor,
                    AppColors.primary,
                  ),
                  _buildCarouselCard(
                    context,
                    "Trending Resep",
                    "assets/images/trending.jpg",
                    textColor,
                    AppColors.orange,
                  ),
                  _buildCarouselCard(
                    context,
                    "Resep Teraru",
                    "assets/images/resep_baru.jpg",
                    textColor,
                    AppColors.primary,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Trending Resep
            Text(
              "Trending Resep",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildRecipeCard(
                    context,
                    "Rendang Lebaran",
                    "Chef Juna",
                    "8 jam",
                    "assets/images/rendang.jpg",
                    textColor,
                    greyColor,
                  ),
                  _buildRecipeCard(
                    context,
                    "Chinese Dimsum",
                    "Chef Arnold",
                    "2 jam",
                    "assets/images/dimsum.jpg",
                    textColor,
                    greyColor,
                  ),
                  _buildRecipeCard(
                    context,
                    "Ayam Bakar",
                    "Chef Juleha",
                    "1.5 jam",
                    "assets/images/ayam.jpg",
                    textColor,
                    greyColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Resep Baru
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Resep Baru",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                Text(
                  "Lihat Selengkapnya",
                  style: TextStyle(color: AppColors.primary),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildRecipeCard(
                    context,
                    "Chocolate Mousse",
                    "Chef Reynald",
                    "1 jam",
                    "assets/images/chocolate_mousse.jpg",
                    textColor,
                    greyColor,
                  ),
                  _buildRecipeCard(
                    context,
                    "Dendeng Batokok",
                    "Chef Renatta",
                    "3 jam",
                    "assets/images/dendeng.jpg",
                    textColor,
                    greyColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: BackButtonFloating(
        onPressed: () {
          Navigator.of(context).pop(); // Kembali ke StartScreen
        },
      ),
    );
  }

  Widget _buildCarouselCard(
    BuildContext context,
    String title,
    String imagePath,
    Color textColor,
    Color gradienColor,
  ) {
    final cardWidth =
        MediaQuery.of(context).size.width *
        0.5; // Adjust width to make next card slightly more visible
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: cardWidth, // Adjust width of the container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          onError: (_, __) {}, // prevent crash on missing asset
        ),
      ),
      child: Container(
        width: cardWidth, // Adjust width of the child
        padding: const EdgeInsets.all(16),
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(33),
          gradient: LinearGradient(
            colors: [
              gradienColor.withOpacity(0.8),
              gradienColor.withOpacity(0.4),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildRecipeCard(
    BuildContext context,
    String title,
    String chef,
    String time,
    String imagePath,
    Color textColor,
    Color greyColor,
  ) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.2),
            blurRadius: 6, // Increased blur radius for a softer shadow
            offset: const Offset(
              0,
              3,
            ), // Adjusted offset to ensure shadow is not cut off
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
                  errorBuilder:
                      (context, error, stackTrace) => Container(
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
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(chef, style: TextStyle(fontSize: 12, color: greyColor)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, size: 14, color: AppColors.orange),
                    const SizedBox(width: 4),
                    Text(
                      "4.7",
                      style: TextStyle(
                        fontSize: 12,
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
                        fontSize: 12,
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
