import 'package:flutter/material.dart';
import 'package:learnflutter/mealsApp/models/Meal.dart';
import 'package:learnflutter/mealsApp/widgets/MealItem.dart';

class FavoritesScreen extends StatefulWidget {

  
  const FavoritesScreen({Key key,this.favMeals}) : super(key: key);

  final List<Meal> favMeals;

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
      if(widget.favMeals.length == 0) {
        return 
          Center(
            child:Text("No favs here :(")
          );
      }
      return 
        Scaffold(
          body:
            Container(
              child: ListView.builder(
                itemCount: widget.favMeals?.length,
                itemBuilder: (ctx, i) {
                  return 
                    MealItem(meal: widget.favMeals[i]);
                }
              )
            )
        );
    
  }
}