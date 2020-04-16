import 'package:covid/model/country.dart';
import 'package:covid/screen/detail_country.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountryItem extends StatelessWidget {
  final Countries countries;
  final Color color;

  const CountryItem({Key key, this.countries, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return DetailCountry(
            countries: countries,
          );
        }));
      },
      child: Card(
        color: color,
        child: ListTile(
          leading: Icon(Icons.flag),
          title: Text(
            countries.country,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          subtitle: Text(
            DateFormat.yMMMMEEEEd().format(
              DateTime.parse(countries.date),
            ),
            style: TextStyle( fontSize: 16),
          ),
          trailing: Text(
            DateFormat.Hms().format(
              DateTime.parse(countries.date),
            ),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.indigo),
          ),
        ),
      ),
    );
  }
}
