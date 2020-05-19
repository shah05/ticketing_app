import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticketing_app/model/attachments.dart';
import 'package:ticketing_app/model/msglogs.dart';
import 'package:ticketing_app/model/ticket.dart';
import 'package:ticketing_app/model/ticket_by_id.dart';
import 'package:ticketing_app/service/rest_api.dart';
import 'package:ticketing_app/main.dart';
import 'package:ticketing_app/util/constants.dart';
import 'package:ticketing_app/widgets/redirect_to_login.dart';
import 'package:ticketing_app/widgets/top_banner.dart';

class TicketDetailScreen extends StatefulWidget {
  final String uuid;
  Future<TicketById> ticket;
  TicketDetailScreen({this.uuid});

  @override
  _TicketDetailScreenState createState() => _TicketDetailScreenState();
}

class _TicketDetailScreenState extends State<TicketDetailScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.ticket = ApiService.getTicketDetail(widget.uuid);
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Tab(text: 'Ticket Details'),
                Tab(text: 'Attachments(s)'),
                Tab(text: 'Message(s)')
              ],
            ),
            Expanded(
              child: FutureBuilder(
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
//                    return buildTicketDisplay(
//                        snapshot.data.ticket, widget.uuid,_tabController);
                    Ticket _ticket = snapshot.data.ticket;
                    return TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        BuildTicketDetailPage(ticket: _ticket),
                        BuildAttachmentsPage(
                          attachments: _ticket.attachments,
                        ),
                        BuildMsgLogsPage(
                          msgLogs: _ticket.msgLogs,
                        ),
                      ],
                    );
                  }
                  return RedirectToLogin();
                },
              ),
            ),
          ],
        ),
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

class BuildTicketDetailPage extends StatelessWidget {
  final Ticket ticket;

  BuildTicketDetailPage({this.ticket});

  @override
  Widget build(BuildContext context) {
    return ListView(
//      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: <Widget>[
        //1. NA Code
        Card(
          child: ListTile(
            title: Text('NA Code'),
            subtitle: Text(ticket.naCode),
          ),
        ),
        //2. Serial No
        Card(
          child: ListTile(
            title: Text('Equipment Serial Number'),
            subtitle:
                Text(ticket.eqSerialNo != null ? ticket.eqSerialNo : 'NA'),
          ),
        ),
        //3. Service Type
        Card(
          child: ListTile(
            title: Text('Service Type'),
            subtitle: Text(ticket.svcType != null ? ticket.svcType : 'NA'),
          ),
        ),
        //4. Service Date
        Card(
          child: ListTile(
            title: Text('Request Service on'),
            subtitle: Text(dateConverter(ticket.srSdateTime)),
          ),
        ),
        //5. Title
        Card(
          child: ListTile(
            title: Text('Subject'),
            subtitle: Text(ticket.title),
          ),
        ),
        //6. Description
        Card(
          child: ListTile(
            title: Text('Description'),
            subtitle: Text(ticket.description),
          ),
        ),
        //7. Contact Details
        Card(
          child: ListTile(
            title: Text('Contact Details'),
            subtitle:
                Text(ticket.locContact != null ? ticket.locContact : 'NA'),
          ),
        ),
        //8. Equipment Location
        Card(
          child: ListTile(
            title: Text('Equipment Location'),
            subtitle: Text(ticket.eqLoc != null ? ticket.eqLoc : 'NA'),
          ),
        ),
        //9. Postal Code
        Card(
          child: ListTile(
            title: Text('Postal Code'),
            subtitle:
                Text(ticket.dcAccessCode != null ? ticket.dcAccessCode : 'NA'),
          ),
        ),
        //10. Brand/Model
        Card(
          child: ListTile(
            title: Text('Brand Model'),
            subtitle:
                Text(ticket.brandModel != null ? ticket.brandModel : 'NA'),
          ),
        ),
        //11. Equipment No
        Card(
          child: ListTile(
            title: Text('Equipment No'),
            subtitle: Text(ticket.partno != null ? ticket.partno : 'NA'),
          ),
        ),
        //12. Remarks
        Card(
          child: ListTile(
            title: Text('Organisation'),
            subtitle: Text(ticket.remarks != null ? ticket.remarks : 'NA'),
          ),
        ),
        //13. Client Ref 1
        Card(
          child: ListTile(
            title: Text('Client Reference 1'),
            subtitle:
                Text(ticket.clientRef1 != null ? ticket.clientRef1 : 'NA'),
          ),
        ),
        //14. Client Ref 2
        Card(
          child: ListTile(
            title: Text('Client Reference 2'),
            subtitle:
                Text(ticket.clientRef2 != null ? ticket.clientRef2 : 'NA'),
          ),
        ),
      ],
    );
  }
}

//============================================
// This widget builds the content under Message(s) tab.
//============================================
class BuildMsgLogsPage extends StatelessWidget {
  final List<MsgLogs> msgLogs;

  BuildMsgLogsPage({this.msgLogs});

  String convertDate(String createDate) {
    var formattedDate = DateTime.parse(createDate).toLocal();
    print(
        '${formattedDate.day}-${formattedDate.month}-${formattedDate.year} ${formattedDate.hour}:00');
    return '${formattedDate.day}-${formattedDate.month}-${formattedDate.year} ${formattedDate.hour}:00';
  }

  @override
  Widget build(BuildContext context) {
    if (msgLogs.length == 0) {
      return Center(
        child: Text('No Message Logs for this ticket'),
      );
    }
    return ListView.builder(
      itemCount: msgLogs.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(
                '${convertDate(msgLogs[index].createdon)} by ${msgLogs[index].createdby}'),
            subtitle:
                Text('${msgLogs[index].action} ${msgLogs[index].message}'),
          ),
        );
      },
    );
  }
}

//============================================
// This widget builds the content under Attachement(s) tab.
//============================================

class BuildAttachmentsPage extends StatelessWidget {
  final List<Attachment> attachments;

  BuildAttachmentsPage({this.attachments});

  String convertDate(String uploadDate) {
    var formattedDate = DateTime.parse(uploadDate).toLocal();
    print(
        '${formattedDate.day}-${formattedDate.month}-${formattedDate.year} ${formattedDate.hour}:00');
    return '${formattedDate.day}-${formattedDate.month}-${formattedDate.year} ${formattedDate.hour}:00';
  }

  @override
  Widget build(BuildContext context) {
    if (attachments.length == 0) {
      return Center(
        child: Text('No Attachments for this ticket'),
      );
    }
    return ListView.builder(
      itemCount: attachments.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text('${attachments[index].fileName}'),
            subtitle: Text(
                'Uploaded on ${convertDate(attachments[index].createdon)}'),
            trailing:
                GestureDetector(onTap: () {
                  
                }, child: Icon(Icons.file_download)),
          ),
        );
      },
    );
  }
}
