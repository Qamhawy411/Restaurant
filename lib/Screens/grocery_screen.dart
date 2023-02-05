import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/Screens/empty_grocery_screen.dart';
import 'package:restaurant/Screens/grocery_item_screen.dart';
import 'package:restaurant/models/grocery_States.dart';
import 'package:restaurant/models/grocery_manager.dart';
import 'grocery_list_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
         heroTag: null,
          onPressed: (() {
            Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
             return GroceryItemScreen(
                  onCreate: (item) {
                    BlocProvider.of<GroceryController>(context).addItem(item);
                    Navigator.pop(context);
                  },
                  onUpdate: (item) {});
            })));
          }),
          child: const Icon(Icons.add)),
      body: BlocBuilder<GroceryController, GroceryStates>(
        builder: (context, state) {
          if (state is GroceryEmptyState) {
            return const GroceryListScreen();
          } else if(state is GroceryListScreen) {
            return const empty_grocery_screen();
          }else{
            return Text("someThing Erorr");
          }
        },
      ),
    );
  }
}
