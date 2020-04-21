import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  //const AddTransaction({Key key,this.addNewTransaction}) : super(key: key);
  AddTransaction({this.addNewTransaction});
  final Function addNewTransaction;

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final titleController = TextEditingController(); 
  final amountController = TextEditingController();

  void submitTransaction() {

    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addNewTransaction(enteredTitle, enteredAmount);

    Navigator.of(context).pop(); // Nav goBack()
  }

  @override
  Widget build(BuildContext context) {
    return
      Card(
        elevation: 5,
        child: Container(
          padding:EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              
              TextField(
                controller:titleController, //=> If you work with controllers and stateless, here the props
                decoration: InputDecoration(labelText: "Title"),
                //onChanged: (value){ titleInput = value; },// If you work with controllers, you don't have to use this props tho
                onSubmitted: (_) => submitTransaction,
              ),

              TextField(
                controller:amountController,
                decoration: InputDecoration(labelText: "Amount"),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => submitTransaction,
              ),
              
              FlatButton(
                onPressed: submitTransaction, 
                child: Text("Add")
              )

            ],
          )
        )
      );
  }
}