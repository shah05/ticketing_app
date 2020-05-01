import 'package:flutter/material.dart';
import 'package:ticketing_app/model/create_ticket.dart';
import 'package:ticketing_app/screens/create_ticket/select_contract_screen.dart';
import 'package:ticketing_app/screens/home_screen.dart';
import 'package:ticketing_app/service/rest_api.dart';
import 'package:ticketing_app/model/ticket.dart';
import 'package:ticketing_app/util/constants.dart';
import 'package:ticketing_app/widgets/redirect_to_login.dart';
import 'package:ticketing_app/widgets/top_banner.dart';

class CreateTicketStatusScreen extends StatefulWidget {
  final Ticket ticket;
  Future<CreateTicket> createTicket;
  CreateTicketStatusScreen({this.ticket});

  @override
  _CreateTicketStatusScreenState createState() =>
      _CreateTicketStatusScreenState();
}

class _CreateTicketStatusScreenState extends State<CreateTicketStatusScreen> {
//  Future<>

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.createTicket = ApiService.createTicket(widget.ticket);
  }

  Widget buildTicketSuccess(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            'Ticket Submitted Sucessfully',
            style: TextStyle(color: kTextPrimary),
          ),
          RaisedButton(
            child: Text('Return Home'),
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
          Text(
            'Ticket Submission Fail',
            style: TextStyle(color: kTextPrimary),
          ),
          RaisedButton(
            child: Text('Retry'),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute<String>(
                    builder: (BuildContext context) => SelectContractScreen(),
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
//      appBar: AppBar(
//        title: Text(
//          'Ticket Submission',
//          style: TextStyle(color: kTextTitle),
//        ),
//        backgroundColor: kAppBarColor,
//        iconTheme: IconThemeData(color: kIconTitle),
//      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopBanner(isBack: false,),
            Expanded(
              child: FutureBuilder(
                future: widget.createTicket,
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
            ),
          ],
        ),
      ),
    );
  }
}
