import 'package:bloc/bloc.dart';
import 'package:restaurant/Screens/explore_screen.dart';
import 'package:restaurant/Screens/grocery_screen.dart';
import 'package:restaurant/Screens/navigation/navigation_States.dart';
import 'package:restaurant/Screens/recipes_screen.dart';
class NavigationController extends Cubit<NavigationStates> {
  List screens=[ExploreScreen(), Recipesscreen(), GroceryScreen()];
  NavigationController():super(NavigationMove(1,Recipesscreen()));
   
   move(int index){
      emit(NavigationMove(index, screens[index]));
   }
}