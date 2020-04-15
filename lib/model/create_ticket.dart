import 'package:ticketing_app/model/ticket.dart';

/// Model of JSON response for API route : api/ticket/CreateTicket
class CreateTicket {
  int _httpCode;
  int _status;
  String _message;
  Ticket _ticket;

  CreateTicket({int status, String message, Ticket ticket}) {
    this._status = status;
    this._message = message;
    this._ticket = ticket;
  }

  int get status => _status;
  set status(int status) => _status = status;
  String get message => _message;
  set message(String message) => _message = message;
  Ticket get ticket => _ticket;
  set ticket(Ticket ticket) => _ticket = ticket;

  CreateTicket.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _ticket =
        json['ticket'] != null ? new Ticket.fromJson(json['ticket']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['message'] = this._message;
    if (this._ticket != null) {
      data['ticket'] = this._ticket.toJson();
    }
    return data;
  }
}
