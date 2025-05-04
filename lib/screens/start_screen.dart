import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/providers/theme_notifier.dart'; // sesuaikan path

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> features = [
      {'label': 'Home', 'route': '/home'},
      {'label': 'Trending', 'route': '/trending'},
      {'label': 'Rencana Menu', 'route': '/rencana'},
      {'label': 'Rencana Menu Setelah', 'route': '/rencana_after'},
      {'label': 'Tambah Resep', 'route': '/add'},
      {'label': 'Bookmark', 'route': '/bookmark'},
      {'label': 'Profil', 'route': '/profile'},
      {'label': 'Detail Resep', 'route': '/recipe-detail'},
      {'label': 'New Password Succeed', 'route': '/new-password-succeed'},
      {'label': 'Email Verification', 'route': '/email-verification'},
      {'label': 'Forgot Password', 'route': '/forgot-password'},
      {'label': 'Loading Screen', 'route': '/loading'},
      {'label': 'Loading Screen 1', 'route': '/loading1'},
      {'label': 'Loading Screen 2', 'route': '/loading2'},
      {'label': 'Loading Screen 3', 'route': '/loading3'},
      {'label': 'New Password', 'route': '/new-password'},
      {'label': 'Register', 'route': '/register'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("KELOMPOK 26 - RESEPIN"),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header kolom
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Light Mode",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Dark Mode",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Daftar tombol
              ...features.map(
                (feature) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      // Tombol Light Mode
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).cardColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () {
                            Provider.of<ThemeNotifier>(context, listen: false)
                                .toggleThemeTo(false);
                            Navigator.pushNamed(context, feature['route']);
                          },
                          child: Text(
                            "${feature['label']}",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Tombol Dark Mode
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).cardColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () {
                            Provider.of<ThemeNotifier>(context, listen: false)
                                .toggleThemeTo(true);
                            Navigator.pushNamed(context, feature['route']);
                          },
                          child: Text(
                            "${feature['label']}",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
