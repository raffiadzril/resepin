class Ingredient {
  final String name;
  final String imagePath;
  bool isSelected;

  Ingredient({
    required this.name,
    required this.imagePath,
    this.isSelected = false,
  });
}
