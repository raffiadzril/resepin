import 'package:flutter/material.dart';
import 'package:resepin/core/constants/app_colors.dart';
import '../widgets/custom_bottom_nav.dart';
import 'add_resep_anda.dart';
import 'add_resep_baru.dart';
import 'add_resep_tersimpan.dart';

class Recipe {
  final String name;
  final String imageUrl;
  final double rating;
  final String chef;
  final String cookTime;

  Recipe({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.chef,
    required this.cookTime,
  });
}

class DayPlan {
  final String day;
  Recipe? recipe;

  DayPlan({required this.day, this.recipe});
}

class RencanaMenuAfterScreen extends StatefulWidget {
  const RencanaMenuAfterScreen({super.key});

  @override
  State<RencanaMenuAfterScreen> createState() => _RencanaMenuAfterScreenState();
}

class _RencanaMenuAfterScreenState extends State<RencanaMenuAfterScreen> {
  final List<DayPlan> weekPlan = [
    DayPlan(
      day: 'Senin',
      recipe: Recipe(
        name: 'Rendang Lebaran',
        imageUrl: 'https://example.com/rendang.jpg',
        rating: 4.7,
        chef: 'Chef Juna',
        cookTime: '1 jam',
      ),
    ),
    DayPlan(
      day: 'Selasa',
      recipe: Recipe(
        name: 'Pasta Carbonara',
        imageUrl: 'https://example.com/pasta.jpg',
        rating: 4.6,
        chef: 'Rendy Ando',
        cookTime: '1 jam',
      ),
    ),
    DayPlan(day: 'Rabu'),
    DayPlan(day: 'Kamis'),
    DayPlan(day: 'Jum\'at'),
    DayPlan(day: 'Sabtu'),
    DayPlan(day: 'Minggu'),
  ];

  final List<String> weekdayInitials = ['S', 'S', 'R', 'K', 'J', 'S', 'M'];
  final List<String> weekdayNames = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jum\'at', 'Sabtu', 'Minggu'];
  final List<int> activeWeekdays = [0, 1, 4];

  OverlayEntry? _overlayEntry;
  final List<GlobalKey> _dayButtonKeys = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < weekPlan.length; i++) {
      _dayButtonKeys.add(GlobalKey());
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        title: Text(
          'Meal Planner',
          style: theme.textTheme.titleLarge,
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: theme.iconTheme.color,
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.chevron_left, color: AppColors.primary),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Minggu ini',
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: AppColors.primary),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    weekdayInitials.length,
                    (index) => _buildWeekdayCircle(index, theme),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: const Text(
                    'MULAI RENCANA MASAK',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: weekPlan.length,
                  itemBuilder: (context, index) {
                    return _buildDayCard(index, theme);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeekdayCircle(int index, ThemeData theme) {
    final bool isActive = activeWeekdays.contains(index);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (activeWeekdays.contains(index)) {
            activeWeekdays.remove(index);
          } else {
            activeWeekdays.add(index);
          }
        });
      },
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: isActive ? Colors.red : Colors.transparent,
          shape: BoxShape.circle,
          border: isActive ? null : Border.all(color: theme.dividerColor),
        ),
        child: Center(
          child: Text(
            weekdayInitials[index],
            style: TextStyle(
              color: isActive ? Colors.white : theme.hintColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDayCard(int index, ThemeData theme) {
    final day = weekPlan[index];

    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  day.day,
                  style: theme.textTheme.bodyLarge,
                ),
                ElevatedButton(
                  key: _dayButtonKeys[index],
                  onPressed: () {
                    _showRecipeOptions(context, index, theme);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.dividerColor,
                    foregroundColor: theme.textTheme.bodyLarge?.color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.add, size: 16),
                      SizedBox(width: 4),
                      Text('Add'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (day.recipe != null) _buildRecipeCard(day.recipe!, theme),
        ],
      ),
    );
  }

  Widget _buildRecipeCard(Recipe recipe, ThemeData theme) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              child: Image.network(
                recipe.imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 150,
                    width: double.infinity,
                    color: theme.dividerColor,
                    child: const Center(
                      child: Icon(Icons.restaurant, size: 50, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.refresh, color: Colors.white),
                  onPressed: () {},
                  iconSize: 20,
                  padding: const EdgeInsets.all(8),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recipe.name,
                style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        recipe.rating.toString(),
                        style: theme.textTheme.bodyLarge?.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  Text(
                    recipe.chef,
                    style: theme.textTheme.bodyLarge?.copyWith(fontSize: 14),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.grey, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        recipe.cookTime,
                        style: theme.textTheme.bodyLarge?.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showRecipeOptions(BuildContext context, int dayIndex, ThemeData theme) {
    _removeOverlay();

    final RenderBox? renderBox = _dayButtonKeys[dayIndex].currentContext?.findRenderObject() as RenderBox?;

    if (renderBox == null) {
      return;
    }

    final position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: position.dy + 30,
          right: 20,
          child: Material(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: _removeOverlay,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _removeOverlay();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddResepAndaScreen(), // Replace with your actual page
                          ),
                        );
                      },
                      child: _buildOptionItem(Icons.restaurant, 'Dari resep anda', theme),
                    ),
                    Divider(height: 1, color: AppColors.primary.withOpacity(0.8)),
                    GestureDetector(
                      onTap: () {
                        _removeOverlay();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddResepTersimpanScreen(), // Replace with your actual page
                          ),
                        );
                      },
                      child: _buildOptionItem(Icons.bookmark, 'Dari resep tersimpan', theme),
                    ),
                    Divider(height: 1, color: AppColors.primary.withOpacity(0.8)),
                    GestureDetector(
                      onTap: () {
                        _removeOverlay();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddResepBaruScreen(), // Replace with your actual page
                          ),
                        );
                      },
                      child: _buildOptionItem(Icons.search, 'Cari resep', theme),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  Widget _buildOptionItem(IconData icon, String text, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }
}