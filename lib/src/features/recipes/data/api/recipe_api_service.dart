import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:themealdb/src/features/recipes/data/models/recipe_model.dart';

class RecipeApiService {
  static const String baseUrl =
      'https://www.themealdb.com/api/json/v1/1/search.php?s=';

  Future<List<Recipe>> fetchRecipes(String meal) async {
    final response = await http.get(Uri.parse(baseUrl + meal));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> meals = data['meals'] ?? [];

      // Imprime el contenido bruto de la respuesta antes de convertirlo
      debugPrint("Datos obtenidos de la API: $meals");

      // Convertimos la lista de meals a una lista de objetos Recipe
      return meals.map((meal) => Recipe.fromJson(meal)).toList();
    } else {
      throw Exception('Falla en la carga de recetas.');
    }
  }
}
