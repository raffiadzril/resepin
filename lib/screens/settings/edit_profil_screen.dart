import 'package:flutter/material.dart';
import 'package:resepin/core/constants/app_colors.dart';
import '../widgets/custom_bottom_nav.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final tileColor = isDarkMode ? Colors.grey[850]! : Colors.grey[200]!;
    final shadowColor = isDarkMode ? Colors.transparent : Colors.black.withAlpha((0.03 * 255).toInt());
    final arrowColor = isDarkMode ? Colors.white70 : Colors.black45;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: textColor,
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          "Profil Saya",
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 4),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
            children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("images/profile/salt-bae.webp"),
            ),
            const SizedBox(height: 8),
            const Text(
              "Ubah Foto",
              style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            _buildInfoTile(
              title: "Nama",
              value: "Chef Salt Bae",
              showArrow: true,
              textColor: textColor,
              tileColor: tileColor,
              shadowColor: shadowColor,
              arrowColor: arrowColor,
            ),
            const SizedBox(height: 16),
            _buildInfoTile(
              title: "Email",
              value: "Chefsaltbae@gmail.com",
              textColor: textColor,
              tileColor: tileColor,
              shadowColor: shadowColor,
              arrowColor: arrowColor,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 10,
                  ),
                ),
                child: const Text(
                  "Simpan",
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14, // Ukuran font lebih kecil
                  ),
                ),
                ),
              ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile({
    required String title,
    required String value,
    required Color textColor,
    required Color tileColor,
    required Color shadowColor,
    required Color arrowColor,
    bool showArrow = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: tileColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontWeight: FontWeight.w500, color: textColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (showArrow)
            Icon(Icons.arrow_forward_ios_rounded, size: 16, color: arrowColor),
        ],
      ),
    );
  }
}
