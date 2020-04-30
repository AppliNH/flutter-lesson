import "package:flutter/material.dart";

import 'package:learnflutter/components/CardOne.dart';
import 'package:learnflutter/expensesTrackerApp/HomeExpensesTracker.dart';
import 'package:learnflutter/mealsApp/HomeMeals.dart';
import 'package:learnflutter/mealsApp/screens/CategoryMeals.dart';
import 'package:learnflutter/mealsApp/screens/MealDetails.dart';
import 'package:learnflutter/quizzApp/HomeQuizzApp.dart';
import 'package:learnflutter/styles/colors.dart';
import 'package:learnflutter/styles/themes.dart';

void main(){
  // WidgetsFlutterBinding.ensureInitialized(); // This is mandatory to force portrait mode
  // SystemChrome.setPreferredOrientations([// <= You can use this to force disable the possibility of landscape mode for the app
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown
  // ]); 
  runApp(new MyLearningApp());

}

class MyLearningApp extends StatelessWidget {

  final darkThemeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My Flutter learning app",
      debugShowCheckedModeBanner: false,
      theme: darkThemeEnabled ? darkTheme : lightTheme,
      home: new Home(), // Starting point of the app
      routes: {
        // home has a default route which is "/"
        //'/mealsapp_category-meals':(ctx) => CategoryMeals()

        // or (better imo) :
        CategoryMeals.routeName : (ctx) => CategoryMeals(), // look at the static property of the widget
        MealDetails.routeName : (ctx) => MealDetails(),
        HomeMeals.routeName: (ctx) => HomeMeals()
      },

      // onGenerateRoute: (settings) { // Executed to a named route, with pushNamed which is not registered in routes : {} up there
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx) => HomeMeals());
      // },

      //onUnknownRoute: (settings) {} , // when flutter fails to navigate (bcuz of u lol)
    );
  }
}

class Home extends StatefulWidget {

  

  @override
  State<StatefulWidget> createState() {
    return new _Home();
  }
}

final AppBar appBar = new AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: Text("Learning App",style:TextStyle(color:myWhite)),
        leading: IconButton(
          icon: Icon(Icons.brightness_2,color:myWhite),
          onPressed: (){/*TODO : Implement light/Dark theme change*/ },
          )
        );

class _Home extends State<Home> with WidgetsBindingObserver{

  // Widget Lifecycle :
      // Stateless widgets : Constructor => build()
      // Stateful widgets : Constructor => initState() => build() => setState() => didUpdateWidget() => build() => dispose()

  // @override
  // void initState() {
  //   blabla
  //   super.initState();
  // }

  // @override
  // void didUpdateWidget(Home oldWidget) {
  //   blabla
  //   super.didUpdateWidget(oldWidget);  
  // }

  // @override
  // void dispose() {
  //   blabla
  //   super.dispose();
  // }

  // App Lifecycle : (=> "with WidgetsBindingObserver" up there)
      // inactive
      // paused (running in background but not visible to user)
      // resumed
      // suspending

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   blabla
  //   super.didChangeAppLifecycleState(state);  
  // }

  // AND YOU'LL NEED THIS

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addObserver(this);
  //   super.initState();
  // }
  // @override
  // void dispose() {
  //   WidgetsBinding.instance.removeObserver(this);
  //   super.dispose();
  // }

  // What's context ?
    // every widget has a context.
    // It's about meta information on the widget and its location in the widget tree
    // You can also use it to share data between widgets

  @override
  Widget build(BuildContext context) {

    // Use this to get current height if using SafeArea
    // var safePaddingTop = MediaQuery.of(context).padding.top;
    // var safePaddingBottom = MediaQuery.of(context).padding.bottom;
    // var appBarHeight = appBar.preferredSize.height;
    //

    return new Scaffold(
      appBar: appBar,
      backgroundColor: Theme.of(context).backgroundColor,
      body: // <= Widget Tree manages widget configuration ( color, margin, etc), and rebuilds when needed
      // The element tree is that what link widgets with rendered orbjects, which rarely rebuilds
      // Rendered tree is the representation of what really ends up on the screen, and it also rarely rebuilds

      // For every Widget => There's an element => and there's also a render
      // An element hold a references to a Widget and a Rendered box
      // Each widget has a "renderObject" (see Dart dev tools). That's what Flutter uses internally to render on screen.

      // Calling setState leads to "build" (up here) being called. 
      // Flutter will then take the new configuration
      // when build is called, part or the totality of the widget tree is recreated

      // State is in a separate location, managed by element tree, and not by widget.
      // But state is still linked to widget tree, because it describes the widget configuration (think about the Stateful Widget)

      // When build method is called, the widget tree is partially or totally recreated
      // so it only means the configuration data is reacreated
      // Each element in the element tree will so hold a new reference to a newly created widget

      // So it's nice to split your app into several widgets
      // Because if there's only one thing changing in a single widget, Flutter will simply call the build method on this one

      // One relatively good improvement for performance is to use const constructor and const widgets
      // However, you can go for const widgets if its props will be dynamic, which means "not known at compilation time" (remember that const is for compilation time)
      // You can still go with final tho

      // Declaring as const is useful, and you can do it if you use a widget with static properties
      // Indeed, const widget are not rebuild when build method is called

      // EX :
      // imagine _dynamic is a variable, which value will change regarding the context
      // Then you should write like this
      // Row(children: <Widget>[
      //   const Text("The text next to me is dynamic : "),  //<= this is a widget with static props : it will always print the text "The text next to me is dynamic : "
      //   Text(_dynamic)
      // ],)

      

        new SafeArea(
          child: 
            Container(
              padding: EdgeInsets.all(5),
              child: new ListView(
                
                children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: CardOne(title: "Personality quizz exercice",nav: HomeQuizzApp(),src:"https://www.muralswallpaper.com/app/uploads/Red-Illustrated-Landscape-Sunset-Wallpaper-Mural-plain-820x532.jpg"),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: CardOne(title: "Expenses Tracker",nav: HomeExpensesTracker(),src:"http://getwallpapers.com/wallpaper/full/7/c/4/1031234-download-free-siberian-tiger-wallpaper-2560x1600.jpg")
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: CardOne(title: "Meals app",nav: HomeMeals(),src:"https://i.ytimg.com/vi/7TML_MTQdg4/maxresdefault.jpg")
                    ),
                ],
              )
            )
          )
    );
  }
}
