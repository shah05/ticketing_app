import 'contract_detail.dart';
import 'package:flutter/material.dart';

class Customer {
  int _httpCode;
  String _status;
  String _usertype;
  List<Contractdetail> _contractdetails;

  Customer({int status, String usertype, List<Contractdetail> contractdetails});

  int get httpCode => _httpCode;
  set httpCode(int httpCode) => _httpCode = httpCode;
  List<Contractdetail> get contractdetails => _contractdetails;
  String get usertype => _usertype;

  Customer.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _usertype = json['usertype'];
    if (json['contractdetails'] != null) {
      _contractdetails = new List<Contractdetail>();
      json['contractdetails'].forEach((v) {
        _contractdetails.add(new Contractdetail.fromJson(v));
      });
    }
  }

//  factory Customer.fromJson(Map<String, dynamic> parsedJson) {
//    var list = parsedJson['contractdetails'] as List;
//    print(list.runtimeType); //returns List<dynamic>
//    List<Contractdetail> contractdetailslist =
//    list.map((i) => Contractdetail.fromJson(i)).toList();
//
//    var customer = Customer(
//        status: parsedJson['status'],
//        usertype: parsedJson['usertype'],
//        contractdetails: contractdetailslist);
//    return customer;
//  }
}
