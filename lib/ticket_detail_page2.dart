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
      backgroundColor: kAppBackgroundColor,
      body: Column(
          children: <Widget>[
            TopContent(ticketNum: 'abc1234',),
          Expanded(child: MenuListTile()),
          ],
          ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class BottomContent extends StatelessWidget {

  BottomContent({this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: kCardBackgroundColor),
        child: ListTile(
            contentPadding:
            EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right:
                      new BorderSide(width: 1.0, color: Colors.white24))),
            ),
            title: Text(
              "Serial Number",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text("", style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.keyboard_arrow_right,
                color: Colors.white, size: 30.0)),
      ),
    )
    ],);
      Container(child:
    Column(children: <Widget>[
      Row(
        children: <Widget>[
        Text('Problem Description :',
            style: TextStyle(color: Colors.white)),
        Text(ticket.problemDesc,style: TextStyle(color: Colors.white))
      ],),
      Row(
        children: <Widget>[
          Text('Part No :',
              style: TextStyle(color: Colors.white)),
          Text(ticket.partNum,style: TextStyle(color: Colors.white))
        ],),
      Row(
        children: <Widget>[
          Text('Serial No :',
              style: TextStyle(color: Colors.white)),
          Text(ticket.serialNum,style: TextStyle(color: Colors.white))
        ],),
      Row(
        children: <Widget>[
          Text('Preferred Service Date/Time :',
              style: TextStyle(color: Colors.white)),
          Text(ticket.serviceDate.toString(),style: TextStyle(color: Colors.white))
        ],),
      Row(
        children: <Widget>[
          Text('Contact Name :',
              style: TextStyle(color: Colors.white)),
          Text(ticket.contactName,style: TextStyle(color: Colors.white))
        ],),
      Row(
        children: <Widget>[
          Text('Contact Number :',
              style: TextStyle(color: Colors.white)),
          Text(ticket.contactNum,style: TextStyle(color: Colors.white))
        ],)

    ],),);
  }
}

//
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
