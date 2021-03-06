import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:learnflutter/components/BackAppbar.dart';
import 'package:learnflutter/mealsApp/data/meals_data.dart';
import 'package:learnflutter/mealsApp/models/Meal.dart';
import 'package:learnflutter/styles/colors.dart';

class MealDetails extends StatelessWidget {
  static const routeName = "/mealsapp_meals-details";

  const MealDetails({Key key,this.toggleFavorite,this.isMealFav}) : super(key: key);

  final Function toggleFavorite;
  final Function isMealFav;

  Widget buildSectionTitle(String text) {
    return
    Container(
      margin: EdgeInsets.symmetric(vertical:10),
      child:Text(text,style:TextStyle(fontWeight: FontWeight.w500,fontSize: 20))
    );
  }

  Widget buildContainer(Widget child) {
    return
      Container(
        decoration: BoxDecoration(color:myWhite, border:Border.all(color:Colors.grey),borderRadius: BorderRadius.circular(10)),
        padding:EdgeInsets.all(5),
        height:150,
        width:300,
        child:
          child
      );

  }

  

  Widget fabDelete(BuildContext context, String mealId) {
    return
    FloatingActionButton(
      child: Icon(Icons.delete),
      onPressed: () {
        Navigator.of(context).pop(mealId); // Nav back and passes data "meal.id" to prev screen

      },
    );
  }

  Widget fabFav(BuildContext context, String mealId) {
    //bool is_MealFav = isMealFav(mealId);
    //print(isMealFav(mealId));
    return
    FloatingActionButton(
      child: isMealFav(mealId) ? Icon(Icons.star) : Icon(Icons.star_border),
      onPressed: () {toggleFavorite(mealId);},
    );
  }

  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, Meal>;
    final meal = routeArgs['meal'];

    // final selectedMeal = DATA_MEALS.firstWhere((meal) => meal.id == meal.id);
  
    return 
      Scaffold(
        floatingActionButton: 
          fabFav(context, meal.id),
        appBar: backAppBar(context, meal.title, color:Color.fromRGBO(0, 0, 0, 0.01)),
        body: 
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                
                Container(
                  height:300,
                  width: double.infinity,
                  child: Image.network(meal.imageUrl,fit:BoxFit.cover),
                ),

                  buildSectionTitle("Ingredients"),
                  buildContainer(
                    ListView.builder(
                      itemCount: meal.ingredients.length,
                      itemBuilder: (ctx, i) => Card(color: Colors.amber,child:Padding(padding:EdgeInsets.all(5),child: Text(meal.ingredients[i])))
                    )
                  ),
                  buildSectionTitle("Steps"),
                  
                  buildContainer(
                  ListView.builder(
                    itemCount: meal.steps.length,
                    itemBuilder: (ctx, i) => 
                    Column(
                      children:<Widget>[ 
                        
                        ListTile(
                        leading: CircleAvatar(child: Text((i+1).toString())),
                        title:Text(meal.steps[i]),
                        ),
                        Divider()

                    ]
                    )
                  )
                )
                ]
            )
          )
      );
  }
}