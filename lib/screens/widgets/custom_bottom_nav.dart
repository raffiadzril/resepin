import 'package:flutter/material.dart';
import 'package:resepin/core/constants/app_colors.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int _selectedIndex = 0;

  final List<IconData> _icons = [
    Icons.home,
    Icons.calendar_month_rounded,
    Icons.add_box_rounded,
    Icons.bookmark,
    Icons.person,
  ];

  final List<String> _labels = [
    'Beranda',
    'Rencana',
    'Tambah',
    'Simpan',
    'Profil',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // TODO: Add navigation logic here
  }

 @override
Widget build(BuildContext context) {
  return ClipRRect(
    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
    child: BottomAppBar(
      color: AppColors.primary,
      child: SizedBox(
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
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _labels[index],
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
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
    ),
  );
}
}