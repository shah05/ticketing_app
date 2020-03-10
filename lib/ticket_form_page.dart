import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class TicketFormPage extends StatefulWidget {
  TicketFormPage({this.title});
  final String title;

  @override
  _TicketFormPageState createState() => _TicketFormPageState();
}

class _TicketFormPageState extends State<TicketFormPage> {
  File _image;

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
      appBar: AppBar(title: Text('Create New Ticket'),),
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
                },),

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
                  )),
            ],
          ),

        ),),
    );
  }

}
