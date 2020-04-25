import 'package:flutter/material.dart';
import 'package:learnflutter/mealsApp/data/categories_data.dart';
import 'package:learnflutter/mealsApp/widgets/CategoryItem.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      GridView(
        padding:EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, childAspectRatio: 3/2, crossAxisSpacing: 20, mainAxisSpacing: 20),
          children: 
          DATA_CATEGORIES.map<Widget>((category) => CategoryItem( color: category.color, title:category.title, id: category.id )).toList()
      );
  }
}