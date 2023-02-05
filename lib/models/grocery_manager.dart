import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/models/grocery_States.dart';
import 'package:restaurant/models/grocery_item.dart';

class GroceryController extends Cubit<GroceryStates> {
  GroceryController() : super(GroceryInitialState()){
    getItems();
  }

   List<GroceryItem> _groceryItems = <GroceryItem>[];
  List<GroceryItem> get groceryItem => List.unmodifiable(_groceryItems);
  

    void getItems(){
      if(_groceryItems.isEmpty){
        emit(GroceryEmptyState());
      }else{
        emit(GroceryListedState());
      }
    }
 
 
  void deleteItem(int index) {
    if(_groceryItems.isNotEmpty){
      _groceryItems.removeAt(index);
    }
    
  }

  void addItem(GroceryItem item) {
    _groceryItems.add(item);
  }

  void updateItem(GroceryItem item, int index) {
    _groceryItems[index] = item;
  }

  void completeItem(int index, bool change) {
    final item = _groceryItems[index];
    _groceryItems[index] = item.copyWith(isComplete: change);
  }
}
