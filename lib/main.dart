import 'package:flutter/material.dart';
import 'package:random_animation/page_route_transition/NavigatorMenu.dart';
import 'package:random_animation/page_route_transition/navigator/NavigatorReturn.dart';
import 'package:random_animation/page_route_transition/navigator/src/TransitionPage.dart';
import 'package:random_animation/page_route_transition/navigator/src/TransitionType.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (route) => onGenerateRoute(route),
    );
  }


  onGenerateRoute(RouteSettings settings) {
    switch(settings.name){
      case '/':
      return TransitionPage(
        settingss: settings,
        child: const Scaffold(
          body: MenuApp()
        ),
        type: TransitionType.fade
      );
      case 'NavigatorMenu':
      return TransitionPage(
        settingss: settings,
        child: const Scaffold(
          body: NavigatorMenu()
        ),
        type: TransitionType.fade
      );
      case 'NavigatorReturn':
        Map temp = settings.arguments as Map;

        int minAleatory = -1;
        int maxAleatory = 1;
        String typeTransition = (temp["EFFECT"] as TransitionType).name;

        int random1 = minAleatory + Random().nextInt(maxAleatory - minAleatory);
        int random2 = minAleatory + Random().nextInt(maxAleatory - minAleatory);

      return TransitionPage(
        settingss: settings,
        child: Scaffold(
            body: NavigatorReturn(title: typeTransition ),
        ),
        type: (temp["EFFECT"] as TransitionType),
        alignment: Alignment(random1.toDouble(), random2.toDouble()),
        childCurrent: (temp["CHILD_WIDGET"] as Widget),
      );
    }
  }
}

class MenuApp extends StatelessWidget {
  const MenuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("MENU", style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),),
          SizedBox(
            height: size.height * 0.1,
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, "NavigatorMenu");
            },
            child: const Text("Simple page route transition", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, "NavigatorMenu");
            },
            child: const Text("Heroe page route transition", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),),
          ),
        ],
      ),
    );
  }
}
