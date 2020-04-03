import 'package:flutter/material.dart';
import 'package:ticketing_app/model/ticket.dart';
import 'package:ticketing_app/screens/ticket_detail_screen.dart';
import 'package:ticketing_app/util/constants.dart';
import '../widgets/standard_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/bottom_navbar.dart';
import 'create_new_ticket_screen.dart';

class TrackTicketStatusScreen extends StatelessWidget {
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
                        print(_ticket.getTickets()[0]);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TicketDetailScreen(
                                    ticket: _ticket.getTickets()[0])));
                      }),
                  StandardCard(
                    cardName: 'New Tickets',
                    cardDesc: 'Create & submit a new ticket',
                    icon: FontAwesomeIcons.infoCircle,
                      onPress: () {
                        print(_ticket.getTickets()[0]);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateNewTicketScreen()));
                      }
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
//          bottomNavigationBar: BottomNavBar(),
        ),
      ),
    );
  }
}
