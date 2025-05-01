import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Added for Provider
import 'package:resepin/screens/widgets/KomunitasTab.dart';
import 'package:resepin/screens/widgets/resepintab.dart';
import '../../providers/theme_notifier.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isKomunitasSelected = true;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;
    final theme = Theme.of(context);

    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: textColor,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Notifikasi',
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      body: Column(
        children: [
          // Tab Selector
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  _buildTabButton('Komunitas', true, isDarkMode),
                  _buildTabButton('Resepin', false, isDarkMode),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: isKomunitasSelected
                ? const KomunitasTab()
                : const ResepinTab(),
          ),
        ],
      ),
    );
  }

  Expanded _buildTabButton(String label, bool isKomunitas, bool isDarkMode) {
    final isSelected = isKomunitasSelected == isKomunitas;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isKomunitasSelected = isKomunitas),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? (isDarkMode ? const Color.fromARGB(255, 0, 0, 0) : Colors.white)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected
                  ? (isDarkMode ? Colors.white : Colors.black)
                  : (isDarkMode ? Colors.grey.shade400 : Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}