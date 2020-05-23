import 'package:covid/screen/newSplashScreen.dart';
import 'package:covid/screen/startApp.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:flutter/material.dart';

import 'Repositories/covid_repositories.dart';
import 'bloc/covid_bloc.dart';

void main() {
  //SystemChrome.setPreferredOrientations(
  //[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'DancingScript',
          textTheme: TextTheme(
              body1: TextStyle(color: Theme.of(context).primaryColor),display1:TextStyle(color: Theme.of(context).primaryColor,fontSize: 15), ),
          primaryColor: Color(0xFF0D8E53),
          scaffoldBackgroundColor: Color(0xFFFCFCFC),
          buttonTheme: ButtonThemeData()),
      home: StartApp();
    );
  }
}
