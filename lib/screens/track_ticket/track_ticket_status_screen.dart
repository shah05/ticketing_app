import 'package:flutter/material.dart';
import 'package:ticketing_app/main.dart';
import 'package:ticketing_app/model/list_ticket.dart';
import 'package:ticketing_app/screens/track_ticket/ticket_detail_screen.dart';
import 'package:ticketing_app/service/rest_api.dart';
import 'package:ticketing_app/util/constants.dart';
import 'package:ticketing_app/widgets/redirect_to_login.dart';
import 'package:ticketing_app/widgets/top_banner.dart';
import '../../widgets/ticket_card.dart';

class TrackTicketStatusScreen extends StatefulWidget {
  @override
  _TrackTicketStatusScreenState createState() =>
      _TrackTicketStatusScreenState();
}

class _TrackTicketStatusScreenState extends State<TrackTicketStatusScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  List<Ticketlist> listClosedTickets = [];
  List<Ticketlist> listOpenTickets = [];
  TabController _tabController;
  Future<ListTicket> listTicket;

  @override
  void initState() {
    super.initState();
    listTicket = ApiService.getListTicketStatus();
    print('init triggered');
    _tabController = TabController(vsync: this, length: 2);
  }

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBackgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopBanner(
              isBack: true,
            ),
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: 'OPEN', icon: Icon(Icons.hourglass_empty)),
                Tab(text: 'CLOSED', icon: Icon(Icons.hourglass_full))
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: listTicket, // call API to get list of tickets
                builder: (context, snapshot) {
                  print('futurebuilder ${counter++}');
                  ListTicket listTicket = snapshot.data;
                  //Reinitialize ticket list so that when futurebuilder rebuilds, it doesnt cause duplication in Card list.
                  listClosedTickets = [];
                  listOpenTickets = [];
                  if (listTicket == null) {
                    return Container(
                      alignment: FractionalOffset.center,
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (listTicket.httpCode == 200) {
                    for (var l in listTicket.ticketlist) {
                      if (l.status.trim() == "Closed" ||
                          l.status.trim() == "Cancelled") {
                        listClosedTickets.add(l);
                      } else {
                        listOpenTickets.add(l);
                      }
                    }
                    return TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        OpenTickets(
                          open: listOpenTickets,
                        ),
                        ClosedTickets(
                          closed: listClosedTickets,
                        )
                      ],
                    );
                  }
                  return RedirectToLogin();
                },
              ),
            ),
          ],
        ),
      ),
//          bottomNavigationBar: BottomNavBar(),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class ClosedTickets extends StatefulWidget {
  final List<Ticketlist> closed;

  ClosedTickets({this.closed});

  @override
  _ClosedTicketsState createState() => _ClosedTicketsState();
}

class _ClosedTicketsState extends State<ClosedTickets> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.closed.length,
      itemBuilder: (context, index) {
        return TicketCard(
          cardName: widget.closed[index].nacode,
          cardDesc1: widget.closed[index].status,
          cardDesc2: widget.closed[index].svctype,
          cardDesc3: widget.closed[index].svcdate,
//            icon: FontAwesomeIcons.infoCircle,
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      TicketDetailScreen(uuid: widget.closed[index].uuid)),
            );
          },
        );
      },
    );
  }
}

class OpenTickets extends StatefulWidget {
  final List<Ticketlist> open;

  OpenTickets({this.open});

  @override
  _OpenTicketsState createState() => _OpenTicketsState();
}

class _OpenTicketsState extends State<OpenTickets> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.open.length,
      itemBuilder: (context, index) {
        return TicketCard(
          cardName: widget.open[index].nacode,
          cardDesc1: widget.open[index].status,
          cardDesc2: widget.open[index].svctype,
          cardDesc3: widget.open[index].svcdate,
//            icon: FontAwesomeIcons.infoCircle,
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      TicketDetailScreen(uuid: widget.open[index].uuid)),
            );
          },
        );
      },
    );
  }
}
