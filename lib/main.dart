import 'package:flutter/material.dart';
import 'package:restaurant/Screens/explore_screen.dart';
import 'package:restaurant/Screens/grocery_screen.dart';
import 'package:restaurant/Screens/navigation/navigation_Controller.dart';
import 'package:restaurant/Screens/recipes_screen.dart';
import 'package:restaurant/ch2/myhome.dart';
import 'package:restaurant/Screens/fooderliche.dart';
import 'package:restaurant/components/card3.dart';
import 'package:restaurant/models/grocery_manager.dart';
import 'shared/sharedThemes/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
 
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     ThemeData theme = FoodlicheTheme.dark();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => NavigationController())),
        BlocProvider(create: ((context) => GroceryController()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Restaurant ",
        // theme: theme.copyWith(
        //     colorScheme: theme.colorScheme
        //         .copyWith(primary: Colors.grey, secondary: Colors.amber)),
        theme: theme,
         home: const Fooderliche(),  
      ),
    );
  }
}
