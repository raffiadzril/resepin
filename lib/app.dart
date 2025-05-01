import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/constants/app_themes.dart';
import 'providers/theme_notifier.dart';
import 'screens/home/home_screen.dart';
import 'screens/start_screen.dart'; // <-- tambahkan ini
import 'screens/settings/profile_screen.dart'; // <-- tambahkan ini
import 'screens/settings/settings_screen.dart'; // <-- tambahkan ini
import 'screens/home/notifikation_screen.dart'; // <-- tambahkan ini
import 'screens/recipe/recipe_detail_page.dart'; // <-- tambahkan ini

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeNotifier>().isDarkMode;

    return MaterialApp(
      title: 'Flutter Clean App',
      debugShowCheckedModeBanner: false,
      theme: isDark ? AppThemes.darkTheme : AppThemes.lightTheme,
      home: const StartScreen(), // <--- ganti ke StartScreen
      routes: {
        '/start': (context) => const StartScreen(),
        '/home': (context) => const HomeScreen(),
        '/notification': (context) => const NotificationScreen(),
        '/profile': (context) => ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/recipe-detail':
            (context) => const RecipeDetailPage(), // Tambahkan ini
      },
    );
  }
}
