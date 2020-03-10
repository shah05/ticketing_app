import 'package:flutter/material.dart';
import 'package:ticketing_2/main.dart';
import 'package:ticketing_2/model/ticket.dart';
import 'util/constants.dart';
import 'bottom_navbar.dart';
import 'standard_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TicketDetailPage extends StatefulWidget {
  TicketDetailPage({Key key, this.ticket}) : super(key: key);

  final Ticket ticket;

  @override
  _TicketDetailPageState createState() => _TicketDetailPageState();
}

class _TicketDetailPageState extends State<TicketDetailPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Ticket No: ${widget.ticket.serialNum}'),),
        body: new SafeArea(
            child: Form(
                key: _formKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  TextFormField(
                    initialValue: widget.ticket.serialNum,
                    maxLines: 4,
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Problem Description',
                      icon: Icon(Icons.person),
                    ),
                  ),
                  TextFormField(
                    initialValue: widget.ticket.partNum,
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Part No',
                      icon: Icon(Icons.subdirectory_arrow_right),
                    ),
                  ),

                  TextFormField(
                    initialValue: widget.ticket.partNum,
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Serial No',
                      icon: Icon(Icons.flare),
                    ),
                  ),

                  TextFormField(
                    initialValue: widget.ticket.partNum,
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Preferred Service Date/Time',
                      icon: Icon(Icons.calendar_today),
                    ),
                  ),
                  TextFormField(
                    initialValue: widget.ticket.partNum,
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Contact Details',
                      icon: Icon(Icons.phone),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Row(children: <Widget>[
                    Icon(Icons.camera),
                    SizedBox(width: 15.0,),
                    Text('Attachement'),
                  ],),
                  SizedBox(height: 10.0,),
                  Image(
                    image: NetworkImage('https://www.w3schools.com/html/pic_trulli.jpg'),
                  ),
                ],
              ),

            ),),
      );
    }

}

