import 'package:covid/Repositories/covid_repositories.dart';
import 'package:covid/bloc/covid_bloc.dart';
import 'package:covid/bloc/covid_countries_event.dart';
import 'package:covid/bloc/covid_global_state.dart';
import 'package:covid/model/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard_covid.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CovidBloc _covidBloc;

  @override
  void initState() {
    CovidRepositories().fetchCovidGlobal();
    super.initState();
    _covidBloc = BlocProvider.of<CovidBloc>(context);
    _covidBloc.add(FetchCovidGlobal());
  }

  Global global = new Global(
      newConfirmed: 167889,
      totalConfirmed: 1928633,
      newDeaths: 4672,
      totalDeaths: 108114,
      newRecovered: 27255,
      totalRecovered: 447732);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<CovidBloc, CovidGlobalState>(
      bloc: _covidBloc,
      builder: (context, state) {
        if (state is GlobalUninitialized) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is GlobalLoadingError) {
          return Center(
            child: Text('failed to fetch posts'),
          );
        }
        if (state is GlobalLoadingSuccess) {
          if (state.global == null) {
            return Center(
              child: Text('no posts'),
            );
          }
          return DashboardCovid(
            global: state.global,
          );
        }
        return Container(
          child: Text('totoaaaaaaaaaaaaaaaaaaaaaaaa'),
        );
      },
    ));
  }
}
