import 'package:flutter/material.dart';
import 'package:linkfy_text/linkfy_text.dart';
import 'package:themealdb/src/features/recipes/data/models/recipe_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
              'Instructions:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(recipe.instructions),
            const SizedBox(height: 8.0),
            LinkifyText(
              textStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: color.primary),
              "Watch on YouTube: ${recipe.youtubeUrl}",
              linkStyle: const TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.normal),
              onTap: (link) {
                _launchURL(recipe.youtubeUrl);
              },
            ),
            const SizedBox(height: 16.0),
            // Ingredientes
            const Text(
              'Ingredients:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            _buildIngredientsList(),
            const SizedBox(height: 20.0),
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
          Row(
            children: [
              const Icon(Icons.check, size: 20.0),
              Text('${recipe.measures[i]} ${recipe.ingredients[i]}'),
            ],
          ),
        );
      }
    }
    return Column(children: ingredientWidgets);
  }

//metodo para abrir un url
  void _launchURL(String url) async {
    if (await launchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'No se pudo abrir el enlace $url';
    }
  }
}
