import 'package:flutter/material.dart';
import 'package:learnflutter/components/BackAppbar.dart';
import 'package:learnflutter/expensesTrackerApp/classes/Transaction.dart';
import 'package:learnflutter/expensesTrackerApp/components/AddTransaction.dart';
import 'package:learnflutter/expensesTrackerApp/components/Chart.dart';
import 'package:learnflutter/expensesTrackerApp/components/TransactionList.dart';


class HomeExpensesTracker extends StatefulWidget {
  const HomeExpensesTracker({Key key}) : super(key: key);

  @override
  _HomeExpensesTrackerState createState() => _HomeExpensesTrackerState();
}

class _HomeExpensesTrackerState extends State<HomeExpensesTracker> {
  void openAddModal(BuildContext context) {
    showModalBottomSheet(context: context, builder: (bContext) { 
      return
        GestureDetector(
          onTap: () {},
          child: AddTransaction(addNewTransaction: _addNewTransaction,),
          behavior: HitTestBehavior.opaque,
        );
    });
  }
  final List<Transaction> _transactions = [
    /*Transaction(amount: 12.51,title: "Mouse",id:"t1",date: DateTime.now()),
    Transaction(amount: 70.98,title: "Groceries",id:"t2",date: DateTime.now())*/
  ];

  void _addNewTransaction(String title, double amount) {

    final tx = new Transaction(id: DateTime.now().toString(), title: title, amount: amount, date: DateTime.now());
    setState(() {
      _transactions.add(tx);
    });

  }

  List<Transaction> get _recentTransactions { // get are dynamically generated properties :)

    return _transactions.where((transac) {
      return transac.date.isAfter(DateTime.now().subtract(Duration(days:7))); // Only transactions that are younger than 7 days are included here
    }).toList(); // .where is quite like .filter in JS

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context, "Expenses tracker"),
      floatingActionButton: 
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {openAddModal(context);},
        ),
      body: Container(
        padding:EdgeInsets.all(5),
        child:
          SingleChildScrollView(
            child: Column(// Column takes by default all available vertical space on the screen
              // Default crossAxisAlignment is .center
              // Default mainAxisAlignment is .start
              // .stretch on crossAxisAlignment will make items all have the same width or height, depending on Column/Row
              // crossAxisAlignment: CrossAxisAlignment.stretch <-- try it !
                  children: <Widget>[
                
                    Chart(recentTransactions: _recentTransactions,),
                    
                   TransactionList(transactions: _transactions,)
                
                
              ],
            )
          )
      ),

    );
  }
}