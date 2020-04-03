import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import 'package:ticketing_app/util/constants.dart';

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



  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final format = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Ticket'),
      ),
      body: new SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
              TextFormField(
                maxLines: 4,
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
                onSaved: (value){
                  probDesc = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Part No',
                  icon: Icon(Icons.subdirectory_arrow_right),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Serial No',
                  icon: Icon(Icons.flare),
                ),
              ),
              DateTimeField(
                decoration: InputDecoration(icon: Icon(Icons.calendar_today)),
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
                  // Validate returns true if the form is valid, otherwise false.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.

                   print('Rest api call');
                   print(probDesc);
                  }
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
