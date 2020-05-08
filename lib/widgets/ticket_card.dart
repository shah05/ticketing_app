import 'package:flutter/material.dart';
import 'package:ticketing_app/util/constants.dart';

class TicketCard extends StatelessWidget {

  static const DATE_FORMAT = 'dd/MM/yyyy HH:mm';

//  TicketCard({this.cardName, this.cardDesc1, this.cardDesc2, this.icon, this.onPress});
  TicketCard(
      {this.cardName,
      this.cardDesc1,
      this.cardDesc2,
      this.cardDesc3,
      this.onPress});

  final String cardName;
  final String cardDesc1;
  final String cardDesc2;
  final String cardDesc3;
//  final IconData icon;
  final Function onPress;

  Color statusColour(String status){
    if(status == "New"){
      return Colors.red;
    }
    else if (status== "Assigned"){
      return Colors.orange;
    }
    else {
      return Colors.white;
    }
  }

  String convertDate (String svcDate){
    var formattedDate = DateTime.parse(svcDate).toLocal();
    print('${formattedDate.day}-${formattedDate.month}-${formattedDate.year} ${formattedDate.hour}:00');
    return '${formattedDate.day}-${formattedDate.month}-${formattedDate.year} ${formattedDate.hour}:00';
  }

  @override
  Widget build(BuildContext context) {
    print(cardDesc3);
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
              width: 90.0,
//              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: kDivider))),
//              child: Icon(icon, color: kIconBody),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    this.cardDesc1,
                    style: TextStyle(color: this.cardDesc1=="New" || this.cardDesc1=="Assigned" ? Colors.white : Colors.black, fontSize: 12.0),
                  ),
                  decoration: BoxDecoration(
                      color: statusColour(this.cardDesc1),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                ),
              ),
            ),
            title: Text(
              '$cardName',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: kTextPrimary),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Service Type: $cardDesc2',
                    style: TextStyle(color: kTextSecondary)),
                Text('Service Date: ${convertDate(cardDesc3)}',
                    style: TextStyle(color: kTextSecondary)),
              ],
            ),
            trailing:
                Icon(Icons.keyboard_arrow_right, color: kIconBody, size: 30.0)),
      ),
    );
  }
}
