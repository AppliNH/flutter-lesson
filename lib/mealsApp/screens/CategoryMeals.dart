import 'package:flutter/material.dart';
import 'package:learnflutter/components/BackAppbar.dart';
import 'package:learnflutter/mealsApp/data/meals_data.dart';
import 'package:learnflutter/mealsApp/models/Meal.dart';
import 'package:learnflutter/mealsApp/widgets/MealItem.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = "/mealsapp_category-meals";
  CategoryMeals({this.availableMeals});

  List<Meal> availableMeals;
  

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {

  String categoryName;
  Color categoryColor;
  List<Meal> categoryMeals;

  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if(!_loadedInitData) {
      final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, dynamic>; // <= another way of navigating
      final categoryId = routeArgs['categoryId'];
      
      categoryName = routeArgs['categoryName'];
      categoryColor = routeArgs['categoryColor'];

      categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    });

  }

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      appBar:backAppBar(context, categoryName + " Recipes",color: categoryColor),
      body: Container(
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, i) {
            return 
              MealItem(meal: categoryMeals[i],removeMeal:_removeMeal);
          }
        )
      )
    );
  }
}