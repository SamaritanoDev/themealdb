import 'package:flutter/material.dart';
import 'package:themealdb/src/features/recipes/data/models/recipe_model.dart';
import 'package:themealdb/src/features/recipes/presentation/screens/recipe_detail_screen.dart';

class RecipeList extends StatelessWidget {
  final List<Recipe> recipes;
  const RecipeList({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          //extraer los index de la lista
          final recipe = recipes[index];

          return ListTile(
            tileColor: Colors.amber,
            leading: Image.network(recipe.imageUrl, width: 50, height: 50),
            title: Text(recipe.name, style: TextStyle(color: color.onPrimary)),
            trailing:
                Icon(Icons.arrow_forward_ios_sharp, color: color.onPrimary),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RecipeDetailScreen(recipe),
              ),
            ),
          );
        },
        itemCount: recipes.length,
      ),
    );
  }
}
