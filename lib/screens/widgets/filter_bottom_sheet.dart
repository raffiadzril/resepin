import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Untuk mengelola state tema
import 'package:resepin/core/constants/app_colors.dart'; // Konstanta warna aplikasi
import '../../providers/theme_notifier.dart'; // Provider untuk tema aplikasi

class FilterBottomSheet extends StatelessWidget {
  final List<String> filters; // Daftar filter yang tersedia
  final Function(String) onFilterSelected; // Callback saat filter dipilih

  const FilterBottomSheet({
    super.key,
    required this.filters,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Mendapatkan status tema (gelap atau terang) dari provider
    final isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;
    final theme = Theme.of(context); // Mendapatkan tema saat ini
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black; // Warna teks utama

    return Container(
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor, // Warna latar belakang sesuai tema
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), // Sudut melengkung di kiri atas
          topRight: Radius.circular(20), // Sudut melengkung di kanan atas
        ),
      ),
      padding: const EdgeInsets.all(16), // Padding di dalam bottom sheet
      child: Column(
        mainAxisSize: MainAxisSize.min, // Ukuran minimum sesuai konten
        crossAxisAlignment: CrossAxisAlignment.start, // Menyusun elemen ke kiri
        children: [
          // Judul bottom sheet
          Text(
            'Pilih Filter',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 16), // Jarak antar elemen

          // Konten filter tambahan
          Text(
            'Durasi',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          Row(
            children: [
              FilterChip(
                label: Text('<= 30 menit', style: TextStyle(color: textColor)),
                onSelected: (selected) => onFilterSelected('<= 30 menit'),
                backgroundColor: theme.cardColor,
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: Text('> 30 menit dan < 1 jam', style: TextStyle(color: textColor)),
                onSelected: (selected) => onFilterSelected('> 30 menit dan < 1 jam'),
                backgroundColor: theme.cardColor,
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: Text('> 60 menit', style: TextStyle(color: textColor)),
                onSelected: (selected) => onFilterSelected('> 60 menit'),
                backgroundColor: theme.cardColor,
              ),
            ],
          ),
          const SizedBox(height: 16),

          Text(
            'Tipe Resep',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          Row(
            children: [
              FilterChip(
                label: Text('Desert', style: TextStyle(color: textColor)),
                onSelected: (selected) => onFilterSelected('Desert'),
                backgroundColor: theme.cardColor,
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: Text('Makanan Utama', style: TextStyle(color: textColor)),
                onSelected: (selected) => onFilterSelected('Makanan Utama'),
                backgroundColor: theme.cardColor,
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: Text('Minuman', style: TextStyle(color: textColor)),
                onSelected: (selected) => onFilterSelected('Minuman'),
                backgroundColor: theme.cardColor,
              ),
            ],
          ),
          const SizedBox(height: 16),

          Text(
            'Tingkat Kesulitan',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          Row(
            children: [
              FilterChip(
                label: Text('Mudah', style: TextStyle(color: textColor)),
                onSelected: (selected) => onFilterSelected('Mudah'),
                backgroundColor: theme.cardColor,
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: Text('Sedang', style: TextStyle(color: textColor)),
                onSelected: (selected) => onFilterSelected('Sedang'),
                backgroundColor: theme.cardColor,
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: Text('Sulit', style: TextStyle(color: textColor)),
                onSelected: (selected) => onFilterSelected('Sulit'),
                backgroundColor: theme.cardColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Fungsi untuk menampilkan bottom sheet
void showFilterBottomSheet(BuildContext context, List<String> filters, Function(String) onFilterSelected) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent, // Transparan agar sudut melengkung terlihat
    builder: (context) => FilterBottomSheet(
      filters: filters,
      onFilterSelected: onFilterSelected,
    ),
  );
}