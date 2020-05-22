import 'package:covid/Repositories/covid_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../covid_countries_event.dart';
import '../covid_global_state.dart';
import 'covid_countries_state.dart';


class CountryBloc extends Bloc<CovidEvent, CountryState> {
  final CovidRepositories covidRepositories;

  CountryBloc({this.covidRepositories});
  @override
  CountryState get initialState => CountriesListLoadingSuccess();

  Stream<CountryState> mapEventToState(CovidEvent event) async* {
    yield CountriesLoading();
    if (event is FetchCovidCountries) {
      try {
        final countries = await covidRepositories.fetchCovidCountries();
        yield CountriesListLoadingSuccess(countries: countries);
      } catch (_) {
        yield CountriesLoadingError(error: "Corona fait tu n'as pas de connexion hein!!! 😂😂😂");
      }
    }
  }

}
