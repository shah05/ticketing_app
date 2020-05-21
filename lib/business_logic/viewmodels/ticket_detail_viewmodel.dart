import 'package:flutter/widgets.dart';
import 'package:ticketing_app/business_logic/utils/enums.dart';
import 'package:ticketing_app/model/service_type.dart';
import 'package:ticketing_app/model/ticket.dart';
import 'package:ticketing_app/service/rest_api/rest_api_service.dart';
import 'package:ticketing_app/service_locator.dart';

class TicketDetailViewModel extends ChangeNotifier {
  RestApiService _apiService = serviceLocator<RestApiService>();
  Ticket _ticket;
  List<Svctypes> _svcTypes;
  TicketDetailPresentation ticketDetailPresentation = TicketDetailPresentation(
      attachmentNames: [],
      attachmentDates: [],
      attachmentUrls: [],
      messageDate: [],
      messageOwner: [],
      messageAction: [],
      messageContent: []);
  ViewState _viewState = ViewState.LOADING;

  //== Methods ==
  ViewState get viewState {
    return _viewState;
  }

  setViewState(ViewState viewState) {
    _viewState = viewState;
    notifyListeners();
  }

  void loadData(String uuid) async {
    //Initially ViewState is LOADING.
    setViewState(ViewState.LOADING);
    //Get Ticket details based on id.
    _ticket = await _apiService.getTicketDetail(uuid);
    //Get Service Type to derive from ticket id.
    _svcTypes = await _apiService.getServiceType();
    //Get list of URLs for attachment download.
    if (_ticket == null) {
      ticketDetailPresentation.isTokenExpired = true;
    } else {
      ticketDetailPresentation.isTokenExpired = false;
      _preparePresentation(_ticket);
    }
    //Change to LOADED and notify listeners.
    setViewState(ViewState.LOADED);
  }

  void _preparePresentation(Ticket ticket) {
    ticket.naCode == null || ticket.naCode.isEmpty
        ? ticketDetailPresentation.naCode = 'NA'
        : ticketDetailPresentation.naCode = ticket.naCode;
    ticket.eqSerialNo == null || ticket.eqSerialNo.isEmpty
        ? ticketDetailPresentation.equipSerialNo = 'NA'
        : ticketDetailPresentation.equipSerialNo = ticket.eqSerialNo;
    ticket.partno == null || ticket.partno.isEmpty
        ? ticketDetailPresentation.partNo = 'NA'
        : ticketDetailPresentation.partNo = ticket.partno;
    //Get svcType
    ticketDetailPresentation.svcType = 'NA';
    for (var type in _svcTypes) {
      if (ticket.svcTypeId == type.id) {
        ticketDetailPresentation.svcType = type.description;
        break;
      }
    }
    ticket.srSdateTime == null || ticket.srSdateTime.isEmpty
        ? ticketDetailPresentation.svcDate = 'NA'
        : ticketDetailPresentation.svcDate = _convertDate(ticket.srSdateTime);

    ticket.title == null || ticket.title.isEmpty
        ? ticketDetailPresentation.subject = 'NA'
        : ticketDetailPresentation.subject = ticket.title;
    ticket.description == null || ticket.description.isEmpty
        ? ticketDetailPresentation.description = 'NA'
        : ticketDetailPresentation.description = ticket.description;
    ticket.locContact == null || ticket.locContact.isEmpty
        ? ticketDetailPresentation.contactDetails = 'NA'
        : ticketDetailPresentation.contactDetails = ticket.locContact;
    ticket.eqLoc == null || ticket.eqLoc.isEmpty
        ? ticketDetailPresentation.equipLocation = 'NA'
        : ticketDetailPresentation.equipLocation = ticket.eqLoc;
    ticket.dcAccessCode == null || ticket.dcAccessCode.isEmpty
        ? ticketDetailPresentation.postalCode = 'NA'
        : ticketDetailPresentation.postalCode = ticket.dcAccessCode;
    ticket.brandModel == null || ticket.brandModel.isEmpty
        ? ticketDetailPresentation.brandModel = 'NA'
        : ticketDetailPresentation.brandModel = ticket.brandModel;
    ticket.remarks == null || ticket.remarks.isEmpty
        ? ticketDetailPresentation.remarks = 'NA'
        : ticketDetailPresentation.remarks = ticket.remarks;
    ticket.clientRef1 == null || ticket.clientRef1.isEmpty
        ? ticketDetailPresentation.clientRef1 = 'NA'
        : ticketDetailPresentation.clientRef1 = ticket.clientRef1;
    ticket.clientRef2 == null || ticket.clientRef2.isEmpty
        ? ticketDetailPresentation.clientRef2 = 'NA'
        : ticketDetailPresentation.clientRef2 = ticket.clientRef2;

    //Attachments
    if (_ticket.attachments.length != 0) {
      ticketDetailPresentation.attachmentNames = [];
      ticketDetailPresentation.attachmentDates = [];

      for (var attachment in _ticket.attachments) {
        print('filename');
        print(attachment.fileName);
        ticketDetailPresentation.attachmentNames.add(attachment.fileName);
        ticketDetailPresentation.attachmentDates
            .add(_convertDate(attachment.createdon));
//        ticketDetailPresentation.attachmentUrls.add()
      }
    } else {
      ticketDetailPresentation.attachmentNames = null;
      ticketDetailPresentation.attachmentUrls = null;
      ticketDetailPresentation.attachmentDates = null;
    }

    //Message Logs
    if (_ticket.msgLogs.length != 0) {
      ticketDetailPresentation.messageDate = [];
      ticketDetailPresentation.messageOwner = [];
      ticketDetailPresentation.messageAction = [];
      ticketDetailPresentation.messageContent = [];

      for (var msg in _ticket.msgLogs) {
        ticketDetailPresentation.messageDate.add(_convertDate(msg.createdon));
        ticketDetailPresentation.messageOwner.add(msg.createdby);
        ticketDetailPresentation.messageAction.add(msg.action);
        ticketDetailPresentation.messageContent.add(msg.message);
      }
    } else {
      ticketDetailPresentation.messageDate = null;
      ticketDetailPresentation.messageOwner = null;
      ticketDetailPresentation.messageAction = null;
      ticketDetailPresentation.messageContent = null;
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

class TicketDetailPresentation {
  String naCode;
  String equipSerialNo;
  String partNo;
  String svcType;
  String svcDate;
  String subject;
  String description;
  String contactDetails;
  String equipLocation;
  String postalCode;
  String brandModel;
  String remarks;
  String clientRef1;
  String clientRef2;
  bool isTokenExpired;

  //Attachments info.
  List<String> attachmentNames;
  List<String> attachmentDates;
  List<String> attachmentUrls;

  //Message info
  List<String> messageDate;
  List<String> messageOwner;
  List<String> messageAction;
  List<String> messageContent;

  TicketDetailPresentation(
      {this.isTokenExpired,
      this.naCode,
      this.equipSerialNo,
      this.partNo,
      this.svcType,
      this.svcDate,
      this.subject,
      this.description,
      this.contactDetails,
      this.equipLocation,
      this.postalCode,
      this.brandModel,
      this.remarks,
      this.clientRef1,
      this.clientRef2,
      this.attachmentNames,
      this.attachmentDates,
      this.attachmentUrls,
      this.messageDate,
      this.messageOwner,
      this.messageAction,
      this.messageContent});
}
