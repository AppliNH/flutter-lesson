import 'package:flutter/material.dart';
import 'package:learnflutter/components/BackAppbar.dart';
import 'package:learnflutter/mealsApp/models/Meal.dart';
import 'package:learnflutter/mealsApp/screens/Categories.dart';
import 'package:learnflutter/mealsApp/screens/Favorites.dart';
import 'package:learnflutter/mealsApp/widgets/MyDrawer.dart';
import 'package:learnflutter/styles/colors.dart';

class Tabs extends StatefulWidget {
  static const routeName = "/mealsapp-tabs";

  Tabs({Key key,this.favMeals}) : super(key: key);

  final List<Meal> favMeals;

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {


  List<Map<String, dynamic>> _pages;
  int _selectedPageIndex = 0;


  @override
  void initState() {
     _pages = [
      {
        'page':CategoriesScreen(),
        'title':'Categories',
        'color':Colors.blue
      },
      {
        'page':FavoritesScreen(favMeals:widget.favMeals), // here widget.blabla is available :)
        'title':'Favorites',
        'color':Colors.red
      }
    ];
    super.initState();
  }



  void _selectPage(int index) {

    setState(() {
      _selectedPageIndex = index;
    });

  }


  @override
  Widget build(BuildContext context) {
    // Top navigation :

    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar:AppBar(
    //       centerTitle: true,
    //       leading: IconButton(icon : Icon(Icons.chevron_left),onPressed: ()=>Navigator.of(context).pop(),),
    //       title: Text("Meals"),
    //       bottom:TabBar(tabs:<Widget>[
    //         Tab(icon: Icon(Icons.category), text:"Categories"),
    //         Tab(icon: Icon(Icons.star), text:"Favs")
    //       ])
    //     ),
    //     body: TabBarView(
    //       children: <Widget> [
    //         CategoriesScreen(),
    //         FavoritesScreen()

    //       ]
    //       )
    //     )

    // );
    
    

    return 
     Scaffold(
      appBar:AppBar(
        centerTitle: true,
        backgroundColor:_pages[_selectedPageIndex]["color"],
        //leading: IconButton(icon : Icon(Icons.chevron_left),onPressed: ()=>Navigator.of(context).pop(),),
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: Drawer(
        child:
          MyDrawer()
        
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.blue,
        unselectedItemColor: Theme.of(context).canvasColor,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedPageIndex,

        type:BottomNavigationBarType.shifting,
        elevation: 2.0,
        items: [

          BottomNavigationBarItem(
            backgroundColor: _pages[_selectedPageIndex]["color"], // with the type:BottomNavigationBarType.shifting setup, you gotta indicate the background color here 
            icon: Icon(Icons.category),title:Text("Categories")
          ),

          BottomNavigationBarItem(
            backgroundColor: _pages[_selectedPageIndex]["color"],
            icon: Icon(Icons.star),title: Text("Favs")
          )
          
        ],
      ),
      body: _pages[_selectedPageIndex]["page"]
      );
  }
}