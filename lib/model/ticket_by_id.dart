import 'package:flutter/material.dart';
import 'ticket.dart';


class TicketById extends ChangeNotifier{
  int _httpCode;
  int _status;
  Ticket _ticket;

  TicketById({int status, Ticket ticket}) {
    this._status = status;
    this._ticket = ticket;
  }

  int get httpCode => _httpCode;
  set httpCode(int httpCode) => _httpCode = httpCode;
  int get status => _status;
  set status(int status) => _status = status;
  Ticket get ticket => _ticket;
  set ticket(Ticket ticket) => _ticket = ticket;

  TicketById.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _ticket =
        json['ticket'] != null ? new Ticket.fromJson(json['ticket']) : null;
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    if (this._ticket != null) {
      data['ticket'] = this._ticket.toJson();
    }
    return data;
  }
}
