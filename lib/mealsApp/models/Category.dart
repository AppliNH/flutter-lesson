import 'package:flutter/material.dart';

class Category {

  final String id;
  final String title;
  final Color color;

  const Category({@required this.id, @required this.title, @required this.color});
  // setting const here means that the properties of the object can't be changed after being initialized.

}