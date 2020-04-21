import 'package:flutter/foundation.dart'; // Allows us to use @required decorator

class Transaction {

  String id;
  String title;
  double amount;
  DateTime date;

  Transaction({         // Constructor
    @required this.id,  // Mandatory property
    @required this.title,
    @required this.amount,
    @required this.date
  }); 
  // Instead of
  // Transaction(String id, String title, double amount, DateTime date) {
  //   this.id = id;
  //   this.title = title;
  //   this.amount = amount;
  //   this.date = date;
  // }

}