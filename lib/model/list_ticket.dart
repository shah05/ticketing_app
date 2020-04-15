import 'package:flutter/material.dart';
///Model of JSON response for API route : /api/ticket/GetTicketListByStatus
class ListTicket {
  int _httpCode;
  int _status;
  List<Ticketlist> _ticketlist;

  ListTicket({int status, List<Ticketlist> ticketlist}) {
    this._status = status;
    this._ticketlist = ticketlist;
  }

  int get httpCode => _httpCode;
  set httpCode(int httpCode) => _httpCode = httpCode;
  int get status => _status;
  set status(int status) => _status = status;
  List<Ticketlist> get ticketlist => _ticketlist;
  set ticketlist(List<Ticketlist> ticketlist) => _ticketlist = ticketlist;

  ListTicket.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    if (json['ticketlist'] != null) {
      _ticketlist = new List<Ticketlist>();
      json['ticketlist'].forEach((v) {
        _ticketlist.add(new Ticketlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    if (this._ticketlist != null) {
      data['ticketlist'] = this._ticketlist.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

/// Model of JSON response under 'ticketlist' attribute for API route : /api/ticket/GetTicketListByStatus
class Ticketlist {
  int _id;
  String _uuid;
  String _nacode;
  String _logdate;
  String _ref1;
  String _ref2;
  String _customer;
  String _svcdate;
  String _svctype;
  String _assigned;
  String _status;
  String _updatedon;
  Null _reachtime;
  Null _starttime;
  Null _endtime;
  bool _isbilled;
  int _svcid;
  int _tokenqty;
  String _requestorid;

  Ticketlist(
      {int id,
      String uuid,
      String nacode,
      String logdate,
      String ref1,
      String ref2,
      String customer,
      String svcdate,
      String svctype,
      String assigned,
      String status,
      String updatedon,
      Null reachtime,
      Null starttime,
      Null endtime,
      bool isbilled,
      int svcid,
      int tokenqty,
      String requestorid});

  int get id => _id;
  set id(int id) => _id = id;
  String get uuid => _uuid;
  set uuid(String uuid) => _uuid = uuid;
  String get nacode => _nacode;
  set nacode(String nacode) => _nacode = nacode;
  String get logdate => _logdate;
  set logdate(String logdate) => _logdate = logdate;
  String get ref1 => _ref1;
  set ref1(String ref1) => _ref1 = ref1;
  String get ref2 => _ref2;
  set ref2(String ref2) => _ref2 = ref2;
  String get customer => _customer;
  set customer(String customer) => _customer = customer;
  String get svcdate => _svcdate;
  set svcdate(String svcdate) => _svcdate = svcdate;
  String get svctype => _svctype;
  set svctype(String svctype) => _svctype = svctype;
  String get assigned => _assigned;
  set assigned(String assigned) => _assigned = assigned;
  String get status => _status;
  set status(String status) => _status = status;
  String get updatedon => _updatedon;
  set updatedon(String updatedon) => _updatedon = updatedon;
  Null get reachtime => _reachtime;
  set reachtime(Null reachtime) => _reachtime = reachtime;
  Null get starttime => _starttime;
  set starttime(Null starttime) => _starttime = starttime;
  Null get endtime => _endtime;
  set endtime(Null endtime) => _endtime = endtime;
  bool get isbilled => _isbilled;
  set isbilled(bool isbilled) => _isbilled = isbilled;
  int get svcid => _svcid;
  set svcid(int svcid) => _svcid = svcid;
  int get tokenqty => _tokenqty;
  set tokenqty(int tokenqty) => _tokenqty = tokenqty;
  String get requestorid => _requestorid;
  set requestorid(String requestorid) => _requestorid = requestorid;

  Ticketlist.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _nacode = json['nacode'];
    _logdate = json['logdate'];
    _ref1 = json['ref1'];
    _ref2 = json['ref2'];
    _customer = json['customer'];
    _svcdate = json['svcdate'];
    _svctype = json['svctype'];
    _assigned = json['assigned'];
    _status = json['status'];
    _updatedon = json['updatedon'];
    _reachtime = json['reachtime'];
    _starttime = json['starttime'];
    _endtime = json['endtime'];
    _isbilled = json['isbilled'];
    _svcid = json['svcid'];
    _tokenqty = json['tokenqty'];
    _requestorid = json['requestorid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['uuid'] = this._uuid;
    data['nacode'] = this._nacode;
    data['logdate'] = this._logdate;
    data['ref1'] = this._ref1;
    data['ref2'] = this._ref2;
    data['customer'] = this._customer;
    data['svcdate'] = this._svcdate;
    data['svctype'] = this._svctype;
    data['assigned'] = this._assigned;
    data['status'] = this._status;
    data['updatedon'] = this._updatedon;
    data['reachtime'] = this._reachtime;
    data['starttime'] = this._starttime;
    data['endtime'] = this._endtime;
    data['isbilled'] = this._isbilled;
    data['svcid'] = this._svcid;
    data['tokenqty'] = this._tokenqty;
    data['requestorid'] = this._requestorid;
    return data;
  }
}
