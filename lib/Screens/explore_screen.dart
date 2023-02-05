import 'package:flutter/material.dart';
import 'package:restaurant/Api/mock_fooderlich_service.dart';
import 'package:restaurant/components/friend_post_list_view.dart';
import 'package:restaurant/components/today_recipe_list_view.dart';
import 'package:restaurant/models/explore_data.dart';

class ExploreScreen extends StatelessWidget {
  // 1

  final mockService = MockFooderlichService();
  ExploreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // 2
    // TODO: Add TodayRecipeListView FutureBuilder
    return FutureBuilder(
      // 2
      future: mockService.getExploreData(),
      // 3
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        // 4
        if (snapshot.connectionState == ConnectionState.done) {
          // 5
          final recipes = snapshot.data?.todayRecipes ?? [];
          // final recipes = snapshot.data!.todayRecipes ;

          return Scaffold(
              body: ListView(
            children: [
              TodayRecipeListView(recipes: recipes),
              const SizedBox(height: 16),
              friend_post_list_view(friendPosts: snapshot.data!.friendPosts),
            ],
          ));
        } else {
          // 6
          return const Scaffold(
            body: Center(
            child: CircularProgressIndicator(),
          ),
          ) ;
        }
      },
    );
  }
}
