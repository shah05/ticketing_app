import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticketing_app/model/ticket.dart';
import 'dart:io';

import 'package:ticketing_app/util/constants.dart';
import 'package:ticketing_app/screens/create_ticket_status_screen.dart';

class CreateNewTicketScreen extends StatefulWidget {
  @override
  _CreateNewTicketScreenState createState() => _CreateNewTicketScreenState();
}

class _CreateNewTicketScreenState extends State<CreateNewTicketScreen> {
  String probDesc;
  String partNo;
  String serialNo;
  DateTime date;
  String contactNum;
  Ticket ticket = new Ticket();
  final format = DateFormat("dd-MM-yyyy");
  bool _autoValidate = true;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

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
        title: Text('Create New Ticket'),
      ),
      body: new SafeArea(
        child: Form(
          key: _formKey,
//          autovalidate: _autoValidate,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                validator: (value) {
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
                  errorStyle: kErrorTextStyle,
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
                  labelText: 'Client Reference 1',
                  errorStyle: kErrorTextStyle,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please add a reference';
                  }
                  return null;
                },
                onSaved: (value) {
                  ticket.clientRef1 = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Client Reference 2',
                  errorStyle: kErrorTextStyle,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please add a reference';
                  }
                  return null;
                },
                onSaved: (value) {
                  ticket.clientRef2 = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Postal Code',
                  errorStyle: kErrorTextStyle,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please add a postal code';
                  }
                  return null;
                },
                onSaved: (value) {
                  ticket.dcAccessCode = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Equipment Location',
                  errorStyle: kErrorTextStyle,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please key in the equipment location';
                  }
                  return null;
                },
                onSaved: (value) {
                  ticket.eqLoc = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Equipment Serial Number',
                  errorStyle: kErrorTextStyle,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please key in Equipment Serial Number';
                  }
                  return null;
                },
                onSaved: (value) {
                  ticket.eqSerialNo = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Part Number',
                  errorStyle: kErrorTextStyle,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please key in Part Number';
                  }
                  return null;
                },
                onSaved: (value) {
                  ticket.partno = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Brand Model',
                  errorStyle: kErrorTextStyle,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please key in Brand Model';
                  }
                  return null;
                },
                onSaved: (value) {
                  ticket.brandModel = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Contact Details',
                  errorStyle: kErrorTextStyle,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please key in Contact Details';
                  }
                  return null;
                },
                onSaved: (value) {
                  ticket.locContact = value;
                },
              ),
              DateTimeField(
                decoration: InputDecoration(
                  labelText: 'Service Date',
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
                  DateTime currentDate = DateTime(now.year, now.month, now.day);
                  if (value == null) {
                    return 'Please pick a date';
                  } else if (value.isBefore(currentDate)) {
                    return 'Please pick a date later than today';
                  }
                  return null;
                },
                onSaved: (value) {
                  ticket.srSdateTime = value.toString();
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Contact Details',
                  errorStyle: kErrorTextStyle,
                ),
              ),
              SizedBox(
                height: 10.0,
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
