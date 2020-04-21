import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learnflutter/expensesTrackerApp/adlib/compareDates.dart';
import 'package:learnflutter/expensesTrackerApp/classes/Transaction.dart';
import 'package:learnflutter/expensesTrackerApp/components/chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({Key key,this.recentTransactions}) : super(key: key);
  
  final List<Transaction> recentTransactions;

  List<Map<String,Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      print("index:" +index.toString());
      final weekDay = DateTime.now().subtract(Duration(days: index));
      print(DateFormat.E().format(weekDay));
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if(compareDatesDMY(recentTransactions[i].date, weekDay)) {
          totalSum += recentTransactions[i].amount;
        } 
      }
      print("totalSum : "+totalSum.toString());
      return {"day":DateFormat.E().format(weekDay).substring(0,1),"amount":totalSum}; // DateFormat.E().format(weekDay) gives us the key of the day

    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold( /*STARTING VALUE */ 0.0,(sum,item) {
      return sum + item['amount']; // for every item in the List, we make a sum
      // at the beginnig, "sum" = the starting value which here is 0.0
    }); // fold allows to change a list to another type with a certain logic
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Container(
      margin:EdgeInsets.all(10),
      child: 
        Card(
          elevation: 5.0,
          child:Container( // You can also wrap the card with a container.. But I don't like it, because I like to add padding to my card content. 
            padding:EdgeInsets.all(10), //Which can be done if Container is the child :)
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: 
                groupedTransactionValues.map((data) {
                  return 
                    Flexible(
                      fit: FlexFit.tight, // The child is forced to fill the available space, without squeezing other items out of the screen. And here, each item should have the same space
                      child: ChartBar(spendingAmount: data["amount"], label:data["day"], spendingPrcentage: totalSpending != 0 ? (data["amount"] as double )/totalSpending : 0)
                    );
                }).toList()
              
            )
          )
        ),
    );
  }
}