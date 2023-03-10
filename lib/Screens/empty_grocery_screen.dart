import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class empty_grocery_screen extends StatelessWidget {
  const empty_grocery_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(onPressed: (() {
        
      }), child:const  Icon(Icons.add)) ,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        // 2
        child: Center(
          // 3
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child:
                        Image.asset('assets/fooderlich_assets/empty_list.png')),
              ),
              Text(
                'No Groceries',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Shopping for ingredients?\n'
                'Tap the + button to write them down!',
                textAlign: TextAlign.center,
              ),
              MaterialButton(
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.green,
                onPressed: () {
                  // TODO: Go to Recipes Tab
                },
                child: const Text('Browse Recipes'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
