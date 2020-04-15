import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticketing_app/model/msglogs.dart';
import 'package:ticketing_app/model/ticket.dart';
import 'package:ticketing_app/model/ticket_by_id.dart';
import 'package:ticketing_app/service/rest_api.dart';
import 'package:ticketing_app/main.dart';

class TicketDetailScreen extends StatefulWidget {
  final String uuid;
  Future<TicketById> ticket;
  TicketDetailScreen({this.uuid});

  @override
  _TicketDetailScreenState createState() => _TicketDetailScreenState();
}

class _TicketDetailScreenState extends State<TicketDetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.ticket = ApiService.getTicketDetail(widget.uuid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.uuid}'),
      ),
      body: FutureBuilder(
        future: widget.ticket,
//      future: null,
        builder: (context, snapshot) {
          TicketById ticket = snapshot.data;

          if (ticket == null) {
            return Container(
              alignment: FractionalOffset.center,
              child: CircularProgressIndicator(),
            );
          }
          if (ticket.httpCode == 200) {
            return buildTicketDisplay(snapshot.data.ticket, widget.uuid);
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Access Expired..'),
                FlatButton(
                  child: Text('Sign In'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute<String>(
                          builder: (BuildContext context) => new MyApp(),
                          fullscreenDialog: true,
                        ));
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

String dateConverter(String dateString) {
  if (dateString == null) return 'NA';
  DateTime temp = DateTime.parse(dateString);
  return '${temp.day}/${temp.month}/${temp.year}';
}

String getTicketStatus(int statusId) {
  if (statusId == null) return 'NA';
  switch (statusId) {
    case 1:
      return 'New';
    case 2:
      return 'Assigned';
    case 3:
      return 'Pending';
    case 4:
      return 'Cancelled';
    case 5:
      return 'Closed';
    default:
      return 'NA';
  }
}

Widget buildMsgLogCard(List<MsgLogs> msgLogs) {
  if (msgLogs.length == 0) {
    return Card(
      child: ListTile(
        title: Text('Message Logs'),
        subtitle: Text('NA'),
      ),
    );
  } else {
    List<Widget> msLogContainer = [];
    for (int i = 0; i < msgLogs.length; i++) {
      String msgDate = dateConverter(msgLogs[i].createdon);
      msLogContainer.add(Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Message : ${msgLogs[i].message}'),
            Text('Action : ${msgLogs[i].action}'),
            Text('Action : ${msgLogs[i].remarks}'),
            Text('Created by : ${msgLogs[i].createdby}'),
            Text('Date : $msgDate'),
          ],
        ),
      ));
    }
    return Card(
      child: ListTile(
        title: Text('Message Logs'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: msLogContainer,
        ),
      ),
    );
  }
}

Widget buildTicketDisplay(Ticket ticket, String uuid) {
  return SafeArea(
    child: ListView(
//      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: <Widget>[
        Card(
          child: ListTile(
            title: Text('Title'),
            subtitle: Text(ticket.title),
          ),
        ),
//        Divider(),
        Card(
          child: ListTile(
            title: Text('Description'),
            subtitle: Text(ticket.description),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('NA Code'),
            subtitle: Text(ticket.naCode),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Organisation'),
            subtitle: Text(ticket.contract.organisation != null
                ? ticket.contract.organisation
                : 'NA'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Contract Number'),
            subtitle: Text(ticket.contract.contractNo != null
                ? ticket.contract.contractNo
                : 'NA'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Maintenance Program'),
            subtitle: Text(ticket.contract.maintProgram != null
                ? ticket.contract.maintProgram
                : 'NA'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Requestor ID'),
            subtitle:
                Text(ticket.requestorId != null ? ticket.requestorId : 'NA'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Maintenance Program'),
            subtitle: Text(ticket.contract.maintProgram != null
                ? ticket.contract.maintProgram
                : 'NA'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Submit Date'),
            subtitle: Text(dateConverter(ticket.srSdateTime)),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Reach Date'),
            subtitle: Text(dateConverter(ticket.srsReachdateTime)),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Start Date'),
            subtitle: Text(dateConverter(ticket.srsStartdateTime)),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('End Date'),
            subtitle: Text(dateConverter(ticket.srsEnddateTime)),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Status'),
            subtitle: Text(
              getTicketStatus(ticket.srsStatusId),
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Client Reference 1'),
            subtitle:
                Text(ticket.clientRef1 != null ? ticket.clientRef1 : 'NA'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Client Reference 2'),
            subtitle:
                Text(ticket.clientRef2 != null ? ticket.clientRef2 : 'NA'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Client Reference 2'),
            subtitle:
                Text(ticket.clientRef2 != null ? ticket.clientRef2 : 'NA'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Brand Model'),
            subtitle:
                Text(ticket.brandModel != null ? ticket.brandModel : 'NA'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Equipment Serial Number'),
            subtitle:
                Text(ticket.eqSerialNo != null ? ticket.eqSerialNo : 'NA'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Part Number'),
            subtitle: Text(ticket.partno != null ? ticket.partno : 'NA'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Equipment Location'),
            subtitle: Text(ticket.eqLoc != null ? ticket.eqLoc : 'NA'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Location Contact'),
            subtitle:
                Text(ticket.locContact != null ? ticket.locContact : 'NA'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Site Address'),
            subtitle:
                Text(ticket.siteAddress != null ? ticket.siteAddress : 'NA'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Postal Code'),
            subtitle:
                Text(ticket.dcAccessCode != null ? ticket.dcAccessCode : 'NA'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Message'),
            subtitle: Text(ticket.tMsg != null ? ticket.tMsg : 'NA'),
          ),
        ),
        buildMsgLogCard(ticket.msgLogs),
      ],
    ),
  );
}
