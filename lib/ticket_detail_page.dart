import 'package:flutter/material.dart';
import 'package:ticketing_2/main.dart';
import 'package:ticketing_2/model/ticket.dart';
import 'util/constants.dart';
import 'bottom_navbar.dart';
import 'standard_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TicketDetailPage extends StatelessWidget {
  TicketDetailPage({Key key, this.ticket}) : super(key: key);

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: kAppBackgroundColor,
//      body: ListView.builder(
//          itemCount: 7,
//          itemBuilder: (context,index){
//            return context
//          },),
//      bottomNavigationBar: BottomNavBar(),
    );
  }
}
