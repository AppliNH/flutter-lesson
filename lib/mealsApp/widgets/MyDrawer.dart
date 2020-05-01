import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learnflutter/mealsApp/HomeMeals.dart';
import 'package:learnflutter/mealsApp/screens/FilterScreen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  Widget _buildDrawerTile({String title,IconData icon, Function callback}) {
    return
      ListTile(
        leading: Icon(icon,size:26),
        title:Text(title,style:TextStyle(fontWeight: FontWeight.w500)),
        onTap: callback,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
  
          Container(
            margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top + 20, 0, 20),
            width:double.infinity,
            
            alignment: Alignment.center,
            child:
            Text("Cooking Up !" ,style:TextStyle(fontWeight: FontWeight.w700,fontSize: 30))
          ),
          Divider(thickness: 1,color: Colors.black,),
          // pushReplacementNamed replaces the stack with the selected screen, instead of adding it to the stack
          _buildDrawerTile(icon: Icons.restaurant, title: "Meals", callback: (){ Navigator.of(context).pushReplacementNamed(HomeMeals.routeName);}),
          _buildDrawerTile(icon: Icons.sort, title: "Filters", callback: (){ Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);}),
          _buildDrawerTile(icon: Icons.chevron_left, title: "Back to main menu", callback: (){Navigator.of(context).pushReplacementNamed("/");})


        ],
      )
    );
  }
}