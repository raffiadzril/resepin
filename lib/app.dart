import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/core/constants/recipe_model.dart';
import 'package:resepin/screens/recipe/cooking_steps_page.dart';
import 'package:resepin/screens/rencana/add_resep_anda.dart';
import 'core/constants/app_themes.dart';
import 'providers/theme_notifier.dart';
import 'screens/home/home_screen.dart';
import 'screens/start_screen.dart';
import 'screens/settings/profile_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/home/notifikation_screen.dart';
import 'screens/rencana/rencana_menu.dart';
import 'screens/recipe/recipe_detail_page.dart';
import 'screens/rencana/rencana_menu_after.dart';
import 'screens/add/tambah_resep.dart';
import 'screens/home/trending_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeNotifier>().isDarkMode;

    return MaterialApp(
      title: 'Flutter Clean App',
      debugShowCheckedModeBanner: false,
      theme: isDark ? AppThemes.darkTheme : AppThemes.lightTheme,
      home: const StartScreen(),
      routes: {
        '/start': (context) => const StartScreen(),
        '/home': (context) => const HomeScreen(),
        '/trending': (context) => const TrendingScreen(),
        '/notification': (context) => const NotificationScreen(),
        '/profile': (context) => ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/rencana': (context) => RencanaMenuScreen(),
        '/recipe-detail': (context) => const RecipeDetailPage(),
        '/rencana_after': (context) => RencanaMenuAfterScreen(),
        '/add': (context) => const AddResepScreen(),
      },
    );
  }
}