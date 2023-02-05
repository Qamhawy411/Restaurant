// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/basic.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:restaurant/models/explore_recipe.dart';
// import 'package:restaurant/shared/sharedThemes/themes.dart';

// class Card3 extends StatefulWidget {
// final   ExploreRecipe recipe;
//   const Card3({super.key, required this.recipe});

//   @override
//   State<Card3> createState() => _Card3State();
// }

// class _Card3State extends State<Card3> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Container(
//               constraints: BoxConstraints.expand(
//                 height: 450,
//                 width: 350,
//               ),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image: AssetImage(widget.recipe.backgroundImage))),
//               child: Stack(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(.6),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Icon(Icons.book, size: 40),
//                           const SizedBox(height: 8),
//                           Text(
//                            widget.recipe.title,
//                             style: FoodlicheTheme.darkTextTheme.headline2,
//                           ),
//                           const SizedBox(height: 30),
//                           Wrap(
//                       alignment:WrapAlignment.start ,
//                       spacing:12 ,
//                       runSpacing:12
//                        ,
//                         children: [
//                           Chip(
//                               label: Text(
//                                 "Healthy",
//                                 style: FoodlicheTheme.darkTextTheme.bodyText1,
//                               ),
//                               backgroundColor: Colors.black.withOpacity(.7),onDeleted: () {
//                                 log("");
//                               },),

                              
//                                Chip(
//                               label: Text(
//                                 "Vegan",
//                                 style: FoodlicheTheme.darkTextTheme.bodyText1,
//                               ),
//                               backgroundColor: Colors.black.withOpacity(.7),onDeleted: () {
//                                 log("");
//                               },),
//                                Chippy("Carrots"),
                              
//                         ],
//                       ),
//                         ]),
//                   ),
                   
                        
                  
//                 ],
//               ))),
//     );
//   }
// Chip  Chippy (String text){
//     return  Chip(
//       label: Text(
//         text,
//         style: FoodlicheTheme.darkTextTheme.bodyText1,
        
//       ) ,backgroundColor: Colors.black.withOpacity(.7));
//   }
// }
import 'package:flutter/material.dart';
import 'package:restaurant/shared/sharedThemes/themes.dart';


import '../models/models.dart';

class Card3 extends StatelessWidget {
  final ExploreRecipe recipe;

  const Card3({
    super.key,
    required this.recipe,
  });

  List<Widget> createTagChips() {
    final chips = <Widget>[];
    recipe.tags.take(6).forEach((element) {
      final chip = Chip(
        label: Text(
          element,
          style: FoodlicheTheme.darkTextTheme.bodyText1,
        ),
        backgroundColor: Colors.black.withOpacity(0.7),
      );
      chips.add(chip);
    });

    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(recipe.backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(height: 8),
                  Text(recipe.title,
                      style:FoodlicheTheme .darkTextTheme.headline2),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            Center(
              child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 12,
                  runSpacing: 12,
                  children: createTagChips()),
            ),
          ],
        ),
      ),
    );
  }
}

