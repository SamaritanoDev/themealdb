class RecipeModel {
  final String id;
  final String name;
  final String imageUrl;
  final List<String> ingredients;
  final String instructions;

  RecipeModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.ingredients,
    required this.instructions,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['idMeal'],
      name: json['strMeal'],
      imageUrl: json['strMealThumb'],
      ingredients: _parseIngredients(json),
      instructions: json['strInstructions'],
    );
  }

  static List<String> _parseIngredients(Map<String, dynamic> json) {
    List<String> ingredients = [];
    // Intentamos obtener los ingredientes del JSON
    for (int i = 1; i <= 20; i++) {
      final ingredientKey = 'strIngredient$i';
      final ingredient = json[ingredientKey];
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(ingredient);
      }
    }
    return ingredients;
  }
}
