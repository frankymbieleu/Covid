import 'package:covid/Repositories/covid_repositories.dart';
import 'package:covid/bloc/covid_bloc.dart';
import 'package:covid/screen/prevention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'newSplashScreen.dart';

class StartApp extends StatelessWidget {
  @override
    valueShare() async {
    final prefs = await SharedPreferences.getInstance();
    final startApp = prefs.getBool('startApps') ?? true;
    return startApp;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: unrelated_type_equality_checks
      body: valueShare == true
          ? BlocProvider(
              create: (context) =>
                  CovidBloc(covidRepositories: CovidRepositories()),
              child: NewSplashScreen(),
            )
          : BlocProvider(
              create: (context) =>
                  CovidBloc(covidRepositories: CovidRepositories()),
              child: Prevention(),
            ),
    );
  }
}
