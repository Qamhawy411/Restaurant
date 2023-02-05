import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurant/models/explore_recipe.dart';
import 'package:restaurant/shared/sharedThemes/themes.dart';

class Card1 extends StatefulWidget {
  final ExploreRecipe recipe;
  const Card1({super.key, required this.recipe});

  @override
  State<Card1> createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(height: 450, width: 350),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.recipe.backgroundImage))),
        child: Stack(
          children: [
            Text(
              widget.recipe.subtitle,
              style: FoodlicheTheme.darkTextTheme.bodyText1,
            ),
            Positioned(
                top: 20,
                child: Text(
                  widget.recipe.title,
                  style: FoodlicheTheme.darkTextTheme.headline4,
                )),
            Positioned(
                bottom: 30,
                right: 0,
                child: Text(
                  widget.recipe.message,
                  style: FoodlicheTheme.darkTextTheme.bodyText1,
                )),
            Positioned(
                bottom: 10,
                right: 0,
                child: Text(
                  widget.recipe.authorName,
                  style: FoodlicheTheme.darkTextTheme.bodyText1,
                )),
          ],
        ),
      ),
    );
  }
}
