import 'package:flutter/material.dart';
import 'package:learnflutter/components/BackAppbar.dart';
import 'package:learnflutter/mealsApp/data/meals_data.dart';
import 'package:learnflutter/mealsApp/widgets/MealItem.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = "/mealsapp_category-meals";
  // const CategoryMeals({Key key,this.categoryName,this.categoryId,this.categoryColor}) : super(key: key);

  // final String categoryId;
  // final String categoryName;
  // final Color categoryColor;

  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, dynamic>; // <= another way of navigating
    final categoryId = routeArgs['categoryId'];
    final categoryName = routeArgs['categoryName'];
    final categoryColor = routeArgs['categoryColor'];

    final categoryMeals = DATA_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar:backAppBar(context, categoryName + " Recipes",color: categoryColor),
      body: Container(
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, i) {
            return 
              MealItem(meal: categoryMeals[i]);
          }
        )
      )
    );
  }
}