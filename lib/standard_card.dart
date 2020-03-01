import 'package:flutter/material.dart';
import 'package:ticketing_2/util/constants.dart';

class StandardCard extends StatelessWidget {
  StandardCard({this.cardName, this.cardDesc, this.icon, this.onPress});

  final String cardName;
  final String cardDesc;
  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: kCardBackgroundColor),
        child: ListTile(
            onTap: onPress,
            contentPadding:
            EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right:
                      new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(icon, color: Colors.white),
            ),
            title: Text(
              cardName,
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(cardDesc, style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.keyboard_arrow_right,
                color: Colors.white, size: 30.0)),
      ),
    );
  }
}