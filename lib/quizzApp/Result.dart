import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({Key key,this.results}) : super(key: key);

  final List<dynamic> results;

  String get resultPhrase { // "get" makes it usable for our Text widget
    var resultText = "You did it ! Quizz is over !";
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      child: Column(
        children:<Widget>[
        Container(
          child: 
            Text(resultPhrase, // here
              textAlign: TextAlign.center,
              style:TextStyle(fontWeight: FontWeight.w700,fontSize: 20))
        ),

        
          Container(
            margin: EdgeInsets.only(top: 15),
            width: double.infinity,
            child: 
            (this.results.length > 0 ?
              Column(children: 
                (results).map<Widget>((result) => 

                  Container(
                    padding:EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Text(result["q"].toString() +" : "+result["a"].toString(),
                        textAlign: TextAlign.center,
                        style:TextStyle(fontSize: 20)
                    )
                  )
                  ).toList()
              )
             : Text("Something went wrong..")
            )

            
          )
        
      
        

      ])
    );
  }
}