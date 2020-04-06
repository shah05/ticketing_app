import 'package:flutter/material.dart';

class EquipmentCheckSreen extends StatefulWidget {
  @override
  _EquipmentCheckSreenState createState() => _EquipmentCheckSreenState();
}

class _EquipmentCheckSreenState extends State<EquipmentCheckSreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipment Check'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Equipment Serial Number',
                    icon: Icon(Icons.search),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter correct serial number e.g (1234)';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false
                      // otherwise.
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, display a Snackbar.
                        print('hello');
                      }
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
