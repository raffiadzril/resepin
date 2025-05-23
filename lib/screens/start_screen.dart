import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/providers/theme_notifier.dart';
import 'package:resepin/core/constants/sample_data.dart';
import 'package:resepin/screens/recipe/start_cooking_page.dart';
import 'package:resepin/screens/recipe/cooking_steps_page.dart';
import 'package:resepin/screens/recipe/reviews_page.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Map<String, dynamic>>> groupedFeatures = {
      'Beranda': [
        {'label': 'Home', 'route': '/home'},
        {'label': 'Cari Resep Berdasarkan Bahan', 'route': '/cari-resep-bahan'},
        {'label': 'Trending', 'route': '/trending'},
        {'label': 'Resep Baru', 'route': '/resep-baru'},
        {'label': 'Notifikasi', 'route': '/notification'},
      ],
      'Rencana Menu': [
        {'label': 'Rencana Menu', 'route': '/rencana'},
        {'label': 'Rencana Menu Setelah', 'route': '/rencana_after'},
      ],
      'Tambah Resep': [
        {'label': 'Tambah Resep', 'route': '/add'},
        {'label': 'Bookmark', 'route': '/bookmark'},
      ],
      'Profil': [
        {'label': 'Profil', 'route': '/profile'},
        {'label': 'Edit Profil', 'route': '/edit-profile'},
        {'label': 'Pengaturan', 'route': '/settings'},
        {'label': 'Ubah Kata Sandi', 'route': '/change-password'},
      ],
      'Detail Resep': [
        {'label': 'Detail Resep', 'route': '/recipe-detail'},
        {'label': 'Start Cooking', 'route': '/start-cooking'},
        {'label': 'Cooking Steps', 'route': '/cooking-steps'},
        {'label': 'Reviews', 'route': '/reviews'},
        {'label': 'Bookmark', 'route': '/bookmark'},
      ],
      'Forgot Password': [
        {'label': 'New Password Succeed', 'route': '/new-password-succeed'},
        {'label': 'Email Verification', 'route': '/email-verification'},
        {'label': 'Forgot Password', 'route': '/forgot-password'},
      ],
      'Loading Start Screen': [
        {'label': 'Loading Screen', 'route': '/loading'},
        {'label': 'Loading Screen 1', 'route': '/loading1'},
        {'label': 'Loading Screen 2', 'route': '/loading2'},
        {'label': 'Loading Screen 3', 'route': '/loading3'},
      ],
      'Register': [
        {'label': 'Register', 'route': '/register'},
      ],
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("KELOMPOK 26 - RESEPIN"),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children:
                groupedFeatures.entries.map((entry) {
                  final title = entry.key;
                  final features = entry.value;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (title.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        Center(
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                      ...features.map(
                        (feature) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              // Light Mode Button
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).cardColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                  ),
                                  onPressed: () {
                                    Provider.of<ThemeNotifier>(
                                      context,
                                      listen: false,
                                    ).toggleThemeTo(false);
                                    if (title == 'Detail Resep') {
                                      final recipe =
                                          SampleData.getRendangRecipe();
                                      switch (feature['label']) {
                                        case 'Start Cooking':
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => StartCookingPage(
                                                    recipe: recipe,
                                                  ),
                                            ),
                                          );
                                          break;
                                        case 'Cooking Steps':
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => CookingStepsPage(
                                                    recipe: recipe,
                                                  ),
                                            ),
                                          );
                                          break;
                                        case 'Reviews':
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => ReviewsPage(
                                                    recipe: recipe,
                                                  ),
                                            ),
                                          );
                                          break;
                                        case 'Bookmark':
                                          Navigator.pushNamed(
                                            context,
                                            '/bookmark',
                                          );
                                          break;
                                        default:
                                          Navigator.pushNamed(
                                            context,
                                            feature['route'],
                                          );
                                      }
                                    } else {
                                      Navigator.pushNamed(
                                        context,
                                        feature['route'],
                                      );
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      feature['label'],
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              // Dark Mode Button
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).cardColor,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                  ),
                                  onPressed: () {
                                    Provider.of<ThemeNotifier>(
                                      context,
                                      listen: false,
                                    ).toggleThemeTo(true);
                                    if (title == 'Detail Resep') {
                                      final recipe =
                                          SampleData.getRendangRecipe();
                                      switch (feature['label']) {
                                        case 'Start Cooking':
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => StartCookingPage(
                                                    recipe: recipe,
                                                  ),
                                            ),
                                          );
                                          break;
                                        case 'Cooking Steps':
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => CookingStepsPage(
                                                    recipe: recipe,
                                                  ),
                                            ),
                                          );
                                          break;
                                        case 'Reviews':
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => ReviewsPage(
                                                    recipe: recipe,
                                                  ),
                                            ),
                                          );
                                          break;
                                        case 'Bookmark':
                                          Navigator.pushNamed(
                                            context,
                                            '/bookmark',
                                          );
                                          break;
                                        default:
                                          Navigator.pushNamed(
                                            context,
                                            feature['route'],
                                          );
                                      }
                                    } else {
                                      Navigator.pushNamed(
                                        context,
                                        feature['route'],
                                      );
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      feature['label'],
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }
}