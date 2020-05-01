import 'package:flutter/material.dart';
import 'package:learnflutter/mealsApp/data/meals_data.dart';
import 'package:learnflutter/mealsApp/models/Meal.dart';
import 'package:learnflutter/mealsApp/screens/Tabs.dart';

class HomeMeals extends StatefulWidget {
  static const routeName = "/mealsapp_home"; 

  const HomeMeals({Key key,this.favMeals}) : super(key: key);

  final List<Meal> favMeals;

  @override
  _HomeMealsState createState() => _HomeMealsState(); 
}

class _HomeMealsState extends State<HomeMeals> {

  @override
  Widget build(BuildContext context) {
    print("build : " + widget.favMeals.toString());
    return 
      Scaffold(
        //appBar: backAppBar(context, "Meals app"),
        backgroundColor: Theme.of(context).canvasColor,
        body: Tabs(favMeals:widget.favMeals),
        
      );
  }
}