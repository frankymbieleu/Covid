import 'package:covid/Repositories/covid_repositories.dart';
import 'package:covid/bloc/country/covi_country_bloc.dart';
import 'package:covid/bloc/country/covid_countries_state.dart';
import 'package:covid/bloc/covid_bloc.dart';
import 'package:covid/bloc/covid_countries_event.dart';
import 'package:covid/bloc/covid_global_state.dart';
import 'package:covid/model/global.dart';
import 'package:covid/screen/prevention.dart';
import 'package:covid/widget/card.dart';
import 'package:covid/widget/clipPath.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'list_countries.dart';

class DashboardCovid extends StatefulWidget {
  final Global global;

  const DashboardCovid({Key key, this.global}) : super(key: key);

  @override
  _DashboardCovidState createState() => _DashboardCovidState();
}

class _DashboardCovidState extends State<DashboardCovid> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('DashBoard'),
          elevation: 0,
        ),
        body:BlocListener<CountryBloc, CountryState>(
          listener: (context, state) {
            if (state is CountriesLoadingError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Container(
                      child: Text(
                        '${state.error}',
                        textAlign: TextAlign.center,
                      )),
                  backgroundColor: Theme.of(context).errorColor,
                  duration: Duration(seconds: 2),
                ),
              );
            } else if (state is CountriesListLoadingSuccess) {
              if (state.countries == null) {
                Center(
                  child: Text('no posts'),
                );
              }
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return BlocProvider(
                  create: (context) =>
                      CountryBloc(covidRepositories: CovidRepositories()),
                  child: ListCountries(
                    countries: state.countries,
                  ),
                );
              }));
            }
          },
          child:
          BlocBuilder<CountryBloc, CountryState>(builder: (context, state) {
            return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFF0D8E53),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Image.asset(
                                'patient.png',
                                width: 230,
                                height: 150,
                                fit: BoxFit.fitHeight,
                                alignment: Alignment.bottomCenter,
                              ),
                            ),
                            Positioned(
                                top: 70,
                                left: 180,
                                child: Text(
                                  'Rester à la maison\n Franky Mbieleu❤',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                )),
                            Container(),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Total Number today :',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Card(
                      elevation: 9,
                      child: Container(
                        height: mediaQuery.size.height / 4.25,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 2),
                              child: MyCard(
                                image: 'death.png',
                                data: widget.global.totalDeaths.toString(),
                                color: Colors.redAccent,
                                title: 'Total Death',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3, right: 2),
                              child: MyCard(
                                image: 'sick.png',
                                data: widget.global.totalRecovered.toString(),
                                color: Colors.green,
                                title: 'Total Recovered',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3, right: 8),
                              child: MyCard(
                                image: 'malade.png',
                                data: widget.global.totalConfirmed.toString(),
                                color: Colors.orangeAccent,
                                title: 'Total Confirmed',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Information today : ' +
                            DateFormat.yMMMMEEEEd().format(
                              DateTime.now(),
                            ),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Card(
                      elevation: 9,
                      child: Container(
                        height: mediaQuery.size.height / 4.25,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(left: 8, right: 2),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 1),
                              child: MyCard(
                                image: 'death.png',
                                data: widget.global.newDeaths.toString(),
                                color: Colors.redAccent,
                                title: 'New Death',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3, right: 2),
                              child: MyCard(
                                image: 'sick.png',
                                data: widget.global.newRecovered.toString(),
                                color: Colors.green,
                                title: 'New Recovered',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2, right: 8),
                              child: MyCard(
                                image: 'malade.png',
                                data: widget.global.newConfirmed.toString(),
                                color: Colors.orangeAccent,
                                title: 'New Confirmed',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.green,
                      onTap: () {
                        BlocProvider.of<CountryBloc>(context)
                          ..add(FetchCovidCountries());
                      },
                      child: Card(
                        color: Color(0xFFFCFCFC),
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'More information by country',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Theme.of(context).primaryColor),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Theme.of(context).primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    RaisedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_){
                        return Prevention();
                      }));
                    })
                  ],
                ));
          }),
        )
    );
  }
}
