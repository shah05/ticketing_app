import 'package:flutter/material.dart';
import 'package:ticketing_2/model/ticket.dart';
import 'util/constants.dart';
import 'bottom_navbar.dart';

class TicketDetailPage extends StatelessWidget {
  TicketDetailPage({Key key, this.ticket}) : super(key: key);

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBackgroundColor,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: kAppBackgroundColor,
//    centerTitle: true,
        title: Text('Network Architect'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text("Hello world"),
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: kCardBackgroundColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Text("Hello world"),
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: kCardBackgroundColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
