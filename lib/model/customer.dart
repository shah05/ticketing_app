import 'contract_detail.dart';

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