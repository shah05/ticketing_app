import 'package:flutter/material.dart';
import 'package:ticketing_app/model/create_ticket.dart';
import 'package:ticketing_app/screens/create_new_ticket_screen.dart';
import 'package:ticketing_app/screens/home_screen.dart';
import 'package:ticketing_app/service/rest_api.dart';
import 'package:ticketing_app/model/ticket.dart';
import 'package:ticketing_app/util/constants.dart';
import 'package:ticketing_app/widgets/redirect_to_login.dart';

class CreateTicketStatusScreen extends StatefulWidget {
  final Ticket ticket;

  CreateTicketStatusScreen({this.ticket});

  @override
  _CreateTicketStatusScreenState createState() =>
      _CreateTicketStatusScreenState();
}

class _CreateTicketStatusScreenState extends State<CreateTicketStatusScreen> {
//  Future<>

  Widget buildTicketSuccess(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text('Ticket Submitted Sucessfully'),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute<String>(
                    builder: (BuildContext context) => HomeScreen(),
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
                    builder: (BuildContext context) => CreateNewTicketScreen(),
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
      appBar: AppBar(
        title: Text(
          'Ticket Submission',
          style: TextStyle(color: kTextTitle),
        ),
        backgroundColor: kAppBarColor,
        iconTheme: IconThemeData(color: kIconTitle),
      ),
      body: FutureBuilder(
        future: ApiService.createTicket(widget.ticket),
        builder: (context, snapshot) {
          CreateTicket resultTicket = snapshot.data;

          if (resultTicket == null) {
            return Container(
              alignment: FractionalOffset.center,
              child: CircularProgressIndicator(),
            );
          }

          if (resultTicket.httpCode == 200) {
            return buildTicketSuccess(context);
          } else if (resultTicket.httpCode == 400) {
            return buildTicketFail(context);
          } else {
            return RedirectToLogin();
          }
        },
      ),
    );
  }
}
