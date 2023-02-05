import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurant/models/explore_recipe.dart';
import 'package:restaurant/shared/sharedThemes/themes.dart';
import 'package:restaurant/shared/shared_widget/AuthorCard.dart';

class Card2 extends StatefulWidget {
   final ExploreRecipe recipe;
  const Card2({super.key, required this.recipe});

  @override
  State<Card2> createState() => _Card2State();
}

class _Card2State extends State<Card2> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.recipe.backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  AuthorCard(
                      authorName: widget.recipe.authorName,
                      title:widget.recipe.role ,
                      imageProvider: AssetImage(widget.recipe.profileImage)),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                      right: 16,
                      bottom: 16,
                      child: Text(
                        "Receipe",
                        style: FoodlicheTheme.darkTextTheme.headline1,
                      )),
                       Positioned(
                      left: 16,
                      bottom: 70,
                      child: RotatedBox(
                        quarterTurns:3 ,
                        child: Text(
                          "Smothies",
                          style: FoodlicheTheme.darkTextTheme.headline1,
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
