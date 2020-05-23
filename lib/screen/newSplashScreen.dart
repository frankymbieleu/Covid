import 'package:covid/Repositories/covid_repositories.dart';
import 'package:covid/bloc/country/covi_country_bloc.dart';
import 'package:covid/bloc/covid_bloc.dart';
import 'package:covid/bloc/covid_countries_event.dart';
import 'package:covid/bloc/covid_global_state.dart';
import 'package:covid/screen/prevention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard_covid.dart';

class NewSplashScreen extends StatefulWidget {
  @override
  _NewSplashScreenState createState() => _NewSplashScreenState();
}

class _NewSplashScreenState extends State<NewSplashScreen> {


setValueShare() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('startApps', false);
}
void initState() {
  // TODO: implement initState
  super.initState();
  setValueShare();
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/doctordial_home.gif'),
          fit: BoxFit.contain,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                "FRANKY MBIELEU \n ❤❤❤",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                 // fontStyle: FontStyle.italic,
                  fontFamily: 'DancingScript',
                  color: Color(0xFF0D8E53),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                RaisedButton(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                   // setValueShare();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                      return MultiBlocProvider(
                        providers: [
                          BlocProvider<CovidBloc>(
                            create: (context) => CovidBloc(
                                covidRepositories: CovidRepositories()),
                          ),
                          BlocProvider<CountryBloc>(
                            create: (context) => CountryBloc(
                                covidRepositories: CovidRepositories()),
                          )
                        ],
                        child: Prevention(),
                      );
                    }));
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Text(
                    "FrankCovid 2020 ❤",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontStyle: FontStyle.italic),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    )));
  }
}
