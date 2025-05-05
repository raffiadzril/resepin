import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/core/constants/app_colors.dart';
import 'package:resepin/core/constants/recipe_model.dart';
import 'package:resepin/providers/theme_notifier.dart';
import 'package:resepin/screens/recipe/recipe_detail_page.dart';
import 'package:resepin/screens/widgets/recipe_card.dart';
import 'package:resepin/screens/widgets/custom_bottom_nav.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  // Dummy categories
  final List<Map<String, String>> categories = const [
    {"name": "Favorit", "image": "images/home/rendangLebaran.png"},
    {"name": "Sarapan", "image": "images/home/nasiGorengKampung.jpg"},
    {"name": "Makan Siang", "image": "images/home/dendengBatokok.png"},
    {"name": "Cemilan", "image": "images/home/chocolateMousse.png"},
  ];

  // Dummy recipes
  final List<Map<String, dynamic>> recipes = const [
    {
      "title": "Rendang Lebaran",
      "chef": "Chef Juna",
      "time": "8 jam",
      "imagePath": "images/home/rendangLebaran.png",
      "rating": 4.9,
    },
    {
      "title": "Chinese Dimsum",
      "chef": "Chef Arnold",
      "time": "2 jam",
      "imagePath": "images/home/chineseDimsum.png",
      "rating": 4.7,
    },
    {
      "title": "Ayam Panggang",
      "chef": "Chef Juleha",
      "time": "1.5 jam",
      "imagePath": "images/home/ayamPanggang.png",
      "rating": 4.8,
    },
    {
      "title": "Dendeng Batokok",
      "chef": "Chef Renatta",
      "time": "3 jam",
      "imagePath": "images/home/dendengBatokok.png",
      "rating": 4.7,
    },
    {
      "title": "Chocolate Mousse",
      "chef": "Chef Reynald",
      "time": "1 jam",
      "imagePath": "images/home/chocolateMousse.png",
      "rating": 4.5,
    },
    {
      "title": "Nasi Goreng Kampung",
      "chef": "Chef Juleha",
      "time": "45 menit",
      "imagePath": "images/home/nasiGorengKampung.jpg",
      "rating": 4.6,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;
    final textColor =
        isDarkMode ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final greyColor = AppColors.grey;
    final padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 16);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Resep Tersimpan',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 3),
      body: SingleChildScrollView(
        child: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Horizontal category bar
              SizedBox(
                height: 90,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length + 1,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    if (index < categories.length) {
                      final cat = categories[index];
                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage(cat["image"]!),
                          ),
                          const SizedBox(height: 6),
                          SizedBox(
                            width: 60,
                            child: Text(
                              cat["name"]!,
                              style: TextStyle(fontSize: 12, color: textColor),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      );
                    } else {
                      // Add category button
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color:
                                    isDarkMode
                                        ? Colors.grey[800]
                                        : Colors.grey[200],
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.red, width: 1),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.red,
                                  size: 28,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          SizedBox(
                            width: 60,
                            child: Text(
                              "Tambah",
                              style: TextStyle(fontSize: 12, color: textColor),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 24),
              // Grid of recipes
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recipes.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8, // Adjusted to prevent overflow
                ),
                itemBuilder: (context, index) {
                  final r = recipes[index];
                  return RecipeCard(
                    title: r["title"],
                    chef: r["chef"],
                    time: r["time"],
                    imagePath: r["imagePath"],
                    rating: r["rating"],
                    textColor: textColor,
                    greyColor: greyColor,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}