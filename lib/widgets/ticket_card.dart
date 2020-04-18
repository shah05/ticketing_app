import 'package:flutter/material.dart';
import 'package:ticketing_app/util/constants.dart';

class TicketCard extends StatelessWidget {
  TicketCard({this.cardName, this.cardDesc1, this.cardDesc2, this.icon, this.onPress});

  final String cardName;
  final String cardDesc1;
  final String cardDesc2;
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
                          new BorderSide(width: 1.0, color: kDivider))),
              child: Icon(icon, color: kIconBody),
            ),
            title: Text(
              '$cardName',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: kTextPrimary),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Service Type: $cardDesc1', style: TextStyle(color: kTextSecondary)),
                Text('Status: $cardDesc2', style: TextStyle(color: kTextSecondary)),
              ],
            ),
            trailing: Icon(Icons.keyboard_arrow_right,
                color: kIconBody, size: 30.0)),
      ),
    );
  }
}
