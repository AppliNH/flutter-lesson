import 'package:flutter/material.dart';
import 'package:learnflutter/mealsApp/models/Meal.dart';
import 'package:learnflutter/mealsApp/screens/MealDetails.dart';
import 'package:learnflutter/styles/colors.dart';

class MealItem extends StatelessWidget {
  const MealItem({Key key,this.meal}) : super(key: key);

  final Meal meal;

  void selectMeal(BuildContext ctx) {

    Navigator.of(ctx).pushNamed(
      MealDetails.routeName,
      arguments: {
        'meal':meal
      }
    );

  }


  String get complexityText {

    switch (meal.complexity) {

      case Complexity.Simple:
        return "Simple";
        //break;

      case Complexity.Challenging:
        return "Challenging";
      

      case Complexity.Hard:
        return "Hard";
 
    }

  }

  String get affordabilityText {

    switch (meal.affordability) {
      case Affordability.Affordable:
        return "Affordable";

      case Affordability.Pricey:
        return "Pricey";

      case Affordability.Luxurious:
        return "Luxurious";

    }



  }

  @override
  Widget build(BuildContext context) {
    return 
      InkWell(
        onTap: ()=> selectMeal(context),
        child: Card(
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          margin:EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Stack( // Stack allows to superpose widgets
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                    child: Image.network(meal.imageUrl,height: 250, width: double.infinity, fit:BoxFit.cover)
                  ),
                  Positioned( // Positioned allows to position the child widget in a very specific space
                    right:0,
                    bottom:20,
                    child: Container(
                      width:320,
                      color:Colors.black54,
                      padding:EdgeInsets.symmetric(vertical:5,horizontal: 20),
                      child: Text(
                        meal.title,
                        style: TextStyle(color:myWhite,fontSize: 28),
                        softWrap: true,overflow: TextOverflow.fade,),
                    )
                  )
                ]),
              Padding(
                padding:EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children :<Widget>[
                        Icon(Icons.schedule),
                        SizedBox(width: 6),
                        Text(meal.duration.toString() +" min")
                      ]),
                    Row(
                      children :<Widget>[
                        Icon(Icons.work),
                        SizedBox(width: 6),
                        Text(complexityText)
                      ]),
                    Row(
                      children :<Widget>[
                        Icon(Icons.monetization_on),
                        SizedBox(width: 6),
                        Text(affordabilityText)
                      ]),
                  ],
                )
              )

            ]
          )

        )
      );
  }
}