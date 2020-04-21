import "package:flutter/material.dart";

class Question extends StatelessWidget {

  const Question({Key key,this.question}) : super(key: key);
  final String question;

  @override
  Widget build(BuildContext context) {
    // Note that Flutter will only allocate to the widget as much as it NEEDS
    return 
    Container(
      width: double.infinity, //allows the container to take as much space as it can
      margin: EdgeInsets.fromLTRB(0,10,0,5),
      child: Text(this.question,
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),
        textAlign: TextAlign.center,)
    );

  }
}