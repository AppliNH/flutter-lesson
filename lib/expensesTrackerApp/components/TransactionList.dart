import 'package:flutter/material.dart';

import 'package:learnflutter/expensesTrackerApp/classes/Transaction.dart';
import 'package:learnflutter/expensesTrackerApp/components/TransactionItem.dart';


Widget noTransactions() {
  return Container(
    margin:EdgeInsets.only(top:20),
    child: Column(
      children: <Widget>[
        Text("🙅‍♂️",style:TextStyle(fontSize: 30)),
        //Icon(Icons.close,color:Colors.grey,size:50),
        Text("No transactions here... \n Add some !",textAlign: TextAlign.center,style:TextStyle(color: Colors.grey,fontSize: 20))
        
      ],
    ),
  );
}

class TransactionList extends StatelessWidget {
  const TransactionList({Key key,this.transactions,this.deleteTransaction}) : super(key: key);

  final List<Transaction> transactions;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      // SingleChildScrollView widget needs to know the parent height, so wrap it in a container like so
      // ListView  == column (or row) + SingleChildScrollView +=> ListView (widget) will load all widgets even those offscreen, which for a large list is quite costful
      // ListView has an infinite height. That's why you most of the time gotta wrap it in a container which defines the height
      child: transactions.length == 0 ? noTransactions() 
      : 
        // ListView.builder( 
        //     itemBuilder: (context,index) {            
        //       return
        //         TransactionItem(transaction: transactions[index], deleteTransaction: deleteTransaction);
        //     },
        //     itemCount: transactions.length,
        // )
        ListView(
          children:
            // You need a key if your widget is stateful and is the topmost item in a list or in situations where the wrong state get attached to your element.
            // Keys are used to help flutter link elements from element tree and widget correctly
            // If you don't use keys, Flutter will match element and widget by widget's type
            // So it's useful with stateful widgets because state objects are attached to the element, not the widget
            // You can use 
              // UniqueKey(), but not really that great if it rebuilds constantly (like in this case, child is in a Listview which rebuilds when an item is added)
              // ValueKey("id") uses a custom id <= this one is good :)
            // Use keys with stateful children of a ListView
            transactions.map<Widget>((transac) => TransactionItem(key: ValueKey(transac.id),transaction: transac, deleteTransaction: deleteTransaction)).toList()
        )
    );
  }
}

