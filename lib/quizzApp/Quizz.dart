import 'package:flutter/material.dart';

import 'components/Answer.dart';
import 'components/Question.dart';

class Quizz extends StatelessWidget {
  const Quizz({Key key,this.questionsNAnswers,this.answerQuestion,this.questionIndex,this.resetQuizz}) : super(key: key);
  final int questionIndex;
  final List<Map<String,dynamic>> questionsNAnswers;
  final Function answerQuestion;
  final Function resetQuizz;
  

  @override
  Widget build(BuildContext context) {
    return Column(
                  children: <Widget>[
                    Container(
                      child:Text(this.questionIndex.toString()+"/"+(this.questionsNAnswers.length-1).toString())
                    ),
                    
                    Question(question : questionsNAnswers[questionIndex]["q"]),


                    Column(
                      children: (questionsNAnswers[questionIndex]["a"] as List<String>).map((answer){
                        int idx = questionsNAnswers[questionIndex]["a"].indexOf(answer);
                        return Answer(name: answer,callback:()=>Function.apply(answerQuestion, [idx]));
                        }
                      ).toList()
                    ),

                    InkWell(
                      onTap: resetQuizz,
                      child: Container(
                        //width:double.infinity,
                        child: 
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[ 
                            Icon(Icons.restore_page,color:Colors.blue), 
                            Text("Reset the quizz"),
                          ]
                        )
                      )
                    )

                    // or

                    // ...(questionsNAnswers[questionIndex]["a"] as List<String>).map((answer){
                    //   int idx = questionsNAnswers[questionIndex]["a"].indexOf(answer);
                    //   return Answer(name: answer,callback:()=>Function.apply(answerQuestion, [idx]));
                    //   }
                    // ).toList()
      
                    
  
                
              ]);
  }
}