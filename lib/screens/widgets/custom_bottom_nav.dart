import 'package:flutter/material.dart';
import 'package:resepin/core/constants/app_colors.dart';

class CustomBottomNav extends StatefulWidget {
  final int currentIndex;

  const CustomBottomNav({super.key, required this.currentIndex});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  late int _selectedIndex;

  final List<IconData> _icons = [
    Icons.home,
    Icons.calendar_today,
    Icons.add,
    Icons.bookmark,
    Icons.person,
  ];

  final List<String> _labels = [
    'Beranda',
    'Rencana',
    'Tambah Resep',
    'Simpan Resep',
    'Profil',
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  void _onItemTapped(int index) {
    // Jika ingin navigasi antar halaman, lakukan di sini:
    // Navigator.pushNamed(context, ...);
    setState(() {
      _selectedIndex = index;
    });
  
    switch (index) {
      case 0:
      // Navigate to Home screen
      Navigator.pushNamed(context, '/home');
      break;
      case 1:
      // Navigate to Calendar screen
      Navigator.pushNamed(context, '/rencana');
      break;
      case 2:
      // Navigate to Add screen
      Navigator.pushNamed(context, '/add');
      break;
      case 3:
      // Navigate to Bookmark screen
      Navigator.pushNamed(context, '/bookmark');
      break;
      case 4:
      // Navigate to Profile screen
      Navigator.pushNamed(context, '/profile');
      break;
      default:
      break;
    }
  }

 @override
Widget build(BuildContext context) {
  return ClipRRect(
    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
    child: BottomAppBar(
      color: AppColors.primary,
        height: 70, // Sesuaikan tinggi navbar
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_icons.length, (index) {
            final isSelected = _selectedIndex == index;
            return GestureDetector(
              onTap: () => _onItemTapped(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Icon(
                    _icons[index],
                    color: isSelected
                      ? Theme.of(context).brightness == Brightness.dark
                        ? Colors.black
                        : Colors.white
                      : Theme.of(context).brightness == Brightness.dark
                        ? Colors.black.withOpacity(0.5)
                        : Colors.white.withOpacity(0.5),
                    ),
                    const SizedBox(height: 4),
                    Text(
                    _labels[index],
                    style: TextStyle(
                      color: isSelected
                        ? Theme.of(context).brightness == Brightness.dark
                          ? Colors.black
                          : Colors.white
                        : Theme.of(context).brightness == Brightness.dark
                          ? Colors.black.withOpacity(0.5)
                          : Colors.white.withOpacity(0.5),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            );
          }),
      ),
    ),
  );
}
}