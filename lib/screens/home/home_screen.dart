import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/core/constants/app_colors.dart';
import 'package:resepin/screens/widgets/BackButtonFloating.dart';
import 'package:resepin/screens/widgets/recipe_card.dart';
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
          color:
              isDarkMode
                  ? Colors.white
                  : Colors.black, // Sesuaikan warna ikon dengan tema
        ),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: AppColors.primary,
            ),
            onPressed:
                () =>
                    Provider.of<ThemeNotifier>(
                      context,
                      listen: false,
                    ).toggleTheme(),
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: AppColors.primary),
            onPressed: () {
              Navigator.of(context).pushNamed('/notification');
            },
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search & Carousel
            Container(
              margin: const EdgeInsets.symmetric(vertical: 1),
              height: 147,
              child: PageView.builder(
                controller: PageController(
                  viewportFraction: 0.8,
                  initialPage: 0,
                ), // <-- Ukuran card
                padEnds: false, // <-- ini yang menghilangkan padding kiri/kanan
                itemCount: 3,
                itemBuilder: (context, index) {
                  final items = [
                    {
                      "title": "Cari Resep Berdasarkan Bahan",
                      "image": "images/home/refrigerator.png",
                      "color": AppColors.primary,
                    },
                    {
                      "title": "Trending Resep",
                      "image": "images/home/makanan.png",
                      "color": AppColors.orange,
                    },
                    {
                      "title": "Resep Teraru",
                      "image": "images/home/makanan.png",
                      "color": AppColors.primary,
                    },
                  ];
                  final item = items[index];
                  return _buildCarouselCard(
                    context,
                    item["title"] as String,
                    item["image"] as String,
                    AppColors.darkTextPrimary,
                    item["color"] as Color,
                  );
                },
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
                  RecipeCard(
                    title: "Rendang Lebaran",
                    chef: "Chef Juna",
                    time: "8 jam",
                    imagePath: "images/home/rendangLebaran.png",
                    rating: 4.9, // ✅ Tambahkan rating
                    textColor: textColor,
                    greyColor: greyColor,
                  ),
                  RecipeCard(
                    title: "Chinese Dimsum",
                    chef: "Chef Arnold",
                    time: "2 jam",
                    imagePath: "images/home/chineseDimsum.png",
                    rating: 4.7,
                    textColor: textColor,
                    greyColor: greyColor,
                  ),
                  RecipeCard(
                    title: "Ayam Panggang",
                    chef: "Chef Juleha",
                    time: "1.5 jam",
                    imagePath: "images/home/ayamPanggang.png",
                    rating: 4.8,
                    textColor: textColor,
                    greyColor: greyColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Resep Baru
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Text(
                "Lihat Selengkapnya",
                style: TextStyle(color: AppColors.primary),
              ),
              ],
            ),
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
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  RecipeCard(
                    title: "Chocolate Mousse",
                    chef: "Chef Reynald",
                    time: "1 jam",
                    imagePath: "images/home/chocolateMousse.png",
                    rating: 4.8,
                    textColor: textColor,
                    greyColor: greyColor,
                  ),
                  RecipeCard(
                    title: "Dendeng Batokok",
                    chef: "Chef Renatta",
                    time: "3 jam",
                    imagePath: "images/home/dendengBatokok.png",
                    rating: 4.7,
                    textColor: textColor,
                    greyColor: greyColor,
                  ),
                  RecipeCard(
                    title: "Nasi Goreng Kampung",
                    chef: "Chef Juleha",
                    time: "45 menit",
                    imagePath: "images/home/nasiGorengKampung.png",
                    rating: 4.6,
                    textColor: textColor,
                    greyColor: greyColor,
                  ),
                  RecipeCard(
                    title: "Spaghetti Carbonara",
                    chef: "Chef Gordon",
                    time: "1.5 jam",
                    imagePath: "images/home/spaghettiCarbonara.png",
                    rating: 4.9,
                    textColor: textColor,
                    greyColor: greyColor,
                  ),
                  RecipeCard(
                    title: "Martabak Manis",
                    chef: "Chef Rangga",
                    time: "1 jam",
                    imagePath: "images/home/martabakManis.png",
                    rating: 4.5,
                    textColor: textColor,
                    greyColor: greyColor,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Text(
                  "Lihat Selengkapnya",
                  style: TextStyle(color: AppColors.primary),
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
    return Container(
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          onError: (_, __) {},
        ),
      ),
      child: Container(
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