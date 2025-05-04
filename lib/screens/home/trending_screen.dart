import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Untuk mengelola state tema
import 'package:resepin/core/constants/app_colors.dart'; // Konstanta warna aplikasi
import 'package:resepin/screens/widgets/recipe_card.dart'; // Widget untuk kartu resep
import 'package:resepin/screens/widgets/custom_bottom_nav.dart'; // Navigasi bawah kustom
import 'package:resepin/screens/widgets/banner_title.dart'; // Widget untuk judul dengan banner
import '../../providers/theme_notifier.dart'; // Provider untuk tema aplikasi

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan status tema (gelap atau terang) dari provider
    final isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;
    final theme = Theme.of(context); // Mendapatkan tema saat ini
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black; // Warna teks utama
    final greyColor = theme.textTheme.bodyMedium?.color ?? Colors.grey; // Warna teks abu-abu

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(), // Tombol kembali
        backgroundColor: theme.scaffoldBackgroundColor, // Warna latar belakang AppBar
        elevation: 0, // Menghilangkan bayangan AppBar
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black, // Warna ikon sesuai tema
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 0), // Navigasi bawah
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16), // Padding di sekitar konten
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Menyusun elemen ke kiri
          children: [
            const BannerTittle(
              text: 'Trending Recipes', // Judul banner
              imageAsset: 'images/home/makanan.png', // Gambar banner
              gradientColor1: AppColors.orange, // Warna gradien
            ),
            const SizedBox(height: 16), // Jarak antar elemen

            // Bagian daftar resep dalam bentuk grid
            Wrap(
              spacing: 12, // Jarak horizontal antar elemen
              runSpacing: 12, // Jarak vertikal antar elemen
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
                    width: (MediaQuery.of(context).size.width - 20 * 2 - 12) / 2, // Lebar elemen
                    height: 180, // Tinggi elemen
                    child: RecipeCard(
                      title: recipe['title']!, // Judul resep
                      chef: recipe['chef']!, // Nama chef
                      time: recipe['time']!, // Waktu memasak
                      rating: 4.7, // Rating resep
                      imagePath: recipe['image']!, // Gambar resep
                      textColor: textColor, // Warna teks
                      greyColor: greyColor, // Warna teks abu-abu
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
