import 'package:flutter/material.dart';
import 'package:learnflutter/components/BackAppbar.dart';
import 'package:learnflutter/mealsApp/screens/Categories.dart';

class HomeMeals extends StatefulWidget {
  const HomeMeals({Key key}) : super(key: key);

  @override
  _HomeMealsState createState() => _HomeMealsState();
}

class _HomeMealsState extends State<HomeMeals> {
  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        appBar: backAppBar(context, "Meals app"),
        backgroundColor: Theme.of(context).canvasColor,
        body: CategoriesScreen(),
        
      );
  }
}