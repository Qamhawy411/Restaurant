import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/Screens/explore_screen.dart';
import 'package:restaurant/Screens/grocery_screen.dart';
import 'package:restaurant/Screens/navigation/navigation_Controller.dart';
import 'package:restaurant/Screens/navigation/navigation_States.dart';
import 'package:restaurant/Screens/recipes_screen.dart';

class Fooderliche extends StatefulWidget {
  const Fooderliche({super.key});

  @override
  State<Fooderliche> createState() => _FooderlicheState();
}

class _FooderlicheState extends State<Fooderliche> {
  int currentindex = 0;
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationController,NavigationStates>(
      builder: (context, state) => 
       Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:currentindex ,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore), label: "Explore"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.food_bank), label: "Recipe"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.view_week), label: "Buying")
            ],
           
            onTap: ((value) {
             BlocProvider.of<NavigationController>(context).move(value);
             currentindex=value;
            }),
          ),
          appBar: AppBar(
            title: Center(
              child: Text(
                "Qamhawy's Restaurant",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          body:  BlocProvider.of<NavigationController>(context).screens[currentindex]),
    );
  }
}
