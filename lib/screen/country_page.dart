import 'package:covid/Repositories/covid_repositories.dart';
import 'package:covid/bloc/country/covid_country.dart';
import 'package:covid/bloc/covid_bloc.dart';
import 'package:covid/bloc/covid_countries_event.dart';
import 'package:covid/bloc/covid_global_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard_covid.dart';
import 'list_countries.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CountryBloc _countryBloc;

  @override
  void initState() {
    CovidRepositories().fetchCovidGlobal();
    super.initState();
    _countryBloc = BlocProvider.of<CountryBloc>(context);
    _countryBloc.add(FetchCovidCountries());
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<CountryBloc, CountryState>(
          bloc: _countryBloc,
          builder: (context, state) {
            if (state is CountriesUninitialized) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CountriesLoadingError) {
              return Center(
                child: Text('failed to fetch posts'),
              );
            }
            if (state is CountriesListLoadingSuccess) {
              if (state.countries == null) {
                return Center(
                  child: Text('no posts'),
                );
              }
              return ListCountries(
                countries: state.countries,
              );
            }
            return Container(
              child: Text('totoaaaaaaaaaaaaaaaaaaaaaaaa'),
            );
          },
        ));
  }
}
