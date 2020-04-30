import 'package:flutter/material.dart';
import 'package:learnflutter/components/BackAppbar.dart';
import 'package:learnflutter/expensesTrackerApp/adlib/landscapeBool.dart';
import 'package:learnflutter/expensesTrackerApp/classes/Transaction.dart';
import 'package:learnflutter/expensesTrackerApp/components/AddTransaction.dart';
import 'package:learnflutter/expensesTrackerApp/components/Chart.dart';
import 'package:learnflutter/expensesTrackerApp/components/TransactionList.dart';
import 'package:learnflutter/styles/colors.dart';



class HomeExpensesTracker extends StatefulWidget {
  const HomeExpensesTracker({Key key}) : super(key: key);

  @override
  _HomeExpensesTrackerState createState() => _HomeExpensesTrackerState();
}

class _HomeExpensesTrackerState extends State<HomeExpensesTracker> {

  // VARS
  bool _displayChartLandscape = false;
  
  final List<Transaction> _transactions = [
    // Transaction(amount: 12.51,title: "Mouse",id:"t1",date: DateTime.now()),
    // Transaction(amount: 70.98,title: "Groceries",id:"t2",date: DateTime.now()),
    // Transaction(amount: 12.51,title: "Mouse",id:"t3",date: DateTime.now()),
    // Transaction(amount: 70.98,title: "Groceries",id:"t4",date: DateTime.now()),
    // Transaction(amount: 12.51,title: "Mouse",id:"t5",date: DateTime.now()),
    // Transaction(amount: 70.98,title: "Groceries",id:"t6",date: DateTime.now()),
    // Transaction(amount: 12.51,title: "Mouse",id:"t7",date: DateTime.now()),
    // Transaction(amount: 70.98,title: "Groceries",id:"t8",date: DateTime.now()),
    // Transaction(amount: 12.51,title: "Mouse",id:"t9",date: DateTime.now()),
    // Transaction(amount: 70.98,title: "Groceries",id:"t10",date: DateTime.now()),
    // Transaction(amount: 12.51,title: "Mouse",id:"t11",date: DateTime.now()),
    // Transaction(amount: 70.98,title: "Groceries",id:"t12",date: DateTime.now()),
    // Transaction(amount: 12.51,title: "Mouse",id:"t13",date: DateTime.now()),
    // Transaction(amount: 70.98,title: "Groceries",id:"t4",date: DateTime.now()),
  ];

  // FUNCTIONS
  void openAddModal(BuildContext context) {
    showModalBottomSheet(backgroundColor: Colors.transparent,context: context, builder: (bContext) { 
      return
        GestureDetector(
          onTap: () {},
          child: AddTransaction(addNewTransaction: _addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
    });
  }

  void _addNewTransaction(String title, double amount, DateTime date ) {

    final tx = new Transaction(id: DateTime.now().toString(), title: title, amount: amount, date:date);

    setState(() {
      _transactions.add(tx);
    });

  }

  void _deleteTransaction(String id) {

    setState(() {
      _transactions.removeWhere((transac)=> transac.id == id);
    });
    

  }
  

  List<Transaction> get _recentTransactions { // get are dynamically generated properties :)

    return _transactions.where((transac) {
      return transac.date.isAfter(DateTime.now().subtract(Duration(days:7))); // Only transactions that are younger than 7 days are included here
    }).toList(); // .where is quite like .filter in JS

  }

 
  @override
  Widget build(BuildContext context) {
    
    final theAppBar = backAppBar(context, "Expenses tracker");
    final usableHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - theAppBar.preferredSize.height;

    return Scaffold(
      appBar: theAppBar,
      backgroundColor: myWhite,
      floatingActionButton: 
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {openAddModal(context);},
        ),
      body: Container(
        //padding:EdgeInsets.all(5),
        child:
          SingleChildScrollView(
            child: Column(// Column takes by default all available vertical space on the screen
              // Default crossAxisAlignment is .center
              // Default mainAxisAlignment is .start
              // .stretch on crossAxisAlignment will make items all have the same width or height, depending on Column/Row
              // crossAxisAlignment: CrossAxisAlignment.stretch <-- try it !
                  children: <Widget>[

                    isLandscape(context) ?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Show Chart"),
                          Switch.adaptive( // .adaptive adapts the look of the widget based on the platform. Here, on iOS, you'll have the iOS cupertino switch
                            value: _displayChartLandscape,
                            onChanged: (value) => setState(() {_displayChartLandscape = value;}),
                          )
                        ]
                      )
                    : 
                      Container(),

                    _displayChartLandscape || !isLandscape(context) ?
                      Container(
                        height:usableHeight * (isLandscape(context) ? 0.7 : 0.25 ),
                        child: Chart(recentTransactions: _recentTransactions,)
                      )
                    : 
                    Container(),

                    
                    
                    Container(
                      height:usableHeight * 0.75 ,
                      child: TransactionList(transactions: _transactions,deleteTransaction:_deleteTransaction)
                    )
                
                
              ],
            )
          )
      ),

    );
  }
}