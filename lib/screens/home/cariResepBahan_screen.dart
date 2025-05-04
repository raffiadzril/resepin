import 'package:flutter/material.dart';
import '../widgets/ingredient_list.dart'; // Widget untuk daftar bahan
import 'package:provider/provider.dart'; // Untuk mengelola state tema
import 'package:resepin/core/constants/app_colors.dart'; // Konstanta warna aplikasi
import '../../providers/theme_notifier.dart'; // Provider untuk tema aplikasi
import '../widgets/search_bar.dart'; // Widget untuk bilah pencarian

class CariresepbahanScreen extends StatelessWidget {
  const CariresepbahanScreen({super.key});

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
        backgroundColor: theme.scaffoldBackgroundColor, // Warna latar belakang AppBar
        elevation: 0, // Menghilangkan bayangan AppBar
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black, // Warna ikon sesuai tema
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding di sekitar konten
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Menyusun elemen ke kiri
          children: [
            Text(
              'Resep Berdasarkan Bahan', // Judul halaman
              style: TextStyle(
                fontSize: 20, // Ukuran font
                fontWeight: FontWeight.bold, // Teks tebal
                color: textColor, // Warna teks
              ),
            ),
            Text(
              'Pilih bahan yang anda miliki', // Subjudul halaman
              style: TextStyle(
                fontSize: 12, // Ukuran font
                fontWeight: FontWeight.normal, // Teks normal
                color: AppColors.grey, // Warna teks abu-abu
              ),
            ),
            const SizedBox(height: 16), // Jarak antar elemen
            const SearchBarWidget(hintText: "Cari bahan..."), // Bilah pencarian
            const SizedBox(height: 16),
            const Expanded(
              child: IngredientList(), // Daftar bahan
            ),
          ],
        ),
      ),
    );
  }
}
