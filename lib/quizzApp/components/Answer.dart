import 'package:flutter/material.dart';
import 'package:learnflutter/styles/colors.dart';

class Answer extends StatelessWidget {
  const Answer({Key key,this.name,this.callback}) : super(key: key);

  final String name;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      child: 
        RaisedButton(
          color:Colors.blue,
          onPressed: this.callback,
          child: Text(this.name,style:TextStyle(color:myWhite)) 
        ),
    );
  }
}