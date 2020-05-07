import 'package:covid/model/country.dart';
import 'package:covid/model/global.dart';
import 'package:covid/widget/card.dart';
import 'package:covid/widget/clipPath.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailCountry extends StatefulWidget {
  final Countries countries;

  const DetailCountry({Key key, this.countries}) : super(key: key);

  @override
  _DetailCountryState createState() => _DetailCountryState();
}

class _DetailCountryState extends State<DetailCountry> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      // backgroundColor: Colors.grey.withOpacity(0.1),
      appBar: AppBar(
        title: Text(widget.countries.country),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                    Color(0xFF3383CD),
                    Color(0xFF11249F),
                  ])),
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
                      top: 40,
                      left: 180,
                      child: Text(
                        'Rester à la maison\n Franky Mbieleu❤\n\n ${widget.countries.country}\n we love❤😘',
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Total Number today :',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                      data: widget.countries.totalDeaths.toString(),
                      color: Colors.redAccent,
                      title: 'Total Death',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3, right: 2),
                    child: MyCard(
                      image: 'sick.png',
                      data: widget.countries.totalRecovered.toString(),
                      color: Colors.green,
                      title: 'Total Recovered',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3, right: 8),
                    child: MyCard(
                      image: 'malade.png',
                      data: widget.countries.totalConfirmed.toString(),
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
                    DateTime.parse(widget.countries.date),
                  ),
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                      data: widget.countries.newDeaths.toString(),
                      color: Colors.redAccent,
                      title: 'New Death',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3, right: 2),
                    child: MyCard(
                      image: 'sick.png',
                      data: widget.countries.newRecovered.toString(),
                      color: Colors.green,
                      title: 'New Recovered',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2, right: 8),
                    child: MyCard(
                      image: 'malade.png',
                      data: widget.countries.newConfirmed.toString(),
                      color: Colors.orangeAccent,
                      title: 'New Confirmed',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      )),
    );
  }
}
