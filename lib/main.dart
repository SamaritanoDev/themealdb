import 'package:flutter/material.dart';
import 'package:themealdb/src/features/recipes/presentation/screens/recipe_detail_screen.dart';
import 'package:themealdb/src/features/recipes/presentation/screens/search_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.deepPurpleAccent),
      initialRoute: '/meals',
      routes: {
        '/meals': (context) => const SearchScreen(),
        '/mealDetails': (context) => const RecipeDetailScreen()
      },
    );
  }
}
