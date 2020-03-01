import 'package:flutter/material.dart';
import 'package:ticketing_2/model/ticket.dart';
import 'package:ticketing_2/ticket_detail_page.dart';
import 'package:ticketing_2/util/constants.dart';
import 'standard_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bottom_navbar.dart';

class TicketListPage extends StatelessWidget {
  final Ticket _ticket = Ticket();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: kAppBackgroundColor,
          appBar: AppBar(
            elevation: 0.1,
            backgroundColor: kAppBackgroundColor,
            title: Text('Track Tickets'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false),
            ),
            bottom: TabBar(
              tabs: [
                Tab(text: 'OPEN', icon: Icon(Icons.hourglass_empty)),
                Tab(text: 'CLOSED', icon: Icon(Icons.hourglass_full))
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  StandardCard(
                      cardName: _ticket.getTickets()[0].partNum,
                      cardDesc: _ticket.getTickets()[0].serialNum,
                      icon: FontAwesomeIcons.infoCircle,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TicketDetailPage(
                                    ticket: _ticket.getTickets()[0])));
                      }),
                  StandardCard(
                    cardName: 'New Tickets',
                    cardDesc: 'Create & submit a new ticket',
                    icon: FontAwesomeIcons.infoCircle,
//            onPress: (){
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => TicketListPage()));
//            }
                  )
                ],
              ), //open
              ListView(
                children: <Widget>[
                  StandardCard(
                    cardName: 'New Tickets',
                    cardDesc: 'Create & submit a new ticket',
                    icon: FontAwesomeIcons.infoCircle,
//            onPress: (){
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => TicketListPage()));
//            }
                  ),
                  StandardCard(
                    cardName: 'New Tickets',
                    cardDesc: 'Create & submit a new ticket',
                    icon: FontAwesomeIcons.infoCircle,
//            onPress: (){
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => TicketListPage()));
//            }
                  )
                ],
              ) //closed
            ],
          ),
          bottomNavigationBar: BottomNavBar(),
        ),
      ),
    );
  }
}
