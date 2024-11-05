import 'package:flutter/material.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return ListTile(
      tileColor: Colors.amber,
      leading: Image.network(
          'https://fastly.picsum.photos/id/464/200/300.jpg?grayscale&hmac=wWaPQwV0U4K4STyvSZzufP0MXjjMSwnPErNCQqGm2ZM',
          width: 50,
          height: 50),
      title: Text('nombre de Recipe', style: TextStyle(color: color.onPrimary)),
      trailing: Icon(Icons.arrow_forward_ios_sharp, color: color.onPrimary),
      onTap: () => Navigator.pushNamed(context, '/mealDetails'),
    );
  }
}
