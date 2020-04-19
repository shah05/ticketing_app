import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ticketing_app/model/attachments.dart';
import 'package:ticketing_app/model/ticket.dart';
import 'package:intl/intl.dart';
import 'package:ticketing_app/util/constants.dart';
import 'package:flutter/services.dart';

import 'create_ticket_status_screen.dart';

class CreateTicketForm extends StatefulWidget {
  @override
  _CreateTicketFormState createState() => _CreateTicketFormState();
}

class _CreateTicketFormState extends State<CreateTicketForm> {
  List<Attachments> attachments = [];
  String _fileName;
  Ticket ticket = new Ticket();
  final format = DateFormat("dd-MM-yyyy");
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
        attachments.add(Attachments(fileName: _fileName));
      }

//      _fileName = _path != null
//          ? _path.split('/').last
//          : _paths != null ? _paths.keys.toString() : '...';
    });
  }

  void validateFormFields() {

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
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
//        for(int i = 0; i<attachments.length;i++){
//          print(attachments[i].fileName);
//        }
        ticket.attachments=attachments;
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
//    else {
//      setState(() {
//        _autoValidate = true;
//      });
//    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create New Ticket',
          style: TextStyle(color: kTextTitle),
        ),
        backgroundColor: kAppBarColor,
        iconTheme: IconThemeData(color: kIconTitle),
      ),
      body: SafeArea(
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
                  validator: (val) => val.isEmpty ? 'Please add a title' : null,
                  onSaved: (val) => ticket.title = val,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'Key in description of the issue',
                    labelStyle: TextStyle(color: kTextPrimary),
                    errorStyle: kErrorTextStyle,
                  ),
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
                  validator: (val) =>
                      val.isEmpty ? 'Please add a reference' : null,
                  onSaved: (val) => ticket.clientRef1 = val,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Client Reference 2',
                    hintText: 'Key in a reference',
                    labelStyle: TextStyle(color: kTextPrimary),
                    errorStyle: kErrorTextStyle,
                  ),
                  validator: (val) =>
                      val.isEmpty ? 'Please add a reference' : null,
                  onSaved: (val) => ticket.clientRef2 = val,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Postal code',
                    hintText: 'Key in your postal code (e.g 53100)',
                    labelStyle: TextStyle(color: kTextPrimary),
                    errorStyle: kErrorTextStyle,
                  ),
                  validator: (val) => val.isEmpty
                      ? 'Please add a postal code (e.g 53100)'
                      : null,
                  onSaved: (val) => ticket.dcAccessCode = val,
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
                  validator: (val) =>
                      val.isEmpty ? 'Please add equipment serial no' : null,
                  onSaved: (val) => ticket.eqSerialNo = val,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Part No',
                    hintText: 'Key in part no',
                    labelStyle: TextStyle(color: kTextPrimary),
                    errorStyle: kErrorTextStyle,
                  ),
                  validator: (val) => val.isEmpty ? 'Please add part no' : null,
                  onSaved: (val) => ticket.partno = val,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Brand Model',
                    hintText: 'Key in brand model',
                    labelStyle: TextStyle(color: kTextPrimary),
                    errorStyle: kErrorTextStyle,
                  ),
                  validator: (val) =>
                      val.isEmpty ? 'Please add brand model' : null,
                  onSaved: (val) => ticket.brandModel = val,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Contact Details',
                    hintText: 'Key in contact details',
                    labelStyle: TextStyle(color: kTextPrimary),
                    errorStyle: kErrorTextStyle,
                  ),
                  validator: (val) =>
                      val.isEmpty ? 'Please add contact details' : null,
                  onSaved: (val) => ticket.locContact = val,
                ),
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
                    ? Text('Swipe to right to remove attachment in the list',
                        style: kErrorTextStyle)
                    : Container(),
                Builder(
                  builder: (BuildContext context) => _loadingPath
                      ? Center(
                          child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: const CircularProgressIndicator()),
                        )
                      : attachments != null
                          ? Container(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              height: MediaQuery.of(context).size.height * 0.30,
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
                                      key: Key(attachments[index].fileName),
                                      onDismissed: (direction) {
                                        setState(() {
                                          attachments.removeAt(index);
                                        });
                                      },
                                      direction: DismissDirection.startToEnd,
                                      child: ListTile(
                                        title: Text(
                                          attachments[index].fileName,
                                          style: TextStyle(fontSize: 12.0),
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
    );
  }
}
