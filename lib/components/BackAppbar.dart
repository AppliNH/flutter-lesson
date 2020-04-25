import 'package:flutter/material.dart';
import 'package:learnflutter/styles/colors.dart';

AppBar backAppBar(BuildContext context,String title,{Color color = Colors.blue,double elevation = 4}) { // brackets argument = uncessary at function all, and can affect a default value

  return new AppBar(
  backgroundColor: color,
  elevation: elevation,
  title: Text(title, style:TextStyle(color: myWhite)),
  centerTitle: true,
  leading: 
    IconButton(
      icon: Icon(Icons.keyboard_arrow_left,color:myWhite), 
      onPressed: ()=>Navigator.pop(context) // go back
    ));

  }