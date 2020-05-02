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
        Card(
          child: ListTile(
            title: Text('NA Code'),
            subtitle: Text(ticket.naCode),
          ),
        ),
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
                '${msgLogs[index].createdon} by ${msgLogs[index].createdby}'),
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
//                'Uploaded on ${attachments[index].createdon} by ${attachments[index].createdby}'),
                'Uploaded on ${attachments[index].createdon}'),
            trailing:
                GestureDetector(onTap: () {}, child: Icon(Icons.file_download)),
          ),
        );
      },
    );
  }
}
