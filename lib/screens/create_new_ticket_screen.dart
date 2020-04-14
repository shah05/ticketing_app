import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticketing_app/model/ticket.dart';
import 'dart:io';

import 'package:ticketing_app/util/constants.dart';
import 'package:ticketing_app/screens/create_ticket_status_screen.dart';

class CreateNewTicketScreen extends StatefulWidget {
//  TicketFormPage({this.title,this.canEdit});
//  final String title;
//  final bool canEdit;

  @override
  _CreateNewTicketScreenState createState() => _CreateNewTicketScreenState();
}

class _CreateNewTicketScreenState extends State<CreateNewTicketScreen> {
  File _image;
  String probDesc;
  String partNo;
  String serialNo;
  DateTime date;
  String contactNum;
  Ticket ticket = new Ticket();
  final format = DateFormat("yyyy-MM-dd");
  bool _autoValidate = true;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(ticket.brandModel);
      Navigator.push(
        context,
        new MaterialPageRoute<String>(
          builder: (BuildContext context) =>
              CreateTicketStatusScreen(ticket: ticket),
          fullscreenDialog: true,
        ),
      );
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Ticket'),
      ),
      body: new SafeArea(
        child: Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Title',
                  icon: Icon(Icons.person),
                ),
                validator: (value) {
                  print(value);
                  if (value.isEmpty) {
                    return 'Please add a title to your issue';
                  }
                  return null;
                },
                onSaved: (value) {
                  ticket.title = value;
                },
              ),
              TextFormField(
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: 'Problem Description',
                  icon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please add some description to your issue';
                  }
                  return null;
                },
                onSaved: (value) {
                  ticket.description = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Cleint Reference 1',
                  icon: Icon(Icons.subdirectory_arrow_right),
                ),
                onSaved: (value) {
                  ticket.clientRef1 = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Client Reference 2',
                  icon: Icon(Icons.flare),
                ),
                onSaved: (value) {
                  ticket.clientRef2 = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Postal Code',
                  icon: Icon(Icons.flare),
                ),
                onSaved: (value) {
                  ticket.dcAccessCode = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Equipment Location',
                  icon: Icon(Icons.flare),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Equipment Number',
                  icon: Icon(Icons.flare),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Equipment Serial Number',
                  icon: Icon(Icons.flare),
                ),
                onSaved: (value) {
                  ticket.eqSerialNo = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Part Number',
                  icon: Icon(Icons.flare),
                ),
                onSaved: (value) {
                  ticket.partno = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Brand Model',
                  icon: Icon(Icons.flare),
                ),
                onSaved: (value) {
                  ticket.brandModel = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Contact Details',
                  icon: Icon(Icons.flare),
                ),
                onSaved: (value) {
                  ticket.locContact = value;
                },
              ),
//              TextFormField(
//                decoration: InputDecoration(
//                  labelText: 'Remarks',
//                  icon: Icon(Icons.flare),
//                ),
//                onSaved: (value) {
//                  ticket.remarks = value;
//                },
//              ),
              DateTimeField(
                decoration: InputDecoration(
                  labelText: 'Service Date',
                  icon: Icon(Icons.calendar_today),
                ),
                format: format,
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Contact Details',
                  icon: Icon(Icons.phone),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: _image == null
                      ? Text('No image selected')
                      : Image.file(_image),
                ),
              ),
              SizedBox(
                width: 20.0,
                height: 20.0,
                child: RaisedButton(
                  onPressed: getImage,
                  child: Icon(Icons.add_a_photo),
                ),
              ),
              RaisedButton(
                color: kSubmitButton,
                textColor: kTextButton,
                onPressed: () {
                  print('clicked');
                  validateInputs();
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
