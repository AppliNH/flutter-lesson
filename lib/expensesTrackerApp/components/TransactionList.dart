import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learnflutter/expensesTrackerApp/classes/Transaction.dart';

Widget noTransactions() {
  return Container(
    margin:EdgeInsets.only(top:20),
    child: Column(
      children: <Widget>[
        Icon(Icons.close,color:Colors.grey,size:50),
        Text("No transactions here... \n Add some !",textAlign: TextAlign.center,style:TextStyle(color: Colors.grey,fontSize: 20))
        
      ],
    ),
  );
}

class TransactionList extends StatelessWidget {
  const TransactionList({Key key,this.transactions}) : super(key: key);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      height:400,
      // SingleChildScrollView widget needs to know the parent height, so wrap it in a container like so
      child: transactions.length == 0 ? noTransactions() : ListView.builder( 
          // ListView  == column (or row) + SingleChildScrollView +=> ListView (widget) will load all widgets even those offscreen, which for a large list is quite costful
          // ListView has an infinite height. That's why you most of the time gotta wrap it in a container which defines the height
          itemBuilder: (context,index) {
            
            return
              Card(
                  elevation: 5,
                  child:Container(                    
                    padding:EdgeInsets.all(5),
                    child:Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                          decoration: BoxDecoration(border: Border.all(width: 2),borderRadius: BorderRadius.circular(5)),
                          padding:EdgeInsets.all(10),
                          child: Text(transactions[index].amount.toStringAsFixed(2)+" €", // toStringAsFixed allows us to force having 2 decimals, using round
                                  style:TextStyle(fontSize: 18,fontWeight: FontWeight.w700))
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(transactions[index].title,style:TextStyle(fontWeight: FontWeight.w500,fontSize: 16)),
                            Text(DateFormat("MMMM dd · yyyy").format(transactions[index].date),
                                  style:TextStyle(color:Colors.grey)),
                          ],
                        )
                        
                      ],
                    )
                  )
                );

          },
          itemCount: transactions.length,
      )
    );
  }
}