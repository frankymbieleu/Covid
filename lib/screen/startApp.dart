import 'dart:async';

import 'package:covid/Repositories/covid_repositories.dart';
import 'package:covid/bloc/covid_bloc.dart';
import 'package:covid/screen/prevention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'newSplashScreen.dart';

class StartApp extends StatefulWidget {
  @override
  _StartAppState createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  valueShare() async {
    final prefs = await SharedPreferences.getInstance();
    final startApp = prefs.getBool('startApps');
    var _duration = new Duration(seconds: 3);
    if (startApp != null && !startApp) {
      return Timer(_duration, navigationPrevention );
    } else {
      prefs.setBool('startApps', false);
      return Timer(_duration,navigationNewSplashScreen);
    }
  }

  void navigationNewSplashScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return BlocProvider(
        create: (context) => CovidBloc(covidRepositories: CovidRepositories()),
        child: NewSplashScreen(),
      );
    }));
  }

  void navigationPrevention() {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return BlocProvider(
        create: (context) => CovidBloc(covidRepositories: CovidRepositories()),
        child: Prevention(),
      );
    }));
  }

  @override
  void initState() {
    valueShare();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70.withOpacity(1),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/ic_launcher.png"),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  )
                ],
              ),
              Text("👩‍💻 Frank'Apps 💻",
                  style: TextStyle(
                      fontSize: 35, color: Theme.of(context).primaryColor))
            ],
          ),
        ));
  }
}
