import 'package:flutter/material.dart';
import '../widgets/ingredient_list.dart';
import 'package:provider/provider.dart';
import 'package:resepin/core/constants/app_colors.dart';
import 'package:resepin/screens/widgets/BackButtonFloating.dart';
import 'package:resepin/screens/widgets/recipe_card.dart';
import '../../providers/theme_notifier.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/search_bar.dart';
class CariresepbahanScreen extends StatelessWidget {
  const CariresepbahanScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black;
    final greyColor = theme.textTheme.bodyMedium?.color ?? Colors.grey;
    
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56, // Adjust the height of the AppBar
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color:
              isDarkMode
                  ? Colors.white
                  : Colors.black, // Sesuaikan warna ikon dengan tema
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resep Berdasarkan Bahan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor
              ),
            ),
            Text(
              'Pilih bahan yang anda miliki',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: AppColors.grey,
              ),
            ),
            SizedBox(height: 16),
            SearchBarWidget(hintText: "Cari bahan..."),
            SizedBox(height: 16),
            Expanded(
              child: IngredientList(),
            ),
          ],
        ),
      ),
    );
  }
}
