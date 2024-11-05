import 'package:flutter/material.dart';
import 'package:themealdb/src/features/recipes/data/models/recipe_model.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailScreen(this.recipe, {super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: color.onPrimary),
        ),
        title: Text(
          'Detail of ${recipe.name}',
          style: TextStyle(
            color: color.onPrimary,
          ),
        ),
        backgroundColor: color.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen de la receta
            Image.network(recipe.imageUrl, fit: BoxFit.cover),
            const SizedBox(height: 16.0),
            // Titulo de la receta
            Text(
              recipe.name,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            // Instrucciones
            const Text(
              'Instrucciones:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(recipe.instructions),
            const SizedBox(height: 16.0),
            // Ingredientes
            const Text(
              'Ingredientes:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            _buildIngredientsList(),
          ],
        ),
      ),
    );
  }

  // Método para construir la lista de ingredientes
  Widget _buildIngredientsList() {
    List<Widget> ingredientWidgets = [];
    for (int i = 0; i < recipe.ingredients.length; i++) {
      if (recipe.ingredients[i].isNotEmpty) {
        ingredientWidgets.add(
          Text('${recipe.measures[i]} ${recipe.ingredients[i]}'),
        );
      }
    }
    return Column(children: ingredientWidgets);
  }
}
