import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'themealsdb',
          style: TextStyle(
            color: color.onPrimary,
          ),
        ),
        backgroundColor: color.primary,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        color: color.primary,
        child: const Column(
          children: [
            SearchBar(
              hintText: 'Ingrese el nombre de la comida',
              leading: Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}
