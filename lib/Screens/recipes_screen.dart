import 'package:flutter/material.dart';
import 'package:restaurant/Api/mock_fooderlich_service.dart';
import 'package:restaurant/components/recipes_grid_view.dart';
import 'package:restaurant/models/simple_recipe.dart';
class Recipesscreen extends StatelessWidget {
  final exploreService = MockFooderlichService();
   Recipesscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:exploreService.getRecipes() ,builder:(( context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
             if(snapshot.connectionState==ConnectionState.done){
              return Scaffold(
                body:  RecipesGridView(recipes:snapshot.data??[] ,)
              );
             }else{
              return const Scaffold(
                body: Center(child: CircularProgressIndicator(),),
              );
             }
    }) ,);
  }
}