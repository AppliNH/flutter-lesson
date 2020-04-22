import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:learnflutter/components/CardOne.dart';
import 'package:learnflutter/expensesTrackerApp/HomeExpensesTracker.dart';
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
      home: new Home(),
    );
  }
}

class Home extends StatefulWidget {

  

  @override
  State<StatefulWidget> createState() {
    return new _Home();
  }
}

AppBar appBar = new AppBar(centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: Text("Learning App",style:TextStyle(color:myWhite)),
        leading: IconButton(
          icon: Icon(Icons.brightness_2,color:myWhite),
          onPressed: (){/*TODO : Implement light/Dark theme change*/ },
          )
        );

class _Home extends State<Home> {

  @override
  Widget build(BuildContext context) {

    // Use this to get current height if using SafeArea
    var safePaddingTop = MediaQuery.of(context).padding.top;
    var safePaddingBottom = MediaQuery.of(context).padding.bottom;
    var appBarHeight = appBar.preferredSize.height;
    //

    return new Scaffold(
      appBar: appBar,
      backgroundColor: Theme.of(context).backgroundColor,
      body: 
        new SafeArea(
          child: 
            Container(
              padding: EdgeInsets.all(5),
              child: new Column(
                
                children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: CardOne(title: "Personality quizz exercice",nav: HomeQuizzApp(),src:"https://www.muralswallpaper.com/app/uploads/Red-Illustrated-Landscape-Sunset-Wallpaper-Mural-plain-820x532.jpg"),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: CardOne(title: "Expenses Tracker",nav: HomeExpensesTracker(),src:"http://getwallpapers.com/wallpaper/full/7/c/4/1031234-download-free-siberian-tiger-wallpaper-2560x1600.jpg")
                    ),
                ],
              )
            )
          )
    );
  }
}
