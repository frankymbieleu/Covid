import 'dart:math';

import 'package:covid/Repositories/covid_repositories.dart';
import 'package:covid/model/const.dart';
import 'package:covid/model/country.dart';
import 'package:covid/widget/country_item.dart';
import 'package:flutter/material.dart';

class ListCountries extends StatefulWidget {
  final List<Countries> countries;

  const ListCountries({Key key, this.countries}) : super(key: key);

  @override
  _ListCountriesState createState() => _ListCountriesState();
}

class _ListCountriesState extends State<ListCountries> {
  var items = List<Countries>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items.addAll(widget.countries);
  }

  void filterSearchResults(String query) {
    List<Countries> dummySearchList = List<Countries>();
    dummySearchList.addAll(widget.countries);
    if (query.isNotEmpty) {
      List<Countries> dummyListData = List<Countries>();
      dummySearchList.forEach((item) {
        if (item.country.toLowerCase().contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(widget.countries);
      });
    }
  }

  var rdn = new Random();
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des pays'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, int index) {
                    return CountryItem(
                      countries:items[index],
                      color: color[rdn.nextInt(color.length)],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
