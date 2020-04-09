import 'package:ticketing_app/model/attachment.dart';

class Ticket {
  int _svcTypeId;
  String _naCode;
  Null _contract;
  int _contractUUID;
  Null _svcType;
  int _srsStatusId;
  Null _srsStatus;
  String _requestorId;
  Null _srsEngId;
  String _srSdateTime;
  Null _srsReachdateTime;
  Null _srsStartdateTime;
  Null _srsEnddateTime;
  String _eqpartno;
  String _title;
  String _description;
  String _clientRef1;
  String _clientRef2;
  String _brandModel;
  String _eqSerialNo;
  String _partno;
  String _eqLoc;
  String _locContact;
  Null _siteAddress;
  String _dcAccessCode;
  Null _actionTaken;
  Null _tMsg;
  bool _isbilled;
  List<Attachments> _attachments;

  Ticket(
      {String naCode,
        int contractUUID,
        Null contract,
        int svcTypeId,
        Null svcType,
        int srsStatusId,
        Null srsStatus,
        String requestorId,
        Null srsEngId,
        String srSdateTime,
        Null srsReachdateTime,
        Null srsStartdateTime,
        Null srsEnddateTime,
        String eqpartno,
        String title,
        String description,
        String clientRef1,
        String clientRef2,
        String brandModel,
        String eqSerialNo,
        String partno,
        String eqLoc,
        String locContact,
        Null siteAddress,
        String dcAccessCode,
        Null actionTaken,
        Null tMsg,
        bool isbilled,
        List<Attachments> attachments}) {
    this._naCode = naCode;
    this._contractUUID = contractId;
    this._contract = contract;
    this._svcTypeId = svcTypeId;
    this._svcType = svcType;
    this._srsStatusId = srsStatusId;
    this._srsStatus = srsStatus;
    this._requestorId = requestorId;
    this._srsEngId = srsEngId;
    this._srSdateTime = srSdateTime;
    this._srsReachdateTime = srsReachdateTime;
    this._srsStartdateTime = srsStartdateTime;
    this._srsEnddateTime = srsEnddateTime;
    this._eqpartno = eqpartno;
    this._title = title;
    this._description = description;
    this._clientRef1 = clientRef1;
    this._clientRef2 = clientRef2;
    this._brandModel = brandModel;
    this._eqSerialNo = eqSerialNo;
    this._partno = partno;
    this._eqLoc = eqLoc;
    this._locContact = locContact;
    this._siteAddress = siteAddress;
    this._dcAccessCode = dcAccessCode;
    this._actionTaken = actionTaken;
    this._tMsg = tMsg;
    this._isbilled = isbilled;
    this._attachments = attachments;
  }

  String get naCode => _naCode;
  set naCode(String naCode) => _naCode = naCode;
  int get contractId => _contractUUID;
  set contractId(int contractId) => _contractUUID = contractId;
  Null get contract => _contract;
  set contract(Null contract) => _contract = contract;
  int get svcTypeId => _svcTypeId;
  set svcTypeId(int svcTypeId) => _svcTypeId = svcTypeId;
  Null get svcType => _svcType;
  set svcType(Null svcType) => _svcType = svcType;
  int get srsStatusId => _srsStatusId;
  set srsStatusId(int srsStatusId) => _srsStatusId = srsStatusId;
  Null get srsStatus => _srsStatus;
  set srsStatus(Null srsStatus) => _srsStatus = srsStatus;
  String get requestorId => _requestorId;
  set requestorId(String requestorId) => _requestorId = requestorId;
  Null get srsEngId => _srsEngId;
  set srsEngId(Null srsEngId) => _srsEngId = srsEngId;
  String get srSdateTime => _srSdateTime;
  set srSdateTime(String srSdateTime) => _srSdateTime = srSdateTime;
  Null get srsReachdateTime => _srsReachdateTime;
  set srsReachdateTime(Null srsReachdateTime) =>
      _srsReachdateTime = srsReachdateTime;
  Null get srsStartdateTime => _srsStartdateTime;
  set srsStartdateTime(Null srsStartdateTime) =>
      _srsStartdateTime = srsStartdateTime;
  Null get srsEnddateTime => _srsEnddateTime;
  set srsEnddateTime(Null srsEnddateTime) => _srsEnddateTime = srsEnddateTime;
  String get eqpartno => _eqpartno;
  set eqpartno(String eqpartno) => _eqpartno = eqpartno;
  String get title => _title;
  set title(String title) => _title = title;
  String get description => _description;
  set description(String description) => _description = description;
  String get clientRef1 => _clientRef1;
  set clientRef1(String clientRef1) => _clientRef1 = clientRef1;
  String get clientRef2 => _clientRef2;
  set clientRef2(String clientRef2) => _clientRef2 = clientRef2;
  String get brandModel => _brandModel;
  set brandModel(String brandModel) => _brandModel = brandModel;
  String get eqSerialNo => _eqSerialNo;
  set eqSerialNo(String eqSerialNo) => _eqSerialNo = eqSerialNo;
  String get partno => _partno;
  set partno(String partno) => _partno = partno;
  String get eqLoc => _eqLoc;
  set eqLoc(String eqLoc) => _eqLoc = eqLoc;
  String get locContact => _locContact;
  set locContact(String locContact) => _locContact = locContact;
  Null get siteAddress => _siteAddress;
  set siteAddress(Null siteAddress) => _siteAddress = siteAddress;
  String get dcAccessCode => _dcAccessCode;
  set dcAccessCode(String dcAccessCode) => _dcAccessCode = dcAccessCode;
  Null get actionTaken => _actionTaken;
  set actionTaken(Null actionTaken) => _actionTaken = actionTaken;
  Null get tMsg => _tMsg;
  set tMsg(Null tMsg) => _tMsg = tMsg;
  bool get isbilled => _isbilled;
  set isbilled(bool isbilled) => _isbilled = isbilled;
  List<Attachments> get attachments => _attachments;
  set attachments(List<Attachments> attachments) => _attachments = attachments;

  Ticket.fromJson(Map<String, dynamic> json) {
    _naCode = json['naCode'];
    _contractUUID = json['contractUUID'];
    _contract = json['contract'];
    _svcTypeId = json['svcTypeId'];
    _svcType = json['svcType'];
    _srsStatusId = json['srsStatusId'];
    _srsStatus = json['srsStatus'];
    _requestorId = json['requestorId'];
    _srsEngId = json['srsEngId'];
    _srSdateTime = json['srSdateTime'];
    _srsReachdateTime = json['srsReachdateTime'];
    _srsStartdateTime = json['srsStartdateTime'];
    _srsEnddateTime = json['srsEnddateTime'];
    _eqpartno = json['eqpartno'];
    _title = json['title'];
    _description = json['description'];
    _clientRef1 = json['clientRef1'];
    _clientRef2 = json['clientRef2'];
    _brandModel = json['brandModel'];
    _eqSerialNo = json['eqSerialNo'];
    _partno = json['partno'];
    _eqLoc = json['eqLoc'];
    _locContact = json['locContact'];
    _siteAddress = json['siteAddress'];
    _dcAccessCode = json['dcAccessCode'];
    _actionTaken = json['actionTaken'];
    _tMsg = json['tMsg'];
    _isbilled = json['isbilled'];
    if (json['attachments'] != null) {
      _attachments = new List<Attachments>();
      json['attachments'].forEach((v) {
        _attachments.add(new Attachments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['naCode'] = this._naCode;
    data['contractId'] = this._contractUUID;
    data['contract'] = this._contract;
    data['svcTypeId'] = this._svcTypeId;
    data['svcType'] = this._svcType;
    data['srsStatusId'] = this._srsStatusId;
    data['srsStatus'] = this._srsStatus;
    data['requestorId'] = this._requestorId;
    data['srsEngId'] = this._srsEngId;
    data['srSdateTime'] = this._srSdateTime;
    data['srsReachdateTime'] = this._srsReachdateTime;
    data['srsStartdateTime'] = this._srsStartdateTime;
    data['srsEnddateTime'] = this._srsEnddateTime;
    data['eqpartno'] = this._eqpartno;
    data['title'] = this._title;
    data['description'] = this._description;
    data['clientRef1'] = this._clientRef1;
    data['clientRef2'] = this._clientRef2;
    data['brandModel'] = this._brandModel;
    data['eqSerialNo'] = this._eqSerialNo;
    data['partno'] = this._partno;
    data['eqLoc'] = this._eqLoc;
    data['locContact'] = this._locContact;
    data['siteAddress'] = this._siteAddress;
    data['dcAccessCode'] = this._dcAccessCode;
    data['actionTaken'] = this._actionTaken;
    data['tMsg'] = this._tMsg;
    data['isbilled'] = this._isbilled;
    if (this._attachments != null) {
      data['attachments'] = this._attachments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}