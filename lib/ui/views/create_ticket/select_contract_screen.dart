import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_app/business_logic/utils/enums.dart';
import 'package:ticketing_app/business_logic/viewmodels/select_contract_viewmodel.dart';
import 'package:ticketing_app/model/contract_detail.dart';
import 'package:ticketing_app/model/customer.dart';
import 'package:ticketing_app/screens/create_ticket/create_ticket_form_screen.dart';
import 'package:ticketing_app/service/rest_api.dart';
import 'package:ticketing_app/service_locator.dart';
import 'package:ticketing_app/util/constants.dart';
import 'package:ticketing_app/widgets/redirect_to_login.dart';
import 'package:ticketing_app/widgets/top_banner.dart';

class SelectContractScreen extends StatefulWidget {
  @override
  _SelectContractScreenState createState() => _SelectContractScreenState();
}

class _SelectContractScreenState extends State<SelectContractScreen> {
  Future<Customer> customerApiResult;
  SelectContractViewModel viewModel = serviceLocator<SelectContractViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewModel,
        child: Consumer<SelectContractViewModel>(
          builder: (context, model, child) => Scaffold(
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  TopBanner(
                    isBack: true,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: model.viewState == ViewState.LOADING
                          ? Container(
                              alignment: FractionalOffset.center,
                              child: CircularProgressIndicator())
                          : model.selectContractPresentation.isTokenExpired
                              ? RedirectToLogin()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      'Select Contract',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    //==== Customer Contracts====
                                    model.selectContractPresentation
                                                .contractUuid ==
                                            null
                                        ? Center(
                                            child: Text(
                                                'Error listing customer contracts'),
                                          )
                                        : Expanded(
                                            child: ListView.builder(
                                              itemCount: model
                                                  .selectContractPresentation
                                                  .contractUuid
                                                  .length,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 10.0),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                      border: Border.all(
                                                          color: Colors.grey)),
                                                  padding: EdgeInsets.all(20.0),
                                                  height: 170.0,
                                                  width: double.infinity,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        model
                                                            .selectContractPresentation
                                                            .companyName[index],
                                                        style: TextStyle(
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      Text(
                                                          'Start date: ${model.selectContractPresentation.contractStartDate[index]}'),
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
                                                                contractId: model
                                                                    .selectContractPresentation
                                                                    .contractUuid[index],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Text(
                                                          'Log New Fault Calls or Service Request',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                  ],
                                ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
