import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/providers/theme_notifier.dart'; // sesuaikan path

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> features = [
      {'label': 'Home', 'route': '/home'},
      {'label': 'Rencana Menu', 'route': '/rencana'},
      {'label': 'Tambah Resep', 'route': '/add'},
      {'label': 'Bookmark', 'route': '/bookmark'},
      {'label': 'Profil', 'route': '/profile'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("KELOMPOK 26 - RESEPIN"),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor, // Gunakan warna dari tema
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header kolom
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Light Mode",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Dark Mode",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Daftar fitur
            ...features.map((feature) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    // Tombol Light Mode
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).cardColor, // Gunakan warna dari tema
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          Provider.of<ThemeNotifier>(context, listen: false).toggleThemeTo(false);
                          Navigator.pushNamed(context, feature['route']);
                        },
                        child: Text(
                          "${feature['label']}",
                          style: Theme.of(context).textTheme.bodyLarge, // Gunakan warna teks dari tema
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Tombol Dark Mode
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).cardColor, // Gunakan warna dari tema
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          Provider.of<ThemeNotifier>(context, listen: false).toggleThemeTo(true);
                          Navigator.pushNamed(context, feature['route']);
                        },
                        child: Text(
                          "${feature['label']}",
                          style: Theme.of(context).textTheme.bodyLarge
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
