import 'dart:convert';
import 'dart:io';
import 'package:ticketing_app/model/create_ticket.dart';
import 'package:ticketing_app/model/customer.dart';
import 'package:ticketing_app/model/equipment.dart';
import 'package:ticketing_app/model/list_ticket.dart';
import 'package:ticketing_app/model/service_type.dart';
import 'package:ticketing_app/model/ticket.dart';
import 'package:ticketing_app/model/ticket_by_id.dart';
import 'package:ticketing_app/service/rest_api/rest_api.dart';
import 'package:http/http.dart' as http;
import 'package:ticketing_app/service/storage/storage_service.dart';

import '../../service_locator.dart';

class RestApiServiceImplementation implements RestApiService {
  // the URL of the Web Server
  static const String BASE_URL = 'https://webapi168.azurewebsites.net';
  StorageService _storageService = serviceLocator<StorageService>();

  /// ----------------------------------------------------------
  /// Method that creates a new ticket.
  /// ----------------------------------------------------------
  @override
  Future<CreateTicket> createTicket(Ticket ticket) async {
//    print('title : ${ticket.title}');
//    print('description : ${ticket.description}');
//    print('ref1 : ${ticket.clientRef1}');
//    print('ref2 : ${ticket.clientRef2}');
//    print('postal : ${ticket.dcAccessCode}');
//    print('equipment loc : ${ticket.eqLoc}');
//    print('equipment serialno : ${ticket.eqSerialNo}');
//    print('Part no : ${ticket.partno}');
//    print('brand model : ${ticket.brandModel}');
//    print('contact details : ${ticket.locContact}');
//    print('svc date : ${ticket.srSdateTime}');
//    print('svc date : ${ticket.srSdateTime}');
//    print('Attachments : ${ticket.attachments}');

    CreateTicket t;
    String token = await _storageService.getMobileToken();
    var url = Uri.parse(
        'https://webapi168.azurewebsites.net/api/ticket/CreateTicket');
    var request = new http.MultipartRequest('POST', url);
    request.headers['authorization'] = 'Bearer $token';
    request.fields['svctypeid'] = "1";
    request.fields['contractUUID'] = ticket.contract.uuid;
    if (ticket.title != null) {
      request.fields['subject'] = ticket.title;
//      request.fields['subject'] = "Subject";
    }
    if (ticket.clientRef1 != null) {
      request.fields['ref1'] = ticket.clientRef1;
//      request.fields['ref1'] = "shahidan";
    }
    if (ticket.clientRef2 != null) {
      request.fields['ref2'] = ticket.clientRef2;
    }
    if (ticket.dcAccessCode != null) {
      request.fields['postalcode'] = ticket.dcAccessCode;
    }
    if (ticket.description != null) {
      request.fields['description'] = ticket.description;
    }
    if (ticket.eqLoc != null) {
      request.fields['eqloc'] = ticket.eqLoc;
    }
    if (ticket.eqSerialNo != null) {
      request.fields['eqserialno'] = ticket.eqSerialNo;
    }
    if (ticket.locContact != null) {
      request.fields['contactdetails'] = ticket.locContact;
    }
    if (ticket.partno != null) {
      request.fields['partno'] = ticket.partno;
    }
    if (ticket.srSdateTime != null) {
      request.fields['svcdate'] = ticket.srSdateTime;
    }
    if (ticket.brandModel != null) {
      request.fields['brandmodel'] = ticket.brandModel;
    }
    if (ticket.attachments != null) {
      for (var a in ticket.attachments) {
        request.files
            .add(await http.MultipartFile.fromPath(a.fileName, a.fileName));
      }
    }

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      t = CreateTicket.fromJson(responseJson);
      t.httpCode = response.statusCode;
      return t;
    } else {
      /// Response code = 400 : Bad Request (errors in the fields)
      /// Response code = 401 : Bad Authorization (Token expired)
      print(response.body);
      t = CreateTicket();
      t.httpCode = response.statusCode;
      return t;
    }
  }

  /// ----------------------------------------------------------
  /// Method that perform authentication operation.
  /// ----------------------------------------------------------
  @override
  Future<String> doAuthentication(userEmail, userPass) async {
    String _status = "ERROR";

    Map params = {"UserName": userEmail, "Password": userPass};

    //encode params to JSON
    var body = json.encode(params);

    final response = await http.post('$BASE_URL/auth/createtoken',
        body: body, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 201) {
      //encode Map to JSON
      Map data = json.decode(response.body);
      _status = data["status"];

      if (_status == "1") {
        await _storageService.setMobileToken(data["token"]);
      } else {
        await _storageService.setMobileToken("");
      }
      return _status;
    } else {
      return "ERROR";
    }
  }

  /// ----------------------------------------------------------
  /// Method that retrieve customer and contract info.
  /// ----------------------------------------------------------
  @override
  Future<Customer> getContracts() async {
    String token = await _storageService.getMobileToken();

    final response = await http.get(
        'https://webapi168.azurewebsites.net/api/customer/GetContractsbyUser',
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer $token"
        });
    print('getcontracts');
    if (response.statusCode == 201) {
      // If the call to the server was successful, parse the JSON.
      final responseJson = json.decode(response.body);
      Customer c = Customer.fromJson(responseJson);
      c.httpCode = response.statusCode;
      return c;
    } else {
      // If that call was not successful, throw an error.
      Customer c = Customer();
      c.httpCode = response.statusCode;
      return c;
    }
  }

  /// ----------------------------------------------------------
  /// Method that retrieve equipment info based on contract.
  /// ----------------------------------------------------------
  @override
  Future<Equipment> getEquipmentInfo(String contractID, String serialNo) async {
    String token = await _storageService.getMobileToken();
    Equipment e;
    var url = Uri.parse(
        'https://webapi168.azurewebsites.net/api/ticket/ContractEquipCheck');
    var request = new http.MultipartRequest('POST', url);
    request.headers['authorization'] = 'Bearer $token';
    request.fields['contractUUID'] = contractID;
    request.fields['serialno'] = serialNo;

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      e = Equipment.fromJson(responseJson);
      e.httpCode = response.statusCode;
      return e;
    } else {
      e = Equipment();
      e.httpCode = response.statusCode;
      return e;
    }
  }

  /// ----------------------------------------------------------
  /// Method that retrieve list of tickets by status.
  /// ----------------------------------------------------------
  @override
  Future<List<Ticketlist>> getListTicketStatus() async {
    print('getListTicketStatus');
    String token = await _storageService.getMobileToken();
//    token='';
    List<Ticketlist> _ticketLists;
    var url = Uri.parse(
        'https://webapi168.azurewebsites.net/api/ticket/GetTicketListByStatus');
    var request = new http.MultipartRequest('POST', url);
    request.headers['authorization'] = 'Bearer $token';
    request.fields['statustype'] = 'All Status';

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
//      print('RESPONSE JSON : ${response.body}');
//      ListTicket l = ListTicket.fromJson(responseJson);
      if (responseJson['ticketlist'] != null) {
        _ticketLists = new List<Ticketlist>();
        responseJson['ticketlist'].forEach((v) {
          _ticketLists.add(new Ticketlist.fromJson(v));
        });

        return _ticketLists;
      }
      else {
        return null;
      }
//      l.httpCode = response.statusCode;
////      return ListTicket.fromJson(responseJson);
//      return l;
//    } else {
////      // If that call was not successful, throw an error.
//      print('Response status: ${response.statusCode}');
//      ListTicket l = new ListTicket();
//      l.httpCode = response.statusCode;
////      return null;
//      return l;
//    }
    }
  }

  /// ----------------------------------------------------------
  /// Method that retrieve ticket details by Id.
  /// ----------------------------------------------------------

    @override
    Future<Ticket> getTicketDetail(String uuid) async {
      String token = await _storageService.getMobileToken();
//    token='';
      var url = Uri.parse(
          'https://webapi168.azurewebsites.net/api/ticket/GetTicketById');
      var request = new http.MultipartRequest('POST', url);
      request.headers['authorization'] = 'Bearer $token';
      request.fields['id'] = uuid;

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
//    print(response.statusCode);
      if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON.
        final responseJson = json.decode(response.body);
        TicketById t = TicketById.fromJson(responseJson);
        Ticket ticket = Ticket.fromJson(responseJson['ticket']);
        return ticket;
        return responseJson['ticket'];
        return responseJson['ticket'];
//      t.httpCode = response.statusCode;
////      return TicketById.fromJson(responseJson);
//      return t;
      } else {
        return null;
//      // If that call was not successful, throw an error.
//      print('Response status: ${response.statusCode}');
//      print('Failed to load post');
//      TicketById t = TicketById();
//      t.httpCode = response.statusCode;
////      return TicketById.fromJson(responseJson);
//      return t;
      }
    }


    @override
    Future<List<Svctypes>> getServiceType() async {
      String token = await _storageService.getMobileToken();
      List<Svctypes> svcTypes;
      final response = await http.get(
          'https://webapi168.azurewebsites.net/api/customer/GetServiceType',
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer $token"
          });
      if (response.statusCode == 201) {
        // If the call to the server was successful, parse the JSON.
        final responseJson = json.decode(response.body);
        if (responseJson['svctypes'] != null) {
          svcTypes = new List<Svctypes>();
          responseJson['svctypes'].forEach((v) {
            svcTypes.add(new Svctypes.fromJson(v));
          });
          return svcTypes;
        } else
          return null;
      } else
        return null;
    }
//
}





