import 'package:covid/bloc/covid.dart';
import 'package:covid/model/country.dart';
import 'package:covid/model/global.dart';
import 'package:equatable/equatable.dart';


import '../model/covid.dart';

abstract class CovidGlobalState extends Equatable {
  const CovidGlobalState();
}
class GlobalUninitialized extends CovidGlobalState {
  const GlobalUninitialized();
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class GlobalLoading extends CovidGlobalState{
  const GlobalLoading();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GlobalLoadingSuccess extends CovidGlobalState {
  final Global global;
  const GlobalLoadingSuccess({this.global});
  @override
  // TODO: implement props
  List<Object> get props => [global];
}


class GlobalLoadingError extends CovidGlobalState {
  final String error;
  const GlobalLoadingError({this.error});
  @override
  // TODO: implement props
  List<Object> get props => [];
}
