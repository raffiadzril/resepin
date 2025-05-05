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
    // Mendapatkan status tema (gelap atau terang) dari provider
    final isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;
    final theme = Theme.of(context); // Mendapatkan tema saat ini
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black; // Warna teks utama
    final greyColor = theme.textTheme.bodyMedium?.color ?? Colors.grey; // Warna teks abu-abu

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56, // Menentukan tinggi AppBar
        title: const SearchBarWidget(hintText: "cari resep..."), // Widget pencarian
        backgroundColor: theme.scaffoldBackgroundColor, // Warna latar belakang AppBar
        elevation: 0, // Menghilangkan bayangan AppBar
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black, // Warna ikon sesuai tema
        ),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode, // Ikon tema
              color: AppColors.primary,
            ),
            onPressed: () =>
                Provider.of<ThemeNotifier>(context, listen: false).toggleTheme(), // Mengubah tema
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: AppColors.primary), // Ikon notifikasi
            onPressed: () {
              Navigator.of(context).pushNamed('/notification'); // Navigasi ke halaman notifikasi
            },
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 0), // Navigasi bawah
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16), // Padding horizontal
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Menyusun elemen ke kiri
          children: [
            // Bagian carousel
            Container(
              margin: const EdgeInsets.symmetric(vertical: 1),
              height: 147, // Tinggi carousel
              child: PageView.builder(
                controller: PageController(
                  viewportFraction: 0.8, // Ukuran card dalam viewport
                  initialPage: 0, // Halaman awal
                ),
                padEnds: false, // Menghilangkan padding di ujung
                itemCount: 3, // Jumlah item dalam carousel
                itemBuilder: (context, index) {
                  final items = [
                    {
                      "title": "Cari Resep Berdasarkan Bahan",
                      "image": "images/home/refrigerator.png",
                      "color": AppColors.primary,
                      "route": "/cari-resep-bahan",
                    },
                    {
                      "title": "Trending Resep",
                      "image": "images/home/makanan.png",
                      "color": AppColors.orange,
                      "route": "/trending",
                    },
                    {
                      "title": "Resep Terbaru",
                      "image": "images/home/makanan.png",
                      "color": AppColors.primary,
                      "route": "/resep-baru",
                    },
                  ];
                  final item = items[index]; // Mendapatkan item berdasarkan indeks
                  return _buildCarouselCard(
                    context,
                    item["title"] as String, // Judul item
                    item["image"] as String, // Gambar item
                    AppColors.darkTextPrimary, // Warna teks
                    item["color"] as Color, // Warna gradien
                    item["route"] as String, // Rute navigasi
                  );
                },
              ),
            ),

            const SizedBox(height: 16), // Jarak antar elemen

            // Bagian Trending Resep
            Text(
              "Trending Resep",
              style: TextStyle(
                fontSize: 18, // Ukuran font
                fontWeight: FontWeight.bold, // Teks tebal
                color: textColor, // Warna teks
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 180, // Tinggi list horizontal
              child: ListView(
                scrollDirection: Axis.horizontal, // Arah scroll horizontal
                children: [
                  RecipeCard(
                    title: "Rendang Lebaran",
                    chef: "Chef Juna",
                    time: "8 jam",
                    imagePath: "images/home/rendangLebaran.png",
                    rating: 4.9,
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

            // Bagian Resep Baru
            Row(
              mainAxisAlignment: MainAxisAlignment.end, // Elemen di kanan
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/trending'); // Navigasi ke trending
                  },
                  child: Text(
                    "Lihat Selengkapnya",
                    style: TextStyle(color: AppColors.primary), // Warna teks
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Elemen tersebar
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
<<<<<<< HEAD
                    imagePath: "images/home/nasigorengkampung.jpg",
=======
                    imagePath: "images/home/nasiGorengKampung.jpg",
>>>>>>> d6e9190cdad21764286c96ccc1d9996c15807016
                    rating: 4.6,
                    textColor: textColor,
                    greyColor: greyColor,
                  ),
                  RecipeCard(
                    title: "Spaghetti Carbonara",
                    chef: "Chef Gordon",
                    time: "1.5 jam",
<<<<<<< HEAD
                    imagePath: "images/home/spaghetticarbonara.jpg",
=======
                    imagePath: "images/home/spaghettiCarbonara.jpg",
>>>>>>> d6e9190cdad21764286c96ccc1d9996c15807016
                    rating: 4.9,
                    textColor: textColor,
                    greyColor: greyColor,
                  ),
                  RecipeCard(
                    title: "Martabak Manis",
                    chef: "Chef Rangga",
                    time: "1 jam",
<<<<<<< HEAD
                    imagePath: "images/home/martabakmanis.jpeg",
=======
                    imagePath: "images/home/martabakManis.jpeg",
>>>>>>> d6e9190cdad21764286c96ccc1d9996c15807016
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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/resep-baru');
                    },
                    child: Text(
                      "Lihat Selengkapnya",
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: BackButtonFloating(), // Tombol kembali
    );
  }

  // Fungsi untuk membuat kartu carousel
  Widget _buildCarouselCard(
    BuildContext context,
    String title,
    String imagePath,
    Color textColor,
    Color gradienColor,
    String route, // Rute navigasi
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(route); // Navigasi ke rute
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(33), // Sudut melengkung
          image: DecorationImage(
            image: AssetImage(imagePath), // Gambar latar belakang
            fit: BoxFit.cover, // Menyesuaikan gambar
            onError: (_, __) {},
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.bottomLeft, // Teks di kiri bawah
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
      ),
    );
  }

  // Fungsi untuk membuat kartu resep
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
            blurRadius: 6, // Radius bayangan
            offset: const Offset(0, 3), // Offset bayangan
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
                  errorBuilder: (context, error, stackTrace) => Container(
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