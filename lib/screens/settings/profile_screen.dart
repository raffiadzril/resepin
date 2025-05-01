import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/core/constants/app_colors.dart';
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
        title: Text('Profil', style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            color: textColor,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            color: textColor,
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 4),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 12),
            const Center(
              child: CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage("assets/images/profile_levi.png"),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Levi Ackerman",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: textColor,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _StatItem(label: "Resep", value: "6"),
                _StatItem(label: "Pengikut", value: "98"),
                _StatItem(label: "Mengikuti", value: "98"),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
              ),
              onPressed: () {},
              child: const Text(
                "Edit Profile",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            _buildRecipeGrid(textColor, greyColor, context),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeGrid(Color textColor, Color greyColor, BuildContext context) {
    final recipes = List.generate(6, (index) => {
      "title": "Rendang Lebaran",
      "chef": "Chef Juna",
      "time": "8 jam",
      "image": "assets/images/rendang.jpg",
    });

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recipes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 3 / 3.8,
      ),
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.grey.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  recipe["image"]!,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe["title"]!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      recipe["chef"]!,
                      style: TextStyle(fontSize: 12, color: greyColor),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 12, color: AppColors.orange),
                        const SizedBox(width: 4),
                        Text("4.7", style: TextStyle(fontSize: 12, color: greyColor)),
                        const Spacer(),
                        const Icon(Icons.access_time, size: 12, color: AppColors.grey),
                        const SizedBox(width: 4),
                        Text(recipe["time"]!, style: TextStyle(fontSize: 12, color: greyColor)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;
    return Column(
      children: [
        Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor)),
        const SizedBox(height: 2),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
