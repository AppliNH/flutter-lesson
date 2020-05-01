import 'package:flutter/widgets.dart';
import "package:flutter/material.dart";


class CardOne extends StatelessWidget {
  CardOne({this.title,this.nav,this.src});
  final String title;
  final String nav;
  final String src;

  
  @override
  Widget build(BuildContext context) {
    return new 
    Container(
     
      child: InkWell(
          onTap: nav != null ? () => Navigator.pushNamed(context,nav) : ()=> print("no navig"),
          borderRadius: BorderRadius.circular(5),
          child: Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: NetworkImage(this.src), fit: BoxFit.cover)
              ),
              child: Container(
                  decoration: BoxDecoration(color:Color.fromRGBO(0, 0, 0, 0.25),borderRadius: BorderRadius.circular(5)),
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                                child: Text(this.title,
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700))),
                            Container(
                                child: Icon(Icons.arrow_forward_ios,
                                    color: Colors.white, size: 14))
                          ]))),
            ),
          ))
    );
  }
}
