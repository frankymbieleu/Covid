import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:covid/model/const.dart';
import 'package:covid/model/country.dart';
import 'package:covid/model/covid.dart';
import 'package:covid/model/global.dart';
import 'package:http/http.dart' as http;

class CovidRepositories {
  Future fetchCovidGlobal() async {
    final _url = urlCovid;
    final response = await http.get(_url);
    print(_url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var summaryDto = data['Global'];
      log('summary : $summaryDto');
      return Global.fromJson(summaryDto);
    } else {
      throw Exception("Error ${response.body}");
    }
  }

  Future fetchCovidCountries() async {
    final _url = urlCovid;
    final response = await http.get(_url);
    print(_url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var summaryDto = data['Countries'];
     // log('summary : $summaryDto');
      List<Countries> countries = summaryDto
          .map<Countries>((json) => Countries.fromJson(json))
          .toList();
      return countries;
    } else {
      throw Exception("Error ${response.body}");
    }
  }
}
