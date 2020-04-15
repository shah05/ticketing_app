import 'package:flutter/material.dart';
import 'package:ticketing_app/main.dart';
import 'package:ticketing_app/model/list_ticket.dart';
import 'package:ticketing_app/model/ticket.dart';
import 'package:ticketing_app/screens/ticket_detail_screen.dart';
import 'package:ticketing_app/service/rest_api.dart';
import 'package:ticketing_app/util/constants.dart';
import '../widgets/ticket_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login_screen.dart';

class TrackTicketStatusScreen extends StatefulWidget {
  @override
  _TrackTicketStatusScreenState createState() =>
      _TrackTicketStatusScreenState();
}

class _TrackTicketStatusScreenState extends State<TrackTicketStatusScreen> {
  final List<Ticketlist> listClosedTickets = [];

  final List<Ticketlist> listOpenTickets = [];

  Future<ListTicket> listTicket;
  @override
  void initState() {
    super.initState();
    listTicket = ApiService.getListTicketStatus();
  }

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
          body: FutureBuilder(
            future: listTicket, // call API to get list of tickets
            builder: (context, snapshot) {
              ListTicket listTicket = snapshot.data;
              if (listTicket == null) {
                return Container(
                  alignment: FractionalOffset.center,
                  child: CircularProgressIndicator(),
                );
              }
              if (listTicket.httpCode == 200) {
                ListTicket listTicket = snapshot.data;
                for (var l in listTicket.ticketlist) {
                  if (l.status.trim() == "Closed" ||
                      l.status.trim() == "Cancelled") {
                    listClosedTickets.add(l);
                  } else {
                    listOpenTickets.add(l);
                  }
                }
                return buildTicketList(listOpenTickets, listClosedTickets);
              }
//              else if (listTicket.httpCode == 401) {
//                print('in data null: ${snapshot.data}');
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Access Expired..'),
                    FlatButton(
                      child: Text('Sign In'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute<String>(
                              builder: (BuildContext context) => new MyApp(),
                              fullscreenDialog: true,
                            ));
                      },
                    ),
                  ],
                ),
              );
//              }
            },
          ),
//          bottomNavigationBar: BottomNavBar(),
        ),
      ),
    );
  }
}

Widget buildTicketList(List<Ticketlist> open, List<Ticketlist> closed) {
  return TabBarView(
    children: <Widget>[
      ListView.builder(
        itemCount: open.length,
        itemBuilder: (context, index) {
          return TicketCard(
              cardName: open[index].uuid,
              cardDesc1: open[index].svctype,
              cardDesc2: open[index].status,
              icon: FontAwesomeIcons.infoCircle,
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TicketDetailScreen(uuid: open[index].uuid)),
                );
              });
          return null;
        },
      ), //open
      ListView.builder(
        itemCount: closed.length,
        itemBuilder: (context, index) {
          return TicketCard(
              cardName: closed[index].uuid,
              cardDesc1: closed[index].svctype,
              cardDesc2: closed[index].status,
              icon: FontAwesomeIcons.infoCircle,
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TicketDetailScreen(uuid: closed[index].uuid)),
                );
              });
          return null;
        },
      ) //closed
    ],
  );
}
