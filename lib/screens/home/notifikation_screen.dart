import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Untuk mengelola state tema
import 'package:resepin/screens/widgets/KomunitasTab.dart'; // Tab untuk komunitas
import 'package:resepin/screens/widgets/resepintab.dart'; // Tab untuk Resepin
import '../../providers/theme_notifier.dart'; // Provider untuk tema

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Variabel untuk menentukan tab yang dipilih
  bool isKomunitasSelected = true;

  @override
  Widget build(BuildContext context) {
    // Mendapatkan status tema (gelap atau terang) dari provider
    final isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;
    final theme = Theme.of(context); // Mendapatkan tema saat ini

    final textColor = isDarkMode ? Colors.white : Colors.black; // Warna teks sesuai tema

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
          'Notifikasi', // Judul AppBar
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black, // Warna ikon sesuai tema
        ),
      ),
      body: Column(
        children: [
          // Tab Selector
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16), // Padding horizontal
            child: Container(
              padding: const EdgeInsets.all(4), // Padding dalam container
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade300, // Warna latar sesuai tema
                borderRadius: BorderRadius.circular(30), // Sudut melengkung
              ),
              child: Row(
                children: [
                  _buildTabButton('Komunitas', true, isDarkMode), // Tab Komunitas
                  _buildTabButton('Resepin', false, isDarkMode), // Tab Resepin
                ],
              ),
            ),
          ),
          const SizedBox(height: 16), // Jarak antar elemen
          Expanded(
            child: isKomunitasSelected
                ? const KomunitasTab() // Tampilkan tab Komunitas jika dipilih
                : const ResepinTab(), // Tampilkan tab Resepin jika dipilih
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuat tombol tab
  Expanded _buildTabButton(String label, bool isKomunitas, bool isDarkMode) {
    final isSelected = isKomunitasSelected == isKomunitas; // Cek apakah tab dipilih
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isKomunitasSelected = isKomunitas), // Ubah tab yang dipilih
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10), // Padding vertikal
          decoration: BoxDecoration(
            color: isSelected
                ? (isDarkMode ? const Color.fromARGB(255, 0, 0, 0) : Colors.white) // Warna tab aktif
                : Colors.transparent, // Warna tab tidak aktif
            borderRadius: BorderRadius.circular(30), // Sudut melengkung
          ),
          alignment: Alignment.center, // Teks di tengah
          child: Text(
            label, // Label tab
            style: TextStyle(
              fontWeight: FontWeight.bold, // Teks tebal
              color: isSelected
                  ? (isDarkMode ? Colors.white : Colors.black) // Warna teks tab aktif
                  : (isDarkMode ? Colors.grey.shade400 : Colors.grey), // Warna teks tab tidak aktif
            ),
          ),
        ),
      ),
    );
  }
}