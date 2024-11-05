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
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    final TextEditingController controller = TextEditingController();
    final RecipeApiService apiService = RecipeApiService();
    List<Recipe>? recipes;
    bool isLoading = false; //para manejar el estado de carga

    //funciones de busqueda
    void searchRecipes() async {
      setState(() {
        isLoading = true;
      });

      try {
        //obtener lista de recetas
        final myRecipes = await apiService.fetchRecipes(controller.text);
        
        setState(() {
          recipes = myRecipes;
        });
      } catch (e) {
        // Manejo de errores
        const SnackBar(content: Text('No se encontraron recetas.'));
        debugPrint("error: $e");
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }

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
              controller: controller,
              onSubmitted: (value) {
                searchRecipes();
              },
              hintText: 'Ingrese el nombre de la comida',
              leading: const Icon(Icons.search),
            ),
            const SizedBox(height: 100),
            isLoading
                ? const CircularProgressIndicator()
                : recipes != null
                    ? const RecipeList()
                    : Text('No se encontraron recetas.',
                        style: TextStyle(color: color.onPrimary)),
          ],
        ),
      ),
    );
  }
}
