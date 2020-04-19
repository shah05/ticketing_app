import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticketing_app/model/customer.dart';
import 'package:ticketing_app/screens/create_ticket/create_ticket_form_screen.dart';
import 'package:ticketing_app/screens/equipment_check/equipment_result_screen.dart';
import 'package:ticketing_app/service/rest_api.dart';
import 'package:ticketing_app/main.dart';
import 'package:ticketing_app/util/constants.dart';
import 'package:ticketing_app/widgets/redirect_to_login.dart';

class SelectContractScreen extends StatefulWidget {
  @override
  _SelectContractScreenState createState() => _SelectContractScreenState();
}

class _SelectContractScreenState extends State<SelectContractScreen> {
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
        title: Text(
          'Create New Ticket (1/2)',
          style: TextStyle(color: kTextTitle),
        ),
        backgroundColor: kAppBarColor,
        iconTheme: IconThemeData(color: kIconTitle),
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
//            Center(
//              child: ClipRect(
//                child: Banner(
////                  message: "hello",
////                  location: BannerLocation.topEnd,
//                  color: Colors.red,
//                  child: Container(
//                    margin: const EdgeInsets.all(10.0),
//                    color: Colors.yellow,
//                    height: 100,
//                    child: Center(child: Text("Hello, banner!"),),
//                  ),
//                ),
//              ),
//            ),
          Padding(
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
                return RedirectToLogin();
              },
            ),
          ),
        ],
      )
//        child:
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
//              alignedDropdown: true,
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
                    ? Text(
                        'Please select contract ID',
                        style: TextStyle(color: kTextPrimary),
                      )
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
              : Text(dropdownError ?? "", style: kErrorTextStyle),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: SizedBox(
              child: RaisedButton(
                color: kSubmitButton,
                child: Text(
                  'Next',
                  style: TextStyle(color: kTextButton),
                ),
                onPressed: () {
                  if (selectedContract == null) {
                    setState(() {
                      dropdownError = 'Please select an option';
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateTicketFormScreen(
                          contractId: selectedContract,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
