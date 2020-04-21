import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({Key key,this.label,this.spendingAmount,this.spendingPrcentage}) : super(key: key);

  final String label;
  final double spendingAmount;
  final double spendingPrcentage;

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: <Widget>[
          FittedBox( // Forces its child into the available space

            child: Text(spendingAmount.toStringAsFixed(0)+"€")
          ),
          SizedBox(height:4),
          Container(
            height:60,
            width:10,
            child: Stack(
              children: <Widget>[

                Container(
                  decoration: BoxDecoration(
                    border:Border.all(color:Colors.grey,width:1),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  )
                ),

                FractionallySizedBox(heightFactor: spendingPrcentage,
                  child: 
                    Container(decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10))
                    )
                )


              ]
            )
          ),
          SizedBox(height:4),
          Text(label)
        ],
      );
  }
}