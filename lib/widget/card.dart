import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Color color;
  final String image;
  final String data;
  final String title;

  const MyCard({Key key, this.color, this.image, this.data, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      width: mediaQuery.size.width / 3.25,
      //height: mediaQuery.size.height / 3,
      /*decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.yellow])),*/
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                image,
                width: 50,
                height: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: mediaQuery.size.width,
                child: Text(
                  data,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: color),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
