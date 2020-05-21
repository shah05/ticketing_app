import 'package:flutter/widgets.dart';
import 'package:ticketing_app/business_logic/utils/enums.dart';
import 'package:ticketing_app/model/contract_detail.dart';
import 'package:ticketing_app/service/rest_api/rest_api_service.dart';

import 'package:ticketing_app/service_locator.dart';

class SelectContractViewModel extends ChangeNotifier {
  RestApiService _apiService = serviceLocator<RestApiService>();
  SelectContractPresentation selectContractPresentation =
      SelectContractPresentation(
    isTokenExpired: false,
    contractUuid: [],
    companyName: [],
    contractStartDate: [],
  );
  List<Contractdetail> _contractdetails;
  ViewState _viewState = ViewState.LOADING;
  //== Methods ==
  ViewState get viewState {
    return _viewState;
  }

  setViewState(ViewState viewState) {
    _viewState = viewState;
    notifyListeners();
  }

  void loadData() async {
    print('load data select contract');
    setViewState(ViewState.LOADING);
    //Get Customer contract details based on id.
    _contractdetails = await _apiService.getContracts();
    if (_contractdetails == null) {
      selectContractPresentation.isTokenExpired = true;
    } else {
      selectContractPresentation.isTokenExpired = false;
      _prepareSelectContractPresentation(_contractdetails);
    }
    setViewState(ViewState.LOADED);
  }

  void _prepareSelectContractPresentation(
      List<Contractdetail> contractDetails) {
    if (contractDetails != null) {
      //Initialize variables
      selectContractPresentation.contractUuid = [];
      selectContractPresentation.companyName = [];
      selectContractPresentation.contractStartDate = [];

      for (var contractDetail in contractDetails) {
        selectContractPresentation.companyName.add(contractDetail.companyName);
        selectContractPresentation.contractUuid
            .add(contractDetail.contractUUID);
        selectContractPresentation.contractStartDate
            .add(_convertDate(contractDetail.startd));
      }
    } else {
      selectContractPresentation.companyName = null;
      selectContractPresentation.contractUuid = null;
      selectContractPresentation.contractStartDate = null;
    }
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
}

class SelectContractPresentation {
  bool isTokenExpired;
  List<String> contractUuid;
  List<String> companyName;
  List<String> contractStartDate;

  SelectContractPresentation(
      {this.isTokenExpired,
      this.contractUuid,
      this.companyName,
      this.contractStartDate});
}
