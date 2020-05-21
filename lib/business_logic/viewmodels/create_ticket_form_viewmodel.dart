import 'package:flutter/widgets.dart';
import 'package:ticketing_app/business_logic/utils/enums.dart';
import 'package:ticketing_app/model/service_type.dart';
import 'package:ticketing_app/service/rest_api/rest_api.dart';
import 'package:ticketing_app/service_locator.dart';

class CreateTicketFormViewModel extends ChangeNotifier {
  RestApiService _restApiService = serviceLocator<RestApiService>();
  CreateTicketFormPresentation createTicketFormPresentation =
      CreateTicketFormPresentation(
    serviceTypes: [],
  );
  List<Svctypes> svcTypes;

  ViewState _viewState = ViewState.LOADING;
  //== Methods ==
  ViewState get viewState {
    return _viewState;
  }

  setViewState(ViewState viewState) {
    _viewState = viewState;
    notifyListeners();
  }

  void loadData() {
    setViewState(ViewState.LOADING);
    //Get Customer contract details based on id.
    _contractdetails = await _apiService.getContracts();
    setViewState(ViewState.LOADED);
  }

  void _prepareCreateTicketFormPresentation() {}
}

class CreateTicketFormPresentation {
  List<String> serviceTypes;
  CreateTicketFormPresentation({this.serviceTypes});
}
