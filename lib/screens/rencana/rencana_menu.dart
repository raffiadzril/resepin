import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/core/constants/app_colors.dart';
import '../../providers/theme_notifier.dart';
import '../widgets/custom_bottom_nav.dart';
import 'add_resep_anda.dart';
import 'add_resep_baru.dart';
import 'add_resep_tersimpan.dart';

class RencanaMenuScreen extends StatefulWidget {
  RencanaMenuScreen({Key? key}) : super(key: key);

  @override
  _RencanaMenuScreenState createState() => _RencanaMenuScreenState();
}

class _RencanaMenuScreenState extends State<RencanaMenuScreen> {

  // Add global keys to track button positions
  final List<GlobalKey> _dayButtonKeys = List.generate(7, (index) => GlobalKey());

  // Add a nullable OverlayEntry field
  OverlayEntry? _overlayEntry;

  // Define the daysOfWeek variable
  final List<String> daysOfWeek = [
    'S',
    'S',
    'R',
    'K',
    'J',
    'S',
    'M',
  ];

  // Define the activeWeekdays variable
  final List<int> activeWeekdays = [0, 1, 2, 4]; // Example: Active weekdays are Monday, Tuesday, Wednesday, and Friday

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        title: Text(
          'Meal Planner',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: theme.textTheme.bodyLarge?.color ?? Colors.black,
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Week navigation
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

              // Weekday indicators
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    daysOfWeek.length,
                    (index) => _buildWeekdayCircle(index, theme),
                  ),
                ),
              ),

              // Start meal plan button
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

              // Days list
              Expanded(
                child: ListView.builder(
                  itemCount: daysOfWeek.length,
                  itemBuilder: (context, index) {
                    return _buildDayCard(context, index, theme);
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

    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : Colors.transparent,
        shape: BoxShape.circle,
        border: isActive ? null : Border.all(color: theme.dividerColor),
      ),
      child: Center(
        child: Text(
          daysOfWeek[index],
          style: TextStyle(
            color: isActive ? Colors.white : theme.textTheme.bodyLarge?.color ?? Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildDayCard(BuildContext context, int index, ThemeData theme) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              daysOfWeek[index],
              style: TextStyle(
                color: theme.textTheme.bodyLarge?.color ?? Colors.black,
                fontSize: 16,
              ),
            ),
            ElevatedButton(
              key: _dayButtonKeys[index],
              onPressed: () {
                _showRecipeOptions(context, index, Theme.of(context));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.dividerColor,
                foregroundColor: theme.textTheme.bodyLarge?.color ?? Colors.black,
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
        children: newMethod(icon, text, theme),
      ),
    );  
  }

  List<Widget> newMethod(IconData icon, String text, ThemeData theme) {
    return [
        Icon(icon, color: Colors.white, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(color: theme.textTheme.bodyLarge?.color ?? Colors.black),
          ),
        ),
      ];
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