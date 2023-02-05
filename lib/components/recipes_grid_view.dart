import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:restaurant/components/recipe_thumbnail.dart';
import 'package:restaurant/models/simple_recipe.dart';

class RecipesGridView extends StatelessWidget {
  final List<SimpleRecipe> recipes;
  const RecipesGridView({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      // 3
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        // 4
        itemCount: recipes.length,
        // RecipeThumbnail(recipe: recipes[index]);
        // 5
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 300,
        ),
        itemBuilder: (context, index) {
          // 6

          return Transform.translate(
            offset: Offset(
              0.0,
              index.isOdd ? 70 : 0.0,
            ),
            child: RecipeThumbnail(recipe: recipes[index]),
          );
        },
      ),
    );
  }
}
