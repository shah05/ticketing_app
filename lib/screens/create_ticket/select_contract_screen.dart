import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticketing_app/model/contract_detail.dart';
import 'package:ticketing_app/model/customer.dart';
import 'package:ticketing_app/screens/create_ticket/create_ticket_form_screen.dart';
import 'package:ticketing_app/service/rest_api.dart';
import 'package:ticketing_app/util/constants.dart';
import 'package:ticketing_app/widgets/redirect_to_login.dart';
import 'package:ticketing_app/widgets/top_banner.dart';

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

  List<Widget> buildContractWidgets(List<Contractdetail> contracts) {
    List<Widget> contractWidgets = [];
    for (var contract in contracts) {
      contractWidgets.add(Container(
        margin: EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: Colors.grey)),
        padding: EdgeInsets.all(20.0),
        height: 200.0,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              contract.companyName,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('Start date: ${contract.startd}'),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              color: kSubmitButton,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateTicketFormScreen(
                      contractId: contract.contractUUID,
                    ),
                  ),
                );
              },
              child: Text(
                'Log New Fault Calls or Service Request',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ));
    }
    return contractWidgets;
  }

  String _convertDate(String date) {
    var formattedDate = DateTime.parse(date).toLocal();

    String year;
    String month;
    String day;
    year = formattedDate.year.toString();
    formattedDate.day < 10
        ? day = '0' + formattedDate.day.toString()
        : day = formattedDate.day.toString();
    formattedDate.month < 10
        ? month = '0' + formattedDate.month.toString()
        : month = formattedDate.month.toString();

    switch (int.parse(month)) {
      case (1):
        month = 'Jan';
        break;
      case (2):
        month = 'Feb';
        break;
      case (3):
        month = 'Mar';
        break;
      case (4):
        month = 'Apr';
        break;
      case (5):
        month = 'May';
        break;
      case (6):
        month = "Jun";
        break;
      case (7):
        month = "Jul";
        break;
      case (8):
        month = "Aug";
        break;
      case (9):
        month = "Sep";
        break;
      case (10):
        month = 'Oct';
        break;
      case (11):
        month = 'Nov';
        break;
      case (12):
        month = 'Dec';
    }

    return '$day-$month-$year';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          TopBanner(
            isBack: true,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Select Contract',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: customer.contractdetails.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(color: Colors.grey)),
                                padding: EdgeInsets.all(20.0),
                                height: 170.0,
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      customer
                                          .contractdetails[index].companyName,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                        'Start date: ${_convertDate(customer.contractdetails[index].startd)}'),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    RaisedButton(
                                      color: kSubmitButton,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CreateTicketFormScreen(
                                              contractId: customer
                                                  .contractdetails[index]
                                                  .contractUUID,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Log New Fault Calls or Service Request',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    );
                  }
                  return RedirectToLogin();
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}
