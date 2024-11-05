class Recipe {
  final String idMeal;
  final String name;
  final String category;
  final String area;
  final String instructions;
  final String imageUrl;
  final String youtubeUrl;
  final List<String> ingredients;
  final List<String> measures;

  Recipe({
    required this.idMeal,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.imageUrl,
    required this.youtubeUrl,
    required this.ingredients,
    required this.measures,
  });

  // Método para crear un objeto Recipe desde el JSON de la API
  factory Recipe.fromJson(Map<String, dynamic> json) {
    // Extraemos los ingredientes y las medidas
    List<String> ingredients = [];
    List<String> measures = [];
    for (int i = 1; i <= 20; i++) {
      if (json['strIngredient$i'] != null && json['strIngredient$i'] != "") {
        ingredients.add(json['strIngredient$i']);
        measures.add(json['strMeasure$i']);
      }
    }

    return Recipe(
      idMeal: json['idMeal'],
      name: json['strMeal'],
      category: json['strCategory'],
      area: json['strArea'],
      instructions: json['strInstructions'],
      imageUrl: json['strMealThumb'],
      youtubeUrl: json['strYoutube'] ?? '',
      ingredients: ingredients,
      measures: measures,
    );
  }
}
