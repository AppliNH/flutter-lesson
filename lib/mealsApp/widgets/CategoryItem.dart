import 'package:flutter/material.dart';
import 'package:learnflutter/mealsApp/screens/CategoryMeals.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key key,this.title,this.color,this.id}) : super(key: key);

  final String title;
  final Color color;
  final String id;

  void selectCategory(BuildContext context) {
    // You can navigate using this :
    
    // Navigator.of(context).push( MaterialPageRoute(builder: (context) => CategoryMeals(categoryName: title,categoryId: id,categoryColor: color, ) ));
    
    // or this (which will be better in a bigger apps)

    // Navigator.of(context).pushNamed( 
    //   "/mealsapp_category-meals",
    //   arguments: {
    //     'categoryName':title,
    //     'categoryId':id,
    //     'categoryColor':color
    //   }
    // );

    // You can also go for this if you set static const routeName = "/mealsapp_category-meals"; on CategoryMeals.dart
    // I prefer this approach

    Navigator.of(context).pushNamed( 
      CategoryMeals.routeName,
      arguments: {
        'categoryName':title,
        'categoryId':id,
        'categoryColor':color
      }
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return
     InkWell(
       onTap:()=> selectCategory(context),
       borderRadius: BorderRadius.circular(15),
       child: Container(
         padding: const EdgeInsets.all(15),
         decoration: BoxDecoration(
           gradient: LinearGradient(
             colors: [
               color.withOpacity(0.7),
               color
             ],
             begin: Alignment.topLeft,
             end: Alignment.bottomRight
           ),
           borderRadius: BorderRadius.circular(15)
         ),
         child: Center(
           child: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500))
         ),
         
       )
     );

  }
}