import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/Screens/grocery_item_screen.dart';
import 'package:restaurant/components/grocery_tile.dart';
import 'package:restaurant/models/grocery_States.dart';

import '../models/grocery_manager.dart';

class GroceryListScreen extends StatelessWidget {
  const GroceryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<GroceryController, GroceryStates>(
        builder: (context, state) => ListView.separated(
            itemBuilder: (((context, index) {
              return Dismissible(
                key: Key(BlocProvider.of<GroceryController>(context)
                    .groceryItem[index]
                    .id),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: const Icon(
                    Icons.delete_forever,
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
                onDismissed: ((direction) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          '${BlocProvider.of<GroceryController>(context).groceryItem[index].name} dismissed')));
                  BlocProvider.of<GroceryController>(context).deleteItem(index);
                
                }),
                child: InkWell(
                  child: GroceryTile(
                    item: BlocProvider.of<GroceryController>(context)
                        .groceryItem[index],
                    key: Key(BlocProvider.of<GroceryController>(context)
                        .groceryItem[index]
                        .id),
                    onComplete: (change) {
                      if (change != null) {
                        BlocProvider.of<GroceryController>(context)
                            .completeItem(index, change);
                      }
                    },
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: ((context) {
                      return GroceryItemScreen(
                          originalItem:
                              BlocProvider.of<GroceryController>(context)
                                  .groceryItem[index],
                          onCreate: (item) {},
                          onUpdate: (item) {
                            BlocProvider.of<GroceryController>(context)
                                .updateItem(item, index);
                            Navigator.pop(context);
                          });
                    })));
                  },
                ),
              );
            })),
            separatorBuilder: ((context, index) {
              return const SizedBox(height: 16.0);
            }),
            itemCount:
                BlocProvider.of<GroceryController>(context).groceryItem.length),
      ),
    );
  }
}
