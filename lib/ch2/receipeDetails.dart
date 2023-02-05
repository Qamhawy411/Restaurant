import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:restaurant/ch2/recipeModels%20.dart';

class RecepieDetails extends StatefulWidget {
  final Recipe recipe;
  const RecepieDetails({required this.recipe, super.key});

  @override
  State<RecepieDetails> createState() => _RecepieDetailsState();
}

class _RecepieDetailsState extends State<RecepieDetails> {
  double sliderval=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(widget.recipe.label),
      )),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image(image: NetworkImage(widget.recipe.imageUrl)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.recipe.label,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Palatino',
                )),
          ),
          Expanded(

            child: ListView.builder(
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: ((context, index) {
                  Ingredient ingredient = widget.recipe.ingredients[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "${sliderval*ingredient.quantity} ${ingredient.measure} ${ingredient.name}", style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Allison',
                )),
                  );
                })),
          ),
          Slider(value: sliderval, onChanged: ((value) {setState(() {
            sliderval=value;
          });}),min: 1,max: 10,divisions: 9,label: sliderval.toString(),activeColor: Colors.green,inactiveColor: Colors.black,)
        ],
      )),
    );
  }
}
