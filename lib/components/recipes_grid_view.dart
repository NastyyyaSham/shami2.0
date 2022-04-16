import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';

import '../recipe_detail.dart';
import '../recipe.dart';

class RecipesGridView extends StatelessWidget {
  // 1
  final List<SimpleRecipe> recipes;
  const RecipesGridView({
    Key? key,
    required this.recipes,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // 2
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: GridView.builder(
        itemCount: recipes.length,
        gridDelegate:
        const
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final simpleRecipe = recipes[index];
          return GestureDetector(
            // 8
            onTap: () {
              // 9
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    // 10
                    return RecipeDetail(recipe: Recipe.samples[index]);
                  },
                ),
              );
            },
            // 11
            child: RecipeThumbnail(recipe: simpleRecipe)
          );
        },
      ),
    );
  }
}