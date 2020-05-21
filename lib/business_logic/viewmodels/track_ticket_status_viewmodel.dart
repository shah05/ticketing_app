import 'package:flutter/widgets.dart';
import 'package:ticketing_app/business_logic/utils/enums.dart';
import 'package:ticketing_app/model/list_ticket.dart';
import 'package:ticketing_app/service/rest_api/rest_api_service.dart';
import '../../service_locator.dart';

class TrackTicketStatusViewModel extends ChangeNotifier {
  RestApiService _apiService = serviceLocator<RestApiService>();
  TrackTicketPresentation trackTicketPresentation = TrackTicketPresentation(
      isTokenExpired: false,
      openTicketUuid: [],
      openTicketNaCode: [],
      openTicketStatus: [],
      openSvcType: [],
      openSvcDate: [],
      closedTicketUuid: [],
      closedTicketNaCode: [],
      closedTicketStatus: [],
      closedSvcType: [],
      closedSvcDate: []);
  List<Ticketlist> _ticketLists;

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
    setViewState(ViewState.LOADING);
    //Get Ticket Status details based on id.
    _ticketLists = await _apiService.getListTicketStatus();
    if (_ticketLists == null) {
      trackTicketPresentation.isTokenExpired = true;
    } else {
      trackTicketPresentation.isTokenExpired = false;
      _prepareTicketStatusPresentation(_ticketLists);
    }

    setViewState(ViewState.LOADED);
  }

  void _prepareTicketStatusPresentation(List<Ticketlist> ticketLists) {
    if (ticketLists != null) {
      for (var ticketList in ticketLists) {
        if (ticketList.status.trim() == "Closed" ||
            ticketList.status.trim() == "Cancelled") {
          //Add details in the list of Strings for Closed Tickets
          trackTicketPresentation.closedTicketUuid.add(ticketList.uuid);
          trackTicketPresentation.closedTicketNaCode.add(ticketList.nacode);
          trackTicketPresentation.closedTicketStatus.add(ticketList.status);
          trackTicketPresentation.closedSvcType.add(ticketList.svctype);
          trackTicketPresentation.closedSvcDate
              .add(_convertDate(ticketList.svcdate));
        } else {
          trackTicketPresentation.openTicketUuid.add(ticketList.uuid);
          trackTicketPresentation.openTicketNaCode.add(ticketList.nacode);
          trackTicketPresentation.openTicketStatus.add(ticketList.status);
          trackTicketPresentation.openSvcType.add(ticketList.svctype);
          trackTicketPresentation.openSvcDate
              .add(_convertDate(ticketList.svcdate));
        }
      }
    } else {
      trackTicketPresentation.openTicketUuid = null;
      trackTicketPresentation.openTicketNaCode = null;
      trackTicketPresentation.openTicketStatus = null;
      trackTicketPresentation.openSvcType = null;
      trackTicketPresentation.openSvcDate = null;
      trackTicketPresentation.closedTicketUuid = null;
      trackTicketPresentation.closedTicketNaCode = null;
      trackTicketPresentation.closedTicketStatus = null;
      trackTicketPresentation.closedSvcType = null;
      trackTicketPresentation.closedSvcDate = null;
    }
  }

  String _convertDate(String date) {
    var formattedDate = DateTime.parse(date).toLocal();

    String year;
    String month;
    String day;
    String hour;
    String minute;
    year = formattedDate.year.toString();
    formattedDate.day < 10
        ? day = '0' + formattedDate.day.toString()
        : day = formattedDate.day.toString();
    formattedDate.month < 10
        ? month = '0' + formattedDate.month.toString()
        : month = formattedDate.month.toString();
    formattedDate.hour < 10
        ? hour = '0' + formattedDate.hour.toString()
        : hour = formattedDate.hour.toString();
    formattedDate.minute < 10
        ? minute = '0' + formattedDate.minute.toString()
        : minute = formattedDate.minute.toString();

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

    return '$day-$month-$year $hour:$minute';
  }
}

class TrackTicketPresentation {
  bool isTokenExpired;

  //Details for all Open Tickets
  List<String> openTicketUuid;
  List<String> openTicketNaCode;
  List<String> openTicketStatus;
  List<String> openSvcType;
  List<String> openSvcDate;

  //Details for all Closed Tickets
  List<String> closedTicketUuid;
  List<String> closedTicketNaCode;
  List<String> closedTicketStatus;
  List<String> closedSvcType;
  List<String> closedSvcDate;

  TrackTicketPresentation(
      {this.isTokenExpired,
      this.openTicketUuid,
      this.openTicketNaCode,
      this.openTicketStatus,
      this.openSvcType,
      this.openSvcDate,
      this.closedTicketUuid,
      this.closedTicketNaCode,
      this.closedTicketStatus,
      this.closedSvcType,
      this.closedSvcDate});
}
