import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketing_app/model/create_ticket.dart';
import 'package:ticketing_app/model/equipment.dart';
import 'package:ticketing_app/model/list_ticket.dart';
import 'package:ticketing_app/model/customer.dart';
import 'package:ticketing_app/model/service_type.dart';
import 'package:ticketing_app/model/ticket.dart';
import 'package:path/path.dart' as fileUtil;

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
  /// Method that retrieve service types associated to customer contracts.
  /// ----------------------------------------------------------
  static Future<ServiceType> getServiceType() async {
    String token = await _getMobileToken();
    ServiceType svcType;
    final response = await http.get(
        'https://webapi168.azurewebsites.net/api/customer/GetServiceType',
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer $token"
        });
    if (response.statusCode == 201) {
      // If the call to the server was successful, parse the JSON.
      final responseJson = json.decode(response.body);
      svcType = ServiceType.fromJson(responseJson);
      svcType.httpCode = response.statusCode;
      return svcType;
    } else {
      // If that call was not successful, throw an error.
      svcType = ServiceType();
      svcType.httpCode = response.statusCode;
      return svcType;
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

  static Future<CreateTicket> createTicket(Ticket ticket) async {
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
//    for(var a in ticket.attachments){
//      print(a.fileName);
//      print(a.filePath);
//    }

    CreateTicket t;
    String token = await _getMobileToken();
    var url = Uri.parse(
        'https://webapi168.azurewebsites.net/api/ticket/CreateTicket');
    var request = new http.MultipartRequest('POST', url);
    request.headers['authorization'] = 'Bearer $token';

    //Set Ticket parameters to body of the request.
    request.fields['svctypeid'] = ticket.svcTypeId.toString();
    request.fields['contractUUID'] = ticket.contract.uuid;
    if (ticket.title != null) {
      request.fields['subject'] = ticket.title;
      print('here');
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
//        final mimeTypeData =
//        request.files.add(await http.MultipartFile.fromPath('image', a.filePath,filename: a.fileName, contentType: MediaType('image','jpeg')));
//        request.files.add(await http.MultipartFile.fromPath(fileUtil.basename(a.filePath), a.filePath));
        File f = File(a.filePath);
//            request.files.add(
//           http.MultipartFile.fromBytes(fileUtil.basename(a.filePath),f.readAsBytesSync(),filename: a.fileName));
//        print('filepath: ${a.filePath}');
//      }
        print('adding file..');
//        request.files.add(new http.MultipartFile.fromBytes(
//            'image', await File.fromUri(Uri.file(a.fileName)).readAsBytes(),
//            contentType: new MediaType('image', 'jpeg')));
//      request.files.add(http.MultipartFile.fromBytes(
//          'files',
//          f.readAsBytesSync(),
//          contentType: MediaType('image', 'jpeg'),
//          filename: a.fileName,
//      ));
//        final mimeTypeData = lookupMimeType(a.filePath, headerBytes: [0xFF, 0xD8]).split('/');
//        request.files.add(await http.MultipartFile.fromPath('image', a.filePath,filename: a.fileName, contentType: MediaType(mimeTypeData[0], mimeTypeData[1])));
        request.files.add(new http.MultipartFile.fromBytes(
            'files', await File.fromUri(Uri.parse(a.filePath)).readAsBytes(),
            contentType: new MediaType('image', 'jpeg'), filename: a.fileName));
        print('finish adding file..');
      }
    }
    print('attachment to rest api call');
    print(request.files);

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
//  return CreateTicket();
  }
}
