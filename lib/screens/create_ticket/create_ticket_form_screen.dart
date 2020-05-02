import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ticketing_app/model/attachments.dart';
import 'package:ticketing_app/model/contract.dart';
import 'package:ticketing_app/model/ticket.dart';
import 'package:intl/intl.dart';
import 'package:ticketing_app/util/constants.dart';
import 'package:flutter/services.dart';
import 'package:ticketing_app/widgets/top_banner.dart';

import 'create_ticket_status_screen.dart';

const List<String> dropdownTimeSlot =[
  "00.00",
  "01.00",
  "02.00",
  "03.00",
  "04.00",
  "05.00",
  "06.00",
  "07.00",
  "08.00",
  "09.00",
  "10.00",
  "11.00",
  "12.00",
  "13.00",
  "14.00",
  "15.00",
  "16.00",
  "17.00",
  "18.00",
  "19.00",
  "20.00",
  "21.00",
  "22.00",
  "23.00",
  "24.00",

];


class CreateTicketFormScreen extends StatefulWidget {
  @required
  final String contractId;

  CreateTicketFormScreen({this.contractId});

  @override
  _CreateTicketFormScreenState createState() => _CreateTicketFormScreenState();
}

class _CreateTicketFormScreenState extends State<CreateTicketFormScreen> {

  List<Attachment> attachments = [];
  String _fileName;
  Ticket ticket = new Ticket();
  final format = DateFormat("dd-MM-yyyy HH:mm");
  String _path;
  Map<String, String> _paths;
  bool _loadingPath = false;
//  bool _autoValidate = true;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void selectAttachment() async {
    setState(() => _loadingPath = true);
    try {
      _path = await FilePicker.getFilePath(
          type: FileType.custom,
          allowedExtensions: ['doc', 'pdf', 'xlsx', 'jpg']);
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      if (_path != null) {
        _fileName = _path.split('/').last;
        attachments.add(Attachment(fileName: _fileName, filePath: _path));
      }
    });
  }

  void validateFormFields() {
    if (_formKey.currentState.validate()) {
      /// Set Contract UUID
      Contract c = Contract();
      c.uuid = widget.contractId;
      ticket.contract = c;
      _formKey.currentState.save();
      print('title : ${ticket.contract.uuid}');
      print('title : ${ticket.title}');
      print('description : ${ticket.description}');
      print('ref1 : ${ticket.clientRef1}');
      print('ref2 : ${ticket.clientRef2}');
      print('postal : ${ticket.dcAccessCode}');
      print('equipment loc : ${ticket.eqLoc}');
      print('equipment serialno : ${ticket.eqSerialNo}');
      print('Part no : ${ticket.partno}');
      print('brand model : ${ticket.brandModel}');
      print('contact details : ${ticket.locContact}');
      print('svc date : ${ticket.srSdateTime}');
      print('svc date : ${ticket.srSdateTime}');
      if (attachments.isNotEmpty) {
        ticket.attachments = attachments;
        for (var attachment in ticket.attachments) {
          print('filename: ${attachment.fileName}');
          print('filename: ${attachment.filePath}');
        }
      }
      Navigator.push(
        context,
        new MaterialPageRoute<String>(
          builder: (BuildContext context) =>
              CreateTicketStatusScreen(ticket: ticket),
          fullscreenDialog: true,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.contractId);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopBanner(
              isBack: true,
            ),
            Expanded(
              child: Form(
                key: _formKey,
                autovalidate: true,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Title',
                          hintText: 'Key in a title to your ticket',
                          labelStyle: TextStyle(color: kTextPrimary),
                          errorStyle: kErrorTextStyle,
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'Please add a title' : null,
                        onSaved: (val) => ticket.title = val,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Description',
                          hintText: 'Key in description of the issue',
                          labelStyle: TextStyle(color: kTextPrimary),
                          errorStyle: kErrorTextStyle,
                        ),
                        maxLines: 3,
                        validator: (val) =>
                            val.isEmpty ? 'Please add a description' : null,
                        onSaved: (val) => ticket.description = val,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Client Reference 1',
                          hintText: 'Key in a reference',
                          labelStyle: TextStyle(color: kTextPrimary),
                          errorStyle: kErrorTextStyle,
                        ),
//                        validator: (val) =>
//                        val.isEmpty ? 'Please add a reference' : null,
                        onSaved: (val) => val.isEmpty
                            ? ticket.clientRef1 = null
                            : ticket.clientRef1 = val,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Client Reference 2',
                          hintText: 'Key in a reference',
                          labelStyle: TextStyle(color: kTextPrimary),
                          errorStyle: kErrorTextStyle,
                        ),
//                        validator: (val) =>
//                        val.isEmpty ? 'Please add a reference' : null,
                        onSaved: (val) => val.isEmpty
                            ? ticket.clientRef2 = null
                            : ticket.clientRef2 = val,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Postal code',
                          hintText: 'Key in your postal code (e.g 53100)',
                          labelStyle: TextStyle(color: kTextPrimary),
                          errorStyle: kErrorTextStyle,
                        ),
//                        validator: (val) => val.isEmpty
//                            ? 'Please add a postal code (e.g 53100)'
//                            : null,
                        onSaved: (val) => val.isEmpty
                            ? ticket.dcAccessCode = null
                            : ticket.dcAccessCode = val,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Equipment Location',
                          hintText:
                              'Key in equipment location (e.g 14 Robinson Road #08-01A)',
                          labelStyle: TextStyle(color: kTextPrimary),
                          errorStyle: kErrorTextStyle,
                        ),
                        validator: (val) => val.isEmpty
                            ? 'Please add equipment lcoation (e.g 14 Robinson Road #08-01A)'
                            : null,
                        onSaved: (val) => ticket.eqLoc = val,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Equipment Serial No',
                          hintText: 'Key in equipment serial no',
                          labelStyle: TextStyle(color: kTextPrimary),
                          errorStyle: kErrorTextStyle,
                        ),
//                        validator: (val) =>
//                        val.isEmpty ? 'Please add equipment serial no' : null,
                        onSaved: (val) => val.isEmpty
                            ? ticket.eqSerialNo = null
                            : ticket.eqSerialNo = val,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Part No',
                          hintText: 'Key in part no',
                          labelStyle: TextStyle(color: kTextPrimary),
                          errorStyle: kErrorTextStyle,
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'Please add part no' : null,
                        onSaved: (val) => ticket.partno = val,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Brand Model',
                          hintText: 'Key in brand model',
                          labelStyle: TextStyle(color: kTextPrimary),
                          errorStyle: kErrorTextStyle,
                        ),
//                        validator: (val) =>
//                        val.isEmpty ? 'Please add brand model' : null,
                        onSaved: (val) => val.isEmpty
                            ? ticket.brandModel = null
                            : ticket.brandModel = val,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Contact Details',
                          hintText: 'Key in contact details',
                          labelStyle: TextStyle(color: kTextPrimary),
                          errorStyle: kErrorTextStyle,
                        ),
                        maxLines: 3,
                        validator: (val) =>
                            val.isEmpty ? 'Please add contact details' : null,
                        onSaved: (val) => ticket.locContact = val,
                      ),
//                      BasicDateField(),
//                      BasicDateTimeField(),
//                      Clock24Example(),
                      DateTimeField(
                        decoration: InputDecoration(
                          labelText: 'Service Date',
                          hintText: 'Pick a date today onwards',
                          labelStyle: TextStyle(color: kTextPrimary),
                          errorStyle: kErrorTextStyle,
                        ),
                        format: format,
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                        },
                        validator: (value) {
                          /// Need to compare if picked date is earlier. Only validate selected current date onwards.
                          DateTime now = DateTime.now();
                          DateTime currentDate =
                              DateTime(now.year, now.month, now.day);
                          if (value == null) {
                            return 'Please pick a date';
                          } else if (value.isBefore(currentDate)) {
                            return 'Please pick a date later than today';
                          }
                          return null;
                        },
                        onSaved: (val) => ticket.srSdateTime = val.toString(),
                      ),



                      SizedBox(
//                  width: double.infinity,
                        child: RaisedButton(
                          color: kSubmitButton,
                          textColor: kTextButton,
                          onPressed: () => selectAttachment(),
                          child: Text('Attach files'),
                        ),
                      ),
                      attachments.isNotEmpty
                          ? Text(
                              'Swipe to right to remove attachment in the list',
                              style: kErrorTextStyle)
                          : Container(),
                      Builder(
                        builder: (BuildContext context) => _loadingPath
                            ? Center(
                                child: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: const CircularProgressIndicator()),
                              )
                            : attachments != null
                                ? Container(
                                    padding:
                                        const EdgeInsets.only(bottom: 30.0),
                                    height: MediaQuery.of(context).size.height *
                                        0.30,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: kSubmitButton),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Scrollbar(
                                      child: ListView.builder(
                                        itemCount: attachments.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Dismissible(
                                            key: Key(
                                                attachments[index].fileName),
                                            onDismissed: (direction) {
                                              setState(() {
                                                attachments.removeAt(index);
                                              });
                                            },
                                            direction:
                                                DismissDirection.startToEnd,
                                            child: ListTile(
                                              title: Text(
                                                attachments[index].fileName,
                                                style:
                                                    TextStyle(fontSize: 12.0),
                                              ),
//                                      trailing: Icon(Icons.close),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                : new Container(),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          color: kSubmitButton,
                          textColor: kTextButton,
                          onPressed: () {
                            validateFormFields();
                          },
                          child: Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BasicDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      format: format,
      onShowPicker: (context, currentValue) async {
        final date = await showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
        if (date != null) {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            builder: (BuildContext context, Widget child){
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                child: child,
              );
            }
          );
          return DateTimeField.combine(date, time);
        } else {
          return currentValue;
        }
      },
    );
  }
}

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Basic date field (${format.pattern})'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}



class Clock24Example extends StatelessWidget {
  final format = DateFormat("HH");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('24 hour clock'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) async {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child),
          );
          return DateTimeField.convert(time);
        },
      ),
    ]);
  }
}