import 'package:flutter_bloc/flutter_bloc.dart';

import './screen/home_page.dart';
import 'package:flutter/material.dart';

import 'bloc/covid_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => CovidBloc(),
        child: MyHomePage(),
      ),
    );
  }
}
