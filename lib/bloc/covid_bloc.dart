import 'package:covid/Repositories/covid_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'covid_countries_event.dart';
import 'covid_global_state.dart';

class CovidBloc extends Bloc<CovidEvent, CovidGlobalState> {
  @override
  CovidGlobalState get initialState => GlobalLoadingSuccess();

  Stream<CovidGlobalState> mapEventToState(CovidEvent event) async* {
    yield GlobalLoading();
    if (event is FetchCovidGlobal) {
      try {
        final global = await CovidRepositories().fetchCovidGlobal();
        yield GlobalLoadingSuccess(global: global);
      } catch (_) {
        yield GlobalLoadingError(error: 'on a pas pu afficher');
      }
    }
    /*else if (event is FetchCovidCountries) {
      yield* _mapLoadCovidCountriesState();
    }*/
  }

  Stream<CovidGlobalState> _mapLoadCovidGlobalState() async* {
    try {
      if (state is GlobalLoading) {
        final global = await CovidRepositories().fetchCovidGlobal();
        yield GlobalLoadingSuccess(global: global);
      }
      if (state is GlobalLoadingSuccess) {
        final global = await CovidRepositories().fetchCovidGlobal();
        yield GlobalLoadingSuccess(global: global);
      }
    } catch (_) {
      yield GlobalLoadingError(error: 'on a pas pu afficher');
    }
  }

/*Stream<CovidState> _mapLoadCovidCountriesState() async* {
    try {
      if (state is CountriesLoading) {
        final countries = await CovidRepositories().fetchCovidCountries();
        yield CountriesListLoadingSuccess(countries: countries);
      }
      if (state is CountriesListLoadingSuccess) {
        final countries = await CovidRepositories().fetchCovidCountries();
        yield CountriesListLoadingSuccess(countries: countries);
      }
    } catch (_) {
      yield CountriesLoadingError(error: 'on a pas pu afficher');
    }
  }*/
}
