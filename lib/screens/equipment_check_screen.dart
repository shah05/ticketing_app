import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticketing_app/model/customer.dart';
import 'package:ticketing_app/screens/equipment_result_screen.dart';
import 'package:ticketing_app/service/rest_api.dart';
import 'package:ticketing_app/main.dart';
import 'package:ticketing_app/util/constants.dart';

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
  String selectedContract;
  String dropdownError;
  String serialNoInput;
  bool a = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKey = new GlobalKey<FormState>();
    widget.customer.contractdetails.forEach((c) {
      contractOptions.add(c.contractUUID);
    });
    selectedContract = null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Container(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                underline: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color:
                              dropdownError == null ? Colors.grey : Colors.red),
                    ),
                  ),
                ),
                isExpanded: true,
                hint: selectedContract == null
                    ? Text('Please select contract ID')
                    : Text(
                        selectedContract,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black),
                      ),
                items: contractOptions.map((String contractId) {
                  return new DropdownMenuItem<String>(
                    value: contractId,
                    child: new Text(contractId),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedContract = value;
                    dropdownError = null;
                  });
                },
              ),
            ),
          ),
          dropdownError == null
              ? SizedBox.shrink()
              : Text(dropdownError ?? "",
                  style: kErrorTextStyle),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Equipment Serial Number',
                errorStyle: kErrorTextStyle),
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter correct serial number e.g (1234)';
              }
              serialNoInput = value;
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                bool isValid = _formKey.currentState.validate();

                if (selectedContract == null) {
                  setState(() {
                    dropdownError = 'Please select an option';
                    isValid = false;
                  });
                }

                if (isValid) {
                  //navigate to new page
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EquipmentResultScreen(
                                contractId: selectedContract,
                                serialNo: serialNoInput,
                              )));
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
