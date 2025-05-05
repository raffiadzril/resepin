import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/screens/home/cariResepBahan_screen.dart';
import 'package:resepin/screens/home/resepBaru_screen.dart';
import 'package:resepin/screens/login/emailVerift.dart';
import 'package:resepin/screens/login/forgotPassword.dart';
import 'package:resepin/screens/login/loadingScreen.dart';
import 'package:resepin/screens/login/loadingScreen1.dart';
import 'package:resepin/screens/login/loadingScreen2.dart';
import 'package:resepin/screens/login/loadingScreen3.dart';
import 'package:resepin/screens/login/newPassword.dart';
import 'package:resepin/screens/login/registerScreen.dart';
import 'core/constants/app_themes.dart';
import 'providers/theme_notifier.dart';
import 'screens/home/home_screen.dart';
import 'screens/start_screen.dart';
import 'screens/settings/profile_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/settings/edit_profil_screen.dart';
import 'screens/settings/ChangePasswordScreen.dart';
import 'screens/home/notifikation_screen.dart';
import 'screens/rencana/rencana_menu.dart';
import 'screens/recipe/recipe_detail_page.dart';
import 'screens/rencana/rencana_menu_after.dart';
import 'screens/add/tambah_resep.dart';
import 'screens/home/trending_screen.dart';
import 'screens/login/newPasswordSucceed.dart';
import 'screens/recipe/bookmark_page.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeNotifier>().isDarkMode;

    return MaterialApp(
      title: 'Flutter Resepin Apps',
      debugShowCheckedModeBanner: false,
      theme: isDark ? AppThemes.darkTheme : AppThemes.lightTheme,
      home: const StartScreen(),
      routes: {
        '/start': (context) => const StartScreen(),
        '/home': (context) => const HomeScreen(),
        '/cari-resep-bahan': (context) => const CariresepbahanScreen(),
        '/trending': (context) => const TrendingScreen(),
        '/resep-baru': (context) => const ResepBaruScreen(),
        '/notification': (context) => const NotificationScreen(),
        '/profile': (context) => ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/edit-profile': (context) => const EditProfileScreen(),
        '/change-password': (context) => const ChangePasswordScreen(),
        '/rencana': (context) => RencanaMenuScreen(),
        '/recipe-detail': (context) => const RecipeDetailPage(),
        '/rencana_after': (context) => RencanaMenuAfterScreen(),
        '/add': (context) => const AddResepScreen(),
        '/new-password-succeed': (context) => const NewPasswordSucceed(),
        '/new-password': (context) => const NewPassword(),
        '/email-verification': (context) => const EmailVerify(email: ''),
        '/forgot-password': (context) => const ForgotPassword(),
        '/loading': (context) => const LoadingScreen(),
        '/loading1': (context) => const LoadingScreen1(),
        '/loading2': (context) => const LoadingScreen2(),
        '/loading3': (context) => const LoadingScreen3(),
        '/register': (context) => const RegisterScreen(),
        '/bookmark': (context) => const BookmarkPage(),
      },
    );
  }
}