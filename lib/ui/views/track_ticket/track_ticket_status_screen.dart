import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_app/business_logic/utils/enums.dart';
import 'package:ticketing_app/business_logic/viewmodels/track_ticket_status_viewmodel.dart';
import 'package:ticketing_app/main.dart';
import 'package:ticketing_app/model/list_ticket.dart';
//import 'package:ticketing_app/screens/track_ticket/ticket_detail_screen.dart';
import 'package:ticketing_app/service/rest_api.dart';
import 'package:ticketing_app/service_locator.dart';
import 'package:ticketing_app/ui/views/track_ticket/ticket_detail_screen.dart';
import 'package:ticketing_app/util/constants.dart';
import 'package:ticketing_app/widgets/redirect_to_login.dart';
import 'package:ticketing_app/widgets/ticket_card.dart';
import 'package:ticketing_app/widgets/top_banner.dart';

class TrackTicketStatusScreen extends StatefulWidget {
  @override
  _TrackTicketStatusScreenState createState() =>
      _TrackTicketStatusScreenState();
}

class _TrackTicketStatusScreenState extends State<TrackTicketStatusScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TrackTicketStatusViewModel viewModel =
      serviceLocator<TrackTicketStatusViewModel>();

  List<Ticketlist> listClosedTickets = [];
  List<Ticketlist> listOpenTickets = [];
  TabController _tabController;
  Future<ListTicket> listTicket;

  @override
  void initState() {
    super.initState();
//    listTicket = ApiService.getListTicketStatus();
    viewModel.loadData();
    print('init triggered');
    _tabController = TabController(vsync: this, length: 2);
  }

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<TrackTicketStatusViewModel>(
        builder: (context, model, child) => Scaffold(
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
                  child: model.viewState == ViewState.LOADING
                      ? Container(
                          alignment: FractionalOffset.center,
                          child: CircularProgressIndicator())
                      : model.trackTicketPresentation.isTokenExpired
                          ? RedirectToLogin()
                          //==== Open Tickets Tab ====
                          : model.trackTicketPresentation.openTicketUuid == null
                              ? Center(
                                  child: Text('Error listing open tickets.'),
                                )
                              : TabBarView(
                                  controller: _tabController,
                                  children: <Widget>[
                                    ListView.builder(
                                      itemCount: model.trackTicketPresentation
                                          .openTicketUuid.length,
                                      itemBuilder: (context, index) {
                                        return TicketCard(
                                          cardName: model
                                              .trackTicketPresentation
                                              .openTicketNaCode[index],
                                          cardDesc1: model
                                              .trackTicketPresentation
                                              .openTicketStatus[index],
                                          cardDesc2: model
                                              .trackTicketPresentation
                                              .openSvcType[index],
                                          cardDesc3: model
                                              .trackTicketPresentation
                                              .openSvcDate[index],
                                          onPress: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => TicketDetailScreen(
                                                      uuid: model
                                                          .trackTicketPresentation
                                                          .openTicketUuid[index])),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    //==== Closed Tickets Tab ====
                                    model.trackTicketPresentation
                                                .openTicketUuid ==
                                            null
                                        ? Center(
                                            child: Text(
                                                'Error listing closed tickets.'),
                                          )
                                        : ListView.builder(
                                            itemCount: model
                                                .trackTicketPresentation
                                                .closedTicketUuid
                                                .length,
                                            itemBuilder: (context, index) {
                                              return TicketCard(
                                                cardName: model
                                                    .trackTicketPresentation
                                                    .closedTicketNaCode[index],
                                                cardDesc1: model
                                                    .trackTicketPresentation
                                                    .closedTicketStatus[index],
                                                cardDesc2: model
                                                    .trackTicketPresentation
                                                    .closedSvcType[index],
                                                cardDesc3: model
                                                    .trackTicketPresentation
                                                    .closedSvcDate[index],
                                                onPress: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            TicketDetailScreen(
                                                                uuid: model
                                                                        .trackTicketPresentation
                                                                        .closedTicketUuid[
                                                                    index])),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                  ],
                                ),
                ),
              ],
            ),
          ),
        ),
      ),
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
