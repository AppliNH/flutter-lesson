import 'package:flutter/material.dart';
import 'package:learnflutter/styles/colors.dart';

AppBar backAppBar(BuildContext context,String title) {

  return new AppBar(
  backgroundColor: Colors.blue,
  title: Text(title, style:TextStyle(color: myWhite)),
  centerTitle: true,
  leading: 
    IconButton(
      icon: Icon(Icons.keyboard_arrow_left,color:myWhite), 
      onPressed: ()=>Navigator.pop(context) // go back
    ));

  }