import 'package:flutter/material.dart';
import 'package:ticketing_app/model/ticket.dart';
import 'package:ticketing_app/service/rest_api.dart';

class TicketDetailScreen extends StatelessWidget {
  final String uuid;

  TicketDetailScreen({this.uuid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$uuid'),
      ),
      body: FutureBuilder(
        future: ApiService.getTicketDetail(uuid), //api
//      future: null,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('HERE IN FUTURE BUILDER TICKETDETAIL');
            print(snapshot.data);
            return buildTicketDisplay(snapshot.data, uuid);
          } else if (snapshot.hasError) {
            return Text('Please Refresh');
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

Widget buildTicketDisplay(Ticket ticket, String uuid) {
  return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: <Widget>[
          TextFormField(
            initialValue: ticket.description,
            maxLines: 4,
            enabled: false,
            decoration: InputDecoration(
              labelText: 'Problem Description',
              icon: Icon(Icons.person),
            ),
          ),
//          TextFormField(
//            initialValue: widget.ticket.partNum,
//            enabled: false,
//            decoration: InputDecoration(
//              labelText: 'Part No',
//              icon: Icon(Icons.subdirectory_arrow_right),
//            ),
//          ),
//          TextFormField(
//            initialValue: widget.ticket.partNum,
//            enabled: false,
//            decoration: InputDecoration(
//              labelText: 'Serial No',
//              icon: Icon(Icons.flare),
//            ),
//          ),
//          TextFormField(
//            initialValue: widget.ticket.partNum,
//            enabled: false,
//            decoration: InputDecoration(
//              labelText: 'Preferred Service Date/Time',
//              icon: Icon(Icons.calendar_today),
//            ),
//          ),
//          TextFormField(
//            initialValue: widget.ticket.partNum,
//            enabled: false,
//            decoration: InputDecoration(
//              labelText: 'Contact Details',
//              icon: Icon(Icons.phone),
//            ),
//          ),
//          SizedBox(
//            height: 10.0,
//          ),
//          Row(
//            children: <Widget>[
//              Icon(Icons.camera),
//              SizedBox(
//                width: 15.0,
//              ),
//              Text('Attachement'),
//            ],
//          ),
//          SizedBox(
//            height: 10.0,
//          ),
//          Image(
//            image:
//                NetworkImage('https://www.w3schools.com/html/pic_trulli.jpg'),
//          ),
        ],
      ),
    );
}

