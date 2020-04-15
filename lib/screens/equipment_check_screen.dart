import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticketing_app/model/customer.dart';
import 'package:ticketing_app/service/rest_api.dart';
import 'package:ticketing_app/main.dart';

class EquipmentCheckScreen extends StatefulWidget {
  @override
  _EquipmentCheckScreenState createState() => _EquipmentCheckScreenState();
}

class _EquipmentCheckScreenState extends State<EquipmentCheckScreen> {
  Future<Customer> customerApiResult;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    customerApiResult = ApiService.getContracts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipment Check'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: FutureBuilder(
            future: customerApiResult,
            builder: (context, snapshot) {
              Customer customer = snapshot.data;
              if (customer == null) {
                return Container(
                  alignment: FractionalOffset.center,
                  child: CircularProgressIndicator(),
                );
              }
              if (customer.httpCode == 201) {
                return BuildEquipmentCheck(customer: customer);
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
        ),
      ),
    );
  }
}

class BuildEquipmentCheck extends StatefulWidget {
  final Customer customer;

  const BuildEquipmentCheck({this.customer});

  @override
  _BuildEquipmentCheckState createState() => _BuildEquipmentCheckState();
}

class _BuildEquipmentCheckState extends State<BuildEquipmentCheck> {
  GlobalKey<FormState> _formKey;
  List<String> contractOptions = [];
  String selectedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKey = new GlobalKey<FormState>();
    widget.customer.contractdetails.forEach((c) {
      contractOptions.add(c.contractUUID);
    });
    selectedUser = '';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                underline: Container(
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey),),
                  ),
                ),
                isExpanded: true,
                hint: Text('Please select contract ID'),
                items: contractOptions.map((String contractId) {
                  return new DropdownMenuItem<String>(
                    value: contractId,
                    child: new Text(contractId),

                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
          ),

//          DropdownButton<String>(
//            hint: Text('Select Contract ID'),
//            value: selectedUser,
//            onChanged: (String value) {
//              setState(() {
//                selectedUser = value;
//              });
//            },
//            items: contractOptions.map((String contractID) {
//              return DropdownMenuItem<String>(
//                value: contractID,
//                child: Text(contractID),
//              );
//            }),
//          ),
          SizedBox(
            height: 10.0,
          ),
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
                  for (var i in widget.customer.contractdetails) {
                    print(i.contractUUID);
                  }
                  print(widget.customer.usertype);
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
