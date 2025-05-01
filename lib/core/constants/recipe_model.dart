class Recipe {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double rating;
  final int prepTime;
  final int cookTime;
  final int totalTime;
  final int servings;
  final List<Ingredient> ingredients;
  final List<CookingStep> steps;
  final List<Review> reviews;
  final Chef chef;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.prepTime,
    required this.cookTime,
    required this.totalTime,
    required this.servings,
    required this.ingredients,
    required this.steps,
    required this.reviews,
    required this.chef,
  });
}

class Ingredient {
  final String name;
  final String quantity;
  final String unit;

  Ingredient({required this.name, required this.quantity, required this.unit});
}

class CookingStep {
  final int number;
  final String instruction;
  final String? tip;

  CookingStep({required this.number, required this.instruction, this.tip});
}

class Review {
  final String userName;
  final String userImage;
  final String date;
  final double rating;
  final String comment;

  Review({
    required this.userName,
    required this.userImage,
    required this.date,
    required this.rating,
    required this.comment,
  });
}

class Chef {
  final String name;
  final String image;
  final String title;
  final int recipeCount;

  Chef({
    required this.name,
    required this.image,
    required this.title,
    required this.recipeCount,
  });
}
