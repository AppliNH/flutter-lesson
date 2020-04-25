import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learnflutter/styles/colors.dart';

class AddTransaction extends StatefulWidget {
  //const AddTransaction({Key key,this.addNewTransaction}) : super(key: key);
  AddTransaction({this.addNewTransaction});
  final Function addNewTransaction;

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  // Changing a final will call build method, so the widget will re-render with new configuration
  final titleController = TextEditingController(); 
  final amountController = TextEditingController();

  DateTime selectedDate;

  void submitTransaction() {

    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    final enteredDate = selectedDate;
    print(enteredDate);

    if(enteredTitle.isEmpty || enteredAmount <= 0 || enteredDate == null) {

      return;
    }
    print("ok");
    widget.addNewTransaction(enteredTitle, enteredAmount,enteredDate);

    Navigator.of(context).pop(); // Nav goBack()
  }


  void _showTheDatePicker() {

    showDatePicker( // This is a built-in Future method. A future is like a promise in JS :)
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2020), 
      lastDate: DateTime.now()
    ).then((date) {
      if(date != null ) {

        setState(() {
          selectedDate = date;
        });

      } else { return; }

    });

  }

  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        child: Card(
          elevation: 5,
          child: Container(
            padding:EdgeInsets.only(top:10,left:10,right:10,bottom:MediaQuery.of(context).viewInsets.bottom + 10), //MediaQuery.of(context).viewInsets.bottom detects negative space at bottom => when keyboard is out !
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
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
                
                Container(
                  height:90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        Text( selectedDate != null ? DateFormat("MMMM dd · yyyy").format(selectedDate):"No date choosen",style:TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),
                       IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: _showTheDatePicker,
                        icon: Icon(Icons.date_range,color:Colors.blue,size:32)
                      ),
                      
                    ],
                  )
                ),
                  CupertinoButton( // iOS style button cuz I wanna try it
                  color:Colors.blue,
                  padding: EdgeInsets.all(10),
                  onPressed: submitTransaction, 
                    child: Text("Add the expense",style:TextStyle(color:myWhite))
                )
                ],
            )
          )
        )
      );
  }
}