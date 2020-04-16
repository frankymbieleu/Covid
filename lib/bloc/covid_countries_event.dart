import 'package:equatable/equatable.dart';

import '../model/covid.dart';

abstract class CovidEvent  extends Equatable{
  const CovidEvent();
}

class FetchCovidGlobal extends CovidEvent {
  const FetchCovidGlobal();

  @override
  // TODO: implement props
  List<Object> get props => [];
}
class FetchCovidCountries extends CovidEvent {
  const FetchCovidCountries();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

