import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/core/constants/app_colors.dart';
import 'package:resepin/screens/widgets/recipe_card.dart';
import '../../providers/theme_notifier.dart';
import '../widgets/custom_bottom_nav.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black;
    final greyColor = theme.textTheme.bodyMedium?.color ?? Colors.grey;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: textColor,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Profil',
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            color: textColor,
            onPressed: () {

            },
          ),
            IconButton(
            icon: const Icon(Icons.settings),
            color: textColor,
            onPressed: () {
              Navigator.of(context).pushNamed('/settings');
            },
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 4),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("images/profile/salt-bae.webp"),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Chef Salt Bae",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          _StatItem(label: "Resep", value: "6"),
                          _StatItem(label: "Pengikut", value: "98"),
                          _StatItem(label: "Mengikuti", value: "98"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 10,
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Edit Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Garis pemisah
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 4,
              color:
                  isDarkMode
                      ? Colors.white.withOpacity(0.2)
                      : Colors.black.withOpacity(0.1),
              width: double.infinity,
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RecipeCard(
                  title: "Rendang Lebaran",
                  chef: "Chef Salt Bae",
                  time: "8 jam",
                  imagePath: "images/home/rendangLebaran.png",
                  rating: 4.9, // ✅ Tambahkan rating
                  textColor: textColor,
                  greyColor: greyColor,
                ),
                RecipeCard(
                  title: "Chinese Dimsum",
                  chef: "Chef Salt Bae",
                  time: "2 jam",
                  imagePath: "images/home/chineseDimsum.png",
                  rating: 4.7,
                  textColor: textColor,
                  greyColor: greyColor,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RecipeCard(
                  title: "Ayam Panggang",
                  chef: "Chef Salt Bae",
                  time: "1.5 jam",
                  imagePath: "images/home/ayamPanggang.png",
                  rating: 4.8,
                  textColor: textColor,
                  greyColor: greyColor,
                ),
                RecipeCard(
                  title: "Chocolate Mousse",
                  chef: "Chef Salt Bae",
                  time: "1 jam",
                  imagePath: "images/home/chocolateMousse.png",
                  rating: 4.8,
                  textColor: textColor,
                  greyColor: greyColor,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RecipeCard(
                  title: "Dendeng Batokok",
                  chef: "Chef Salt Bae",
                  time: "3 jam",
                  imagePath: "images/home/dendengBatokok.png",
                  rating: 4.8,
                  textColor: textColor,
                  greyColor: greyColor,
                ),
                RecipeCard(
                  title: "Nasi Goreng Kampung",
                  chef: "Chef Salt Bae",
                  time: "45 menit",
                  imagePath: "images/home/nasiGorengKampung.png",
                  rating: 4.6,
                  textColor: textColor,
                  greyColor: greyColor,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RecipeCard(
                  title: "Spaghetti Carbonara",
                  chef: "Chef Salt Bae",
                  time: "1.5 jam",
                  imagePath: "images/home/spaghettiCarbonara.png",
                  rating: 4.9,
                  textColor: textColor,
                  greyColor: greyColor,
                ),
                RecipeCard(
                  title: "Martabak Manis",
                  chef: "Chef Salt Bae",
                  time: "1 jam",
                  imagePath: "images/home/martabakManis.png",
                  rating: 4.5,
                  textColor: textColor,
                  greyColor: greyColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final textColor =
        Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: textColor,
          ),
        ),
        const SizedBox(height: 2),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
