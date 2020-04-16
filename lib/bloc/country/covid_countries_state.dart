import 'package:covid/bloc/covid.dart';
import 'package:covid/model/country.dart';
import 'package:covid/model/global.dart';
import 'package:equatable/equatable.dart';


abstract class CountryState extends Equatable {
  const CountryState();
}

class CountriesUninitialized extends CountryState {
  const CountriesUninitialized();

  @override
  // TODO: implement props
  List<Object> get props => [];
}
class CountriesLoading extends CountryState{
  const CountriesLoading();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CountriesLoadingSuccess extends CountryState {
  final Countries countries;
  const CountriesLoadingSuccess({this.countries});
  @override
  // TODO: implement props
  List<Object> get props => [countries];
}
class CountriesListLoadingSuccess extends CountryState {
  final List<Countries> countries;
  const CountriesListLoadingSuccess({this.countries});
  @override
  // TODO: implement props
  List<Object> get props => [countries];
}

class CountriesLoadingError extends CountryState {
  final String error;
  const CountriesLoadingError({this.error});
  @override
  // TODO: implement props
  List<Object> get props => [];
}
