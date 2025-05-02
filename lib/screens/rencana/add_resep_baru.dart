import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Planner',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      home: const RecipeSelectionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Recipe {
  final String name;
  final String imageUrl;
  bool isSelected;

  Recipe({
    required this.name,
    required this.imageUrl,
    this.isSelected = false,
  });
}

class RecipeSelectionScreen extends StatefulWidget {
  const RecipeSelectionScreen({Key? key}) : super(key: key);

  @override
  State<RecipeSelectionScreen> createState() => _RecipeSelectionScreenState();
}

class _RecipeSelectionScreenState extends State<RecipeSelectionScreen> {
  final List<Recipe> availableRecipes = [
    Recipe(
      name: 'Pasta Carbonara',
      imageUrl: 'https://example.com/pasta.jpg',
    ),
    Recipe(
      name: 'Ayam Panggang',
      imageUrl: 'https://example.com/ayam.jpg',
    ),
  ];

  final List<Recipe> selectedRecipes = [
    Recipe(
      name: 'Pasta Carbonara',
      imageUrl: 'https://example.com/pasta.jpg',
      isSelected: true,
    ),
    Recipe(
      name: 'Ayam Panggang',
      imageUrl: 'https://example.com/ayam.jpg',
      isSelected: true,
    ),
  ];

  final TextEditingController _searchController = TextEditingController();
  bool _showSuccessMessage = true;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Success message
            if (_showSuccessMessage) _buildSuccessMessage(),
            
            // Main content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Header
                    Center(
                      child: Text(
                        'Tambah Resep dari\nResep Baru',
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Search bar
                    _buildSearchBar(),
                    const SizedBox(height: 16),
                    
                    // Recipe list
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // Available recipes
                            ...availableRecipes.map((recipe) => _buildRecipeCard(recipe)),
                            
                            const SizedBox(height: 32),
                            
                            // Selected day header
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Senin',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            
                            // Selected recipes
                            ...selectedRecipes.map((recipe) => _buildSelectedRecipeItem(recipe)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Confirm button
            _buildConfirmButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessMessage() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: const Text(
        'Rencana masak berhasil dibuat!',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          hintText: 'Cari resep...',
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildRecipeCard(Recipe recipe) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Recipe image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                recipe.imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // Placeholder for image loading errors
                  return Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey.shade700,
                    child: const Icon(Icons.restaurant, color: Colors.grey),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            
            // Recipe name
            Expanded(
              child: Text(
                recipe.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            // Select button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  recipe.isSelected = !recipe.isSelected;
                  if (recipe.isSelected) {
                    selectedRecipes.add(recipe);
                  } else {
                    selectedRecipes.removeWhere((r) => r.name == recipe.name);
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text(
                'Pilih',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedRecipeItem(Recipe recipe) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          // Fork and knife icon
          const Icon(Icons.restaurant, color: Colors.white),
          const SizedBox(width: 16),
          
          // Recipe name
          Expanded(
            child: Text(
              recipe.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          
          // Delete button
          ElevatedButton(
            onPressed: () {
              setState(() {
                selectedRecipes.removeWhere((r) => r.name == recipe.name);
                // Also update the available recipes list
                for (var r in availableRecipes) {
                  if (r.name == recipe.name) {
                    r.isSelected = false;
                  }
                }
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade800,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            child: const Text('delete'),
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          // Handle confirmation
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Meal plan confirmed!'),
              backgroundColor: Colors.green,
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: const Text(
          'Konfirmasi',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}