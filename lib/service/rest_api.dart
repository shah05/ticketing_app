import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketing_app/model/equipment.dart';
import 'package:ticketing_app/model/list_ticket.dart';
import 'package:dio/dio.dart';
import 'package:ticketing_app/model/customer.dart';
import 'package:ticketing_app/model/ticket.dart';

import 'package:ticketing_app/model/ticket_by_id.dart';

class URLS {
  // the URL of the Web Server
//  static const String BASE_URL = 'https://tisapi.azurewebsites.net';
  static const String BASE_URL = 'https://webapi168.azurewebsites.net';

  // the storage key for the token
  static const String _storageKeyMobileToken = "token";
}

class ApiService {
  /// ----------------------------------------------------------
  /// Method that returns the token from Shared Preferences.
  /// ----------------------------------------------------------
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<String> _getMobileToken() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(URLS._storageKeyMobileToken) ?? '';
  }

  /// ----------------------------------------------------------
  /// Method that saves the token in Shared Preferences.
  /// ----------------------------------------------------------
  static Future<bool> _setMobileToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setString(URLS._storageKeyMobileToken, token);
  }

  /// ----------------------------------------------------------
  /// Method that perform authentication operation.
  /// ----------------------------------------------------------
  static Future<String> doAuthentication(userEmail, userPass) async {
    String _status = "ERROR";

    Map params = {"UserName": userEmail, "Password": userPass};

    //encode params to JSON
    var body = json.encode(params);

    final response = await http.post('${URLS.BASE_URL}/auth/createtoken',
        body: body, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 201) {
      //encode Map to JSON
      Map data = json.decode(response.body);
      _status = data["status"];

      if (_status == "1") {
        await _setMobileToken(data["token"]);
      } else {
        await _setMobileToken("");
      }

      return _status;
    } else {
      return "ERROR";
    }
  }

  /// ----------------------------------------------------------
  /// Method that retrieve customer and contract info.
  /// ----------------------------------------------------------
  static Future<Customer> getContracts() async {
    String token = await _getMobileToken();

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
  static Future<Equipment> getEquipmentInfo(
      String contractID, String serialNo) async {
    String token = await _getMobileToken();
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

  static Future<ListTicket> getListTicketStatus() async {
    print('getListTicketStatus');
    String token = await _getMobileToken();
//    token='';
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
      ListTicket l = ListTicket.fromJson(responseJson);
      l.httpCode = response.statusCode;
//      return ListTicket.fromJson(responseJson);
      return l;
    } else {
//      // If that call was not successful, throw an error.
      print('Response status: ${response.statusCode}');
////      print('Response body: ${response.body}');
//      print('Failed to load post');
//      print('fail');
//      return null;
      ListTicket l = new ListTicket();
      l.httpCode = response.statusCode;
//      return null;
      return l;
    }
  }

  /// ----------------------------------------------------------
  /// Method that retrieve ticket details by Id.
  /// ----------------------------------------------------------

  static Future<TicketById> getTicketDetail(String uuid) async {
    String token = await _getMobileToken();
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
      t.httpCode = response.statusCode;
//      return TicketById.fromJson(responseJson);
      return t;
    } else {
      // If that call was not successful, throw an error.
      print('Response status: ${response.statusCode}');
      print('Failed to load post');
      TicketById t = TicketById();
      t.httpCode = response.statusCode;
//      return TicketById.fromJson(responseJson);
      return t;
    }
  }

  /// ----------------------------------------------------------
  /// Method that creates a new ticket.
  /// ----------------------------------------------------------

  static Future<TicketById> createTicket(Ticket ticket) async {
    String token = await _getMobileToken();
    var url = Uri.parse(
        'https://webapi168.azurewebsites.net/api/ticket/CreateTicket');
    var request = new http.MultipartRequest('POST', url);
    request.headers['authorization'] = 'Bearer $token';
//    request.fields['id'] = uuid;

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
//    print(response.statusCode);
    if (response.statusCode == 200) {
//      print('RESPONSE BODY : ${response.body}');
      // If the call to the server was successful, parse the JSON.
      final responseJson = json.decode(response.body);

//      print('RESPONSE JSON : ${responseJson}');
//      print('==JSON BODY==');
//      print(responseJson['status']);
//      print(responseJson['ticket']);
//      print(responseJson['ticket']['naCode']);
//      print(responseJson['ticket']['contractId']);
//      print(responseJson['ticket']['contract']);
      TicketById t1 = TicketById.fromJson(responseJson);
//      print('==JSON OBJECT==');
//      print(t1.status);
//      print(t1.ticket);
//      print(t1.ticket.contractId);
      return TicketById.fromJson(responseJson);
    } else {
      // If that call was not successful, throw an error.
      print('Response status: ${response.statusCode}');
//      print('Response body: ${response.body}');
      print('Failed to load post');
      return null;
    }
  }

//  /// ----------------------------------------------------------
//  /// Method that retrieve contract id by customer.
//  /// ----------------------------------------------------------
//
//  static Future<TicketById> getContracts(Ticket ticket) async {
//    String token = await _getMobileToken();
//
//    final response = await http
//        .get('https://tisapi.azurewebsites.net/api/customer/GetContractsbyUser', headers: {
//      HttpHeaders.contentTypeHeader: "application/json",
//      HttpHeaders.authorizationHeader: "Bearer $token"
//    });
//
//    if (response.statusCode == 201) {
//      // If the call to the server was successful, parse the JSON.
//      final responseJson = json.decode(response.body);
//      return Customer.fromJson(responseJson);
//    } else {
//      // If that call was not successful, throw an error.
//      print('Response status: ${response.statusCode}');
//      print('Response body: ${response.body}');
//      print('Failed to load post');
//      return null;
//    }
//
//  }
}
