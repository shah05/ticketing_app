import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketing_app/model/list_ticket.dart';
import 'package:dio/dio.dart';

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
  /// Method that returns the token from Shared Preferences
  /// ----------------------------------------------------------
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<String> _getMobileToken() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(URLS._storageKeyMobileToken) ?? '';
  }

  /// ----------------------------------------------------------
  /// Method that saves the token in Shared Preferences
  /// ----------------------------------------------------------
  static Future<bool> _setMobileToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setString(URLS._storageKeyMobileToken, token);
  }

  /// ----------------------------------------------------------
  /// Method that do an authentication
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
  /// Method that retrieve customer info
  /// ----------------------------------------------------------
  static Future<Customer> getCustomer() async {
    String token = await _getMobileToken();

    final response = await http
        .get('https://tisapi.azurewebsites.net/api/customer', headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token"
    });

    if (response.statusCode == 201) {
      // If the call to the server was successful, parse the JSON.
      final responseJson = json.decode(response.body);
      return Customer.fromJson(responseJson);
    } else {
      // If that call was not successful, throw an error.
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print('Failed to load post');
      return null;
    }
  }

  /// ----------------------------------------------------------
  /// Method that retrieve list of tickets by status
  /// ----------------------------------------------------------

  static Future<ListTicket> getListTicketStatus() async {
    String token = await _getMobileToken();
//    token =
//        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ2YS52aWN0b3J3YW5AZ21haWwuY29tIiwianRpIjoiZDBiYmQ1YTYtYmVlYS00OTAwLWIxNWItNDkxNDgwMjA3N2Y3IiwidW5pcXVlX25hbWUiOiJ2YS52aWN0b3J3YW5AZ21haWwuY29tIiwiZW1haWwiOiJ2YS52aWN0b3J3YW5AZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQ3VzdG9tZXJSZXAiLCJleHAiOjE1ODYwMTQ0NTksImlzcyI6Ik1WUyIsImF1ZCI6IkFwaVVzZXIifQ.ytKIP8o-49sPUfwvkgNiaikCwBW_TmoESqYSlNPQirU';

    var url = Uri.parse(
        'https://webapi168.azurewebsites.net/api/ticket/GetTicketListByStatus');
    var request = new http.MultipartRequest('POST', url);
    request.headers['authorization'] = 'Bearer $token';
    request.fields['statustype'] = 'All Status';

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
//      print('success');
      // If the call to the server was successful, parse the JSON.
//      print('RESPONSE BODY : ${response.body}');
      final responseJson = json.decode(response.body);
//      print('RESPONSE JSON : ${response.body}');

      return ListTicket.fromJson(responseJson);
    } else {
      // If that call was not successful, throw an error.
      print('Response status: ${response.statusCode}');
//      print('Response body: ${response.body}');
      print('Failed to load post');
      return null;
    }
  }

  static Future<TicketById> getTicketDetail(String uuid) async {
//    print('here getListTicketDetail');
    String token = await _getMobileToken();
//    token =
//        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ2YS52aWN0b3J3YW5AZ21haWwuY29tIiwianRpIjoiZDBiYmQ1YTYtYmVlYS00OTAwLWIxNWItNDkxNDgwMjA3N2Y3IiwidW5pcXVlX25hbWUiOiJ2YS52aWN0b3J3YW5AZ21haWwuY29tIiwiZW1haWwiOiJ2YS52aWN0b3J3YW5AZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQ3VzdG9tZXJSZXAiLCJleHAiOjE1ODYwMTQ0NTksImlzcyI6Ik1WUyIsImF1ZCI6IkFwaVVzZXIifQ.ytKIP8o-49sPUfwvkgNiaikCwBW_TmoESqYSlNPQirU';
    var url = Uri.parse(
        'https://webapi168.azurewebsites.net/api/ticket/GetTicketById');
    var request = new http.MultipartRequest('POST', url);
    request.headers['authorization'] = 'Bearer $token';
    request.fields['id'] = uuid;

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
}

class Customer {
  final String status;
  final String usertype;
  final List<Contractdetail> contractdetails;

  Customer({this.status, this.usertype, this.contractdetails});

  factory Customer.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['contractdetails'] as List;
    print(list.runtimeType); //returns List<dynamic>
    List<Contractdetail> contractdetailslist =
        list.map((i) => Contractdetail.fromJson(i)).toList();

    var customer = Customer(
        status: parsedJson['status'],
        usertype: parsedJson['usertype'],
        contractdetails: contractdetailslist);
    return customer;
  }
}

class Contractdetail {
  final String companyName;
  final String contractUUID;
  final String rolename;
  final bool usetoken;
  final String startd;
  final String endd;

  Contractdetail(
      {this.companyName,
      this.contractUUID,
      this.rolename,
      this.usetoken,
      this.startd,
      this.endd});

  factory Contractdetail.fromJson(Map<String, dynamic> parsedJson) {
    return Contractdetail(
        companyName: parsedJson['companyName'],
        contractUUID: parsedJson['contractUUID'],
        rolename: parsedJson['rolename'],
        usetoken: parsedJson['usetoken'],
        startd: parsedJson['startd'],
        endd: parsedJson['endd']);
  }
}
