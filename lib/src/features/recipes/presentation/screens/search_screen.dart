import 'package:flutter/material.dart';
import 'package:themealdb/src/features/recipes/data/api/recipe_api_service.dart';
import 'package:themealdb/src/features/recipes/data/models/recipe_model.dart';
import 'package:themealdb/src/features/recipes/presentation/widgets/recipe_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  final RecipeApiService _apiService = RecipeApiService();
  List<Recipe>? _recipes = [];
  bool _isLoading = false; //para manejar el estado de carga

  //funcion de busqueda
  void searchRecipes() async {
    setState(() {
      _isLoading = true;
    });

    try {
      //obtener lista de recetas
      final myRecipes = await _apiService.fetchRecipes(_controller.text);

      setState(() {
        _recipes = myRecipes;
      });
    } catch (e) {
      // Manejo de errores
      const SnackBar(content: Text('No se encontraron recetas.'));
      debugPrint("error: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'themealsdb',
          style: TextStyle(color: color.onPrimary),
        ),
        backgroundColor: color.primary,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        color: color.primary,
        child: Column(
          children: [
            SearchBar(
              controller: _controller,
              onSubmitted: (value) {
                searchRecipes(); // Ejecutar búsqueda cuando el usuario envíe la búsqueda.
              },
              hintText: 'Ingrese el nombre de la comida',
              leading: const Icon(Icons.search),
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : _recipes != null && _recipes!.isNotEmpty
                    ? RecipeList(recipes: _recipes!)
                    : Text(
                        'No se encontraron recetas.',
                        style: TextStyle(color: color.onPrimary),
                      ),
          ],
        ),
      ),
    );
  }
}
