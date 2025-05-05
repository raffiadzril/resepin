import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Untuk mengelola state tema
import 'package:resepin/core/constants/app_colors.dart';
import 'package:resepin/providers/theme_notifier.dart'; // Konstanta warna aplikasi

class IngredientPopup extends StatelessWidget {
  final List<String> ingredients; // Daftar bahan yang akan ditampilkan

  const IngredientPopup({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan status tema (gelap atau terang) dari provider
    final isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;
    final theme = Theme.of(context); // Mendapatkan tema saat ini
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black; // Warna teks utama

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Sudut melengkung
      ),
      backgroundColor: theme.scaffoldBackgroundColor, // Warna latar belakang sesuai tema
      child: Container(
        padding: const EdgeInsets.all(16), // Padding di dalam popup
        height: MediaQuery.of(context).size.height * 0.6, // Tinggi popup 60% dari layar
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Menyusun elemen ke kiri
          children: [
            // Judul popup
            Text(
              'Daftar Bahan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 16), // Jarak antar elemen

            // Daftar bahan
            Expanded(
              child: ListView.builder(
                itemCount: ingredients.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0), // Padding antar item
                    child: Text(
                      ingredients[index],
                      style: TextStyle(
                        fontSize: 14,
                        color: textColor,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Tombol tutup
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary, // Warna tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Sudut melengkung tombol
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(), // Menutup popup
                child: const Text(
                  'Tutup',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}