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
//            print('HERE IN FUTURE BUILDER TICKETDETAIL');
//            print(uuid);
//            print(snapshot.data.ticket.naCode);
            return buildTicketDisplay(snapshot.data.ticket, uuid);
          } else if (snapshot.hasError) {
//            print(uuid);
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
//      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: <Widget>[
//        ListTile(
//          title: Text('Title'),
//          subtitle: Text(ticket.title),
//        ),
//        Divider(),
        Card(
          child: ListTile(
//            leading: Icon(Icons.person),
            title: Text('Problem Description'),
            subtitle: Text(ticket.description),
          ),
        ),
          Card(
            child: TextFormField(
              initialValue: ticket.title,
              enabled: false,
              decoration: InputDecoration(
                labelText: 'Title',
                icon: Icon(Icons.person),
              ),
            ),
          ),
          TextFormField(
            initialValue: ticket.description,
            maxLines: 3,
            enabled: false,
            decoration: InputDecoration(
              labelText: 'Problem Description',
              icon: Icon(Icons.person),
            ),
          ),
          TextFormField(
            initialValue: ticket.clientRef1,
            enabled: false,
            decoration: InputDecoration(
              labelText: 'Client Reference 1',
              icon: Icon(Icons.subdirectory_arrow_right),
            ),
          ),
//          TextFormField(
//            initialValue: ticket.clientRef2,
//            enabled: false,
//            decoration: InputDecoration(
//              labelText: 'Client Reference 2',
//              icon: Icon(Icons.flare),
//            ),
//          ),
//          TextFormField(
//            initialValue: ticket.eqLoc,
//            enabled: false,
//            decoration: InputDecoration(
//              labelText: 'Equipment Location',
//              icon: Icon(Icons.calendar_today),
//            ),
//          ),
//          TextFormField(
//            initialValue: ticket.dcAccessCode,
//            enabled: false,
//            decoration: InputDecoration(
//              labelText: 'Postal Code',
//              icon: Icon(Icons.phone),
//            ),
//          ),
//          TextFormField(
//            initialValue: ticket.naCode,
//            enabled: false,
//            decoration: InputDecoration(
//              labelText: 'Postal Code',
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
