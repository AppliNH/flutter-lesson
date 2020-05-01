import 'package:flutter/material.dart';

import 'package:learnflutter/mealsApp/widgets/MyDrawer.dart';


class FilterScreen extends StatefulWidget {
  static const routeName = "/mealsapp_filterscreen";

  FilterScreen({Key key,this.saveFilters,this.currentFilter}) : super(key: key);

  final Function saveFilters;
  Map<String, bool> currentFilter;

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  

  @override
  void initState() { 
    _filters = widget.currentFilter;
    super.initState();
    
  }

  Map<String, bool> _filters;

  Widget _buildSwitchListTiles({String title, String subtitle,bool currentValue, String filterKey}) {
    return
      SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currentValue,
        onChanged: (value) {
          print(value);
          _updateFilterValue(filterKey,value);
          print(_filters);
        },
      );
  }

  void _updateFilterValue(String key, bool value) {
    setState(() {
      _filters[key] = value;
      
    });
  }



  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        title:Text("Filters"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save),onPressed: () {widget.saveFilters(_filters);})
        ],
      ),
      drawer: MyDrawer(),
      body: 
        Column(
          children: <Widget>[
            Container(
              padding:EdgeInsets.all(20),
              child:
                Text("Adjust your meal selection", style:TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),
                
            ),
            Expanded(
              child: 
                ListView(
                  children: <Widget>[
                    _buildSwitchListTiles(title: "Gluten-free",subtitle: "Only gluten-free meals",currentValue: _filters['gluten'],filterKey:"gluten"),
                    _buildSwitchListTiles(title: "Vegetarian",subtitle: "Only vegetarian meals",currentValue:  _filters['vegetarian'],filterKey:"vegetarian"),
                    _buildSwitchListTiles(title: "Vegan",subtitle: "Only veggie meals",currentValue:  _filters['vegan'],filterKey:"vegan"),
                    _buildSwitchListTiles(title: "Lactose-free",subtitle: "Only lactose-free meals",currentValue:  _filters['lactose'],filterKey:"lactose")
                    
                  ],
                )
            )
          ]
        )
    );
  }
}