import 'package:flutter/material.dart';
import 'package:ticketing_2/main.dart';
import 'package:ticketing_2/model/ticket.dart';
import 'util/constants.dart';
import 'bottom_navbar.dart';
import 'standard_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TicketDetailPage2 extends StatelessWidget {
  TicketDetailPage2({Key key, this.ticket}) : super(key: key);

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBackgroundColor,
      body: Column(
          children: <Widget>[
            TopContent(ticketNum: 'abc1234',),
//          Expanded(child: MenuListTile()),
          ],
          ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class TopContent extends StatelessWidget {
  TopContent({this.ticketNum,this.attachmentUrl});

  final String ticketNum;
  final String attachmentUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:  attachmentUrl==null ? AssetImage("assets/no_attachment.png") : AssetImage(attachmentUrl),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          padding: EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 120.0),
              Text(
                'No: ${ticketNum}',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
          ],),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );
  }
}
