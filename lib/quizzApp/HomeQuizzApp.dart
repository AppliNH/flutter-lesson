import "package:flutter/material.dart";
import 'package:learnflutter/components/BackAppbar.dart';
import 'package:learnflutter/quizzApp/Quizz.dart';
import 'package:learnflutter/quizzApp/Result.dart';


class HomeQuizzApp extends StatefulWidget {
  HomeQuizzApp({Key key}) : super(key: key);

  @override
  _HomeQuizzAppState createState() => _HomeQuizzAppState();
}

class _HomeQuizzAppState extends State<HomeQuizzApp> { // The _ in front of _HomeQuizzAppState makes it private. You can also use this for functions and variables
  
  var _qIndex = 0; // Private var, thanks to the _ in front of it.
  var finishedQuizz = false;

  List<Map<String,dynamic>> _questionsNAnswers = const [ // Use "final" if a value doesn't change from the point of time when your program runs. They can change initially, but doesn't change after
    {"q":"What's your favorite color ?","a":["Blue","Red","Green","Bordeaux","None of these"]},
    {"q":"What's your favorite animal ?","a":["Turtle","Dog","Cat","Siberian Tiger","None of these"] }
    ];

  List _results = [];

  // "final" is a **runtime** constant value
  // "const" is a compile-time constant value
  


  void _answerQuestion(int i) {
    print("Answer chosen");
    print(i);
    Map<String, dynamic> map = {};
      map["q"] = _questionsNAnswers[_qIndex]["q"];
      map["a"] = _questionsNAnswers[_qIndex]["a"][i];

      setState(() {
        _results.add(map);
      });

    if (_qIndex < _questionsNAnswers.length - 1) {
      setState(() {
        _qIndex++;
      });

    } else {
      setState(() {
        finishedQuizz= true;
      });
    }

  }

  void resetQuizz() {
    setState(() {
      _results.clear();
      finishedQuizz = false;
      _qIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: backAppBar(context, "Quizz app"),
        body: Container(
            padding: EdgeInsets.all(5),
            child: 
                finishedQuizz ? 
                Result(results: _results) 
                :
                Quizz(questionsNAnswers: _questionsNAnswers,answerQuestion:_answerQuestion,questionIndex: _qIndex,resetQuizz:resetQuizz)
            ));
  }
}
