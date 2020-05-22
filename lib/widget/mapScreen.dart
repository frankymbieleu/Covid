import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return     Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.03),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 21),
            blurRadius: 54,
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Global Map",
                style: TextStyle(
                  fontSize: 15,
                  color:Theme.of(context).primaryColor
                ),
              ),
              SvgPicture.asset("assets/more.svg")
            ],
          ),
          SizedBox(height: 10),
          SvgPicture.asset("assets/map.svg"),
        ],
      ),
    );
  }
}
