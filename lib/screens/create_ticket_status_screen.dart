import 'package:flutter/material.dart';
import 'package:ticketing_app/screens/track_ticket_status_screen.dart';
import 'package:ticketing_app/service/rest_api.dart';
import 'package:ticketing_app/model/ticket.dart';

class CreateTicketStatusScreen extends StatefulWidget {
  final Ticket ticket;

  CreateTicketStatusScreen({this.ticket});

  @override
  _CreateTicketStatusScreenState createState() => _CreateTicketStatusScreenState();
}

class _CreateTicketStatusScreenState extends State<CreateTicketStatusScreen> {
//  Future<>

  Widget buildTicketResult(BuildContext context, bool result) {
    return Center(
      child: Column(
        children: <Widget>[
          result
              ? Text('Ticket Submitted Sucessfully')
              : Text('Ticket Submission Fail'),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute<String>(
                    builder: (BuildContext context) =>
                        TrackTicketStatusScreen(),
                    fullscreenDialog: true,
                  ));
            },
          )
        ],
      ),
    );
  }

  Widget buildTicketFail(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text('Ticket Submission Fail'),
          RaisedButton(
            child: Text('Retry'),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute<String>(
                    builder: (BuildContext context) =>
                        TrackTicketStatusScreen(),
                    fullscreenDialog: true,
                  ));
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ApiService.createTicket(widget.ticket),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
//            print(snapshot)
            return buildTicketResult(context, true);
          } else if (snapshot.hasError) {

            return buildTicketResult(context, false);
          }
          return Container(
            alignment: FractionalOffset.center,
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
