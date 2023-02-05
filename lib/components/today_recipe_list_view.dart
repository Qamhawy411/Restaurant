import 'package:flutter/material.dart';
import 'package:restaurant/components/card1.dart';
import 'package:restaurant/components/card2.dart';
import 'package:restaurant/components/card3.dart';
import 'package:restaurant/models/explore_recipe.dart';

class TodayRecipeListView extends StatelessWidget {
  final List<ExploreRecipe> recipes;
  
  const TodayRecipeListView({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
        // 4
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 5
            Text('Recipes of the Day  ',
                style: Theme.of(context).textTheme.headline1),
            // 6
            const SizedBox(height: 16),
            // 7
            Container(
              height: 400,
              width: double.infinity,
             color: Colors.transparent,
             child: Expanded(
               child: ListView.separated(reverse: true,shrinkWrap: true,scrollDirection: Axis.horizontal,itemBuilder: ((context, index) {
               
                 return  SizedBox (child: buildCard(recipes[index]));
               }), separatorBuilder: ((context, index) {
                 return SizedBox(width:16 ,);
               }), itemCount: recipes.length),
             ),
             
            ),
          ],
        ));
  }
  Widget buildCard(ExploreRecipe recipe ) {
    if(recipe.cardType==RecipeCardType.card1){
      return Card1(recipe: recipe,);
    } else if(recipe.cardType==RecipeCardType.card2){
      return Card2(recipe: recipe,);
    }else if(recipe.cardType== RecipeCardType.card3){
      return Card3(recipe: recipe,);
    }else {
      return Text( 'This card doesn\'t exist yet',);
    }
  }
}
