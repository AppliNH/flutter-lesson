import 'package:flutter/material.dart';
import 'package:learnflutter/mealsApp/screens/Tabs.dart';

class HomeMeals extends StatefulWidget {
  static const routeName = "/mealsapp_-home";
  const HomeMeals({Key key}) : super(key: key);

  @override
  _HomeMealsState createState() => _HomeMealsState();
}

class _HomeMealsState extends State<HomeMeals> {
  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        //appBar: backAppBar(context, "Meals app"),
        backgroundColor: Theme.of(context).canvasColor,
        body: Tabs(),
        
      );
  }
}