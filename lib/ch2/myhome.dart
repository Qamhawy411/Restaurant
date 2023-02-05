import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurant/ch2/receipeDetails.dart';
import 'recipeModels .dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Home IN Restaurant")),),
      body: SafeArea(child: Container(
        child: ListView.builder(itemCount:Recipe.samples.length,itemBuilder: (context, index) {
          return  GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                return RecepieDetails(recipe: Recipe.samples[index]);
              })));
            },
            child: Card(
              elevation: 3,
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.black,width: 3)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image(image: NetworkImage(Recipe.samples[index].imageUrl)),
                    Text(Recipe.samples[index].label,style: const TextStyle(
                     fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                       fontFamily:'Palatino' ,
                                    ))
                  ],
                ),
              ),
            ),
          );
        },),
      )),
    );
  }
}