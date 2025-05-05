import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/providers/theme_notifier.dart';
import '../widgets/custom_bottom_nav.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black;
    final isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        title: Text(
          'Pengaturan',
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            Text(
              'Akun',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 12),
            SettingsCard(
              icon: Icons.person,
              iconColor: Theme.of(context).iconTheme.color ?? Colors.black,
              title: 'Profil Saya',
              onTap: () {
                Navigator.of(context).pushNamed('/edit-profile');
              },
            ),
            SettingsCard(
              icon: Icons.key,
              iconColor: Theme.of(context).iconTheme.color ?? Colors.black,
              title: 'Ubah Kata Sandi',
              onTap: () {
                Navigator.of(context).pushNamed('/change-password');
              },
            ),
            Text(
              'Preferensi',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            SettingsCard(
              icon: Icons.mode_night,
              iconColor: Theme.of(context).iconTheme.color ?? Colors.black,
              title: 'Mode Gelap',
              onTap: () {
                Provider.of<ThemeNotifier>(context, listen: false)
                    .toggleTheme();
              },
              trailingWidget: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  Provider.of<ThemeNotifier>(context, listen: false)
                      .toggleTheme();
                },
              ),
            ),
            SettingsCard(
              icon: Icons.language,
              iconColor: Theme.of(context).iconTheme.color ?? Colors.black,
              title: 'Bahasa',
              onTap: () {
                // Navigate to notifications
              },
            ),
            Text(
              'Notifikasi',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            SettingsCard(
              icon: Icons.notifications,
              iconColor: Theme.of(context).iconTheme.color ?? Colors.black,
              title: 'Notifikasi',
              onTap: () {
                // Navigate to notifications
              },
            ),
            SettingsCard(
              icon: Icons.calendar_month,
              iconColor: Theme.of(context).iconTheme.color ?? Colors.black,
              title: 'Rencana Menu',
              onTap: () {
                // Navigate to notifications
              },
            ),
            Text(
              'Bantuan & Informasi',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            SettingsCard(
              icon: Icons.help,
              iconColor: Theme.of(context).iconTheme.color ?? Colors.black,
              title: 'Pusat Bantuan',
              onTap: () {
                // Navigate to notifications
              },
            ),
            SettingsCard(
              icon: Icons.info,
              iconColor: Theme.of(context).iconTheme.color ?? Colors.black,
              title: 'Kebijakan Aplikasi',
              onTap: () {
                // Navigate to notifications
              },
            ),
            SettingsCard(
              icon: Icons.description,
              iconColor: Theme.of(context).iconTheme.color ?? Colors.black,
              title: 'Syarat & Ketentuan',
              onTap: () {
                // Navigate to notifications
              },
            ),
            Text(
              'Lainnya',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            SettingsCard(
              icon: Icons.logout,
              iconColor: Colors.red,
              title: 'Keluar Akun',
              onTap: () {
                // Navigate to notifications
              },
            ),
            SettingsCard(
              icon: Icons.delete,
              iconColor: Theme.of(context).iconTheme.color ?? Colors.black,
              title: 'Hapus Akun',
              onTap: () {
                // Navigate to notifications
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(
        currentIndex: 4,
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final VoidCallback onTap;

  const SettingsCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.onTap,
    this.trailingWidget,
  });

  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        child: InkWell(
          onTap: onTap,
          child: ListTile(
            leading: Icon(icon, color: iconColor),
            title: Text(title),
            trailing: trailingWidget,
          ),
        ),
      ),
    );
  }
}
