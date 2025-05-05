import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Untuk mengelola state tema
import 'package:resepin/core/constants/app_colors.dart'; // Konstanta warna aplikasi
import 'package:resepin/screens/widgets/recipe_card.dart'; // Widget untuk kartu resep
import 'package:resepin/screens/widgets/search_bar.dart'; // Widget untuk bilah pencarian
import 'package:resepin/screens/widgets/filter_bottom_sheet.dart'; // Widget untuk filter bottom sheet
import '../../providers/theme_notifier.dart'; // Provider untuk tema aplikasi

class SearchResultScreen extends StatefulWidget {
  final List<String> selectedIngredients; // Daftar bahan yang dipilih

  const SearchResultScreen({super.key, required this.selectedIngredients});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  List<String> appliedFilters = []; // Filter yang diterapkan

  @override
  Widget build(BuildContext context) {
    // Mendapatkan status tema (gelap atau terang) dari provider
    final isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;
    final theme = Theme.of(context); // Mendapatkan tema saat ini
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black; // Warna teks utama
    final greyColor = theme.textTheme.bodyMedium?.color ?? Colors.grey; // Warna teks abu-abu

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor, // Warna latar belakang AppBar
        elevation: 0, // Menghilangkan bayangan AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Ikon kembali
          color: textColor, // Warna ikon sesuai tema
          onPressed: () => Navigator.of(context).pop(), // Navigasi kembali
        ),
        title: Text(
          'Hasil Pencarian', // Judul AppBar
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black, // Warna ikon sesuai tema
        ),
      ),
      body: SingleChildScrollView( // Membuat konten dapat di-scroll
        child: Padding(
          padding: const EdgeInsets.all(16), // Padding di sekitar konten
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Menyusun elemen ke kiri
            children: [
              // Bilah pencarian dan tombol filter
              Row(
                children: [
                  Expanded(
                    child: SearchBarWidget(hintText: "Cari resep berdasarkan bahan..."),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    color: AppColors.primary,
                    onPressed: () {
                      showFilterBottomSheet(
                        context,
                        ['Vegetarian', 'Cepat Saji', 'Makanan Penutup'], // Contoh filter
                        (selectedFilter) {
                          setState(() {
                            appliedFilters.add(selectedFilter); // Tambahkan filter yang dipilih
                          });
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16), // Jarak antar elemen

              const SizedBox(height: 8),

              // Menampilkan filter yang diterapkan
              if (appliedFilters.isNotEmpty)
                Text(
                  "Filter yang diterapkan: ${appliedFilters.join(', ')}",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: greyColor,
                  ),
                ),
              const SizedBox(height: 16),

              // Bagian daftar resep dalam bentuk grid
              Wrap(
                spacing: 12, // Jarak horizontal antar elemen
                runSpacing: 12, // Jarak vertikal antar elemen
                children: [
                  for (var recipe in [
                    { 
                      'title': 'Lapis Legit',
                      'chef': 'Chef Novalov',
                      'time': '2 jam',
                      'image': 'images/home/lapislegit.jpg'
                    },
                    {
                      'title': 'Nasi Goreng Tahu Wortel',
                      'chef': 'Chef Juna',
                      'time': '30 menit',
                      'image': 'images/home/nasigorengtahuwortel.jpeg'
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
                      'time': '45 menit',
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
      ),
    );
  }
}
