import 'package:flutter/material.dart';
class CardPrevention extends StatelessWidget {
  final String link;

  const CardPrevention({Key key, this.link}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return         Container(
      width: MediaQuery.of(context).size.width / 2.3,
      height: MediaQuery.of(context).size.height / 6,
      child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                image: DecorationImage(
                    image: AssetImage(
                      link,
                    ),
                    fit: BoxFit.cover)),
          )),
    );
  }
}
