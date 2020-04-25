import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learnflutter/expensesTrackerApp/classes/Transaction.dart';
import 'package:learnflutter/styles/colors.dart';

class TransactionItem extends StatefulWidget { // Here TransactionItem doesn't need to be a StatefulWidget, but it serves the "Key" lesson in TransactionList.dart file
  const TransactionItem({Key key, this.transaction,this.deleteTransaction}) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {

  Color _bgColor;


  @override
  void initState() {
    const availableColors = [Colors.red,Colors.purple,Colors.amber,Colors.green];
    _bgColor = availableColors[Random().nextInt(availableColors.length - 1)];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:2,
      margin: EdgeInsets.symmetric(vertical:8,horizontal:5),

      child: ListTile( // <= this is cool
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Container(
            padding:EdgeInsets.all(5),
            child: FittedBox(
              child: Text(widget.transaction.amount.toStringAsFixed(2)+" €",style:TextStyle(color: myWhite))
            )
          )
        ),
        title: Text(widget.transaction.title, style:TextStyle(fontWeight: FontWeight.w500)), // this has a dynamic property so you can't declare it as const
        subtitle: Text(DateFormat("MMMM dd · yyyy").format(widget.transaction.date), style:TextStyle(color:Colors.grey)),

        trailing: MediaQuery.of(context).size.width > 460 ? 
                    FlatButton.icon(
                      color:Colors.red,
                      onPressed: ()=> widget.deleteTransaction(widget.transaction.id),
                      icon: const Icon(Icons.delete,color:myWhite),
                      label: const Text("Delete",style:TextStyle(color: myWhite)) // This hasn't dynamic properties so you can declare the widget as const :)
                    ) 
                    :
                    IconButton(icon: Icon(Icons.delete, color:Colors.red,size:30), 

        onPressed: ()=> widget.deleteTransaction(widget.transaction.id)),
      )

    );
  }
}