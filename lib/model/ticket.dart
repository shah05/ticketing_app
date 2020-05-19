import 'contract.dart';
import 'attachments.dart';
import 'msglogs.dart';
import 'svcstaffs.dart';

class Ticket {
  int _svcTypeId;
  String _naCode;
  int _contractId;
  Contract _contract;
  String _svcType;
  int _srsStatusId;
  Null _srsStatus;
  String _requestorId;
  String _srSdateTime;
  String _srsReachdateTime;
  String _srsStartdateTime;
  String _srsEnddateTime;
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
  String _siteAddress;
  String _dcAccessCode;
  String _actionTaken;
  String _tMsg;
  String _remarks;
  List<Attachment> _attachments;
  List<MsgLogs> _msgLogs;
  List<SvcStaffs> _svcStaffs;
  int _id;
  String _uuid;
  Null _createdby;
  String _createdon;
  Null _modifiedby;
  String _modifiedon;
  bool _deleted;

  Ticket(
      {int svcTypeId,
      String naCode,
      int contractId,
      Contract contract,
      Null svcType,
      int srsStatusId,
      Null srsStatus,
      String requestorId,
      String srSdateTime,
      String srsReachdateTime,
      String srsStartdateTime,
      String srsEnddateTime,
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
      List<Attachment> attachments,
      List<MsgLogs> msgLogs,
      List<SvcStaffs> svcStaffs,
      int id,
      String uuid,
      Null createdby,
      String createdon,
      Null modifiedby,
      String modifiedon,
        String remarks,
      bool deleted}) {
    this._svcTypeId = svcTypeId;
    this._naCode = naCode;
    this._contractId = contractId;
    this._contract = contract;
    this._svcType = svcType;
    this._srsStatusId = srsStatusId;
    this._srsStatus = srsStatus;
    this._requestorId = requestorId;
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
    this._attachments = attachments;
    this._msgLogs = msgLogs;
    this._svcStaffs = svcStaffs;
    this._id = id;
    this._uuid = uuid;
    this._createdby = createdby;
    this._createdon = createdon;
    this._modifiedby = modifiedby;
    this._modifiedon = modifiedon;
    this._deleted = deleted;
    this._remarks = remarks;
  }

  int get svcTypeId => _svcTypeId;
  set svcTypeId(int svcTypeId) => _svcTypeId = svcTypeId;
  String get naCode => _naCode;
  set naCode(String naCode) => _naCode = naCode;
  int get contractId => _contractId;
  set contractId(int contractId) => _contractId = contractId;
  Contract get contract => _contract;
  set contract(Contract contract) => _contract = contract;
  String get svcType => _svcType;
  set svcType(String svcType) => _svcType = svcType;
  int get srsStatusId => _srsStatusId;
  set srsStatusId(int srsStatusId) => _srsStatusId = srsStatusId;
  Null get srsStatus => _srsStatus;
  set srsStatus(Null srsStatus) => _srsStatus = srsStatus;
  String get requestorId => _requestorId;
  set requestorId(String requestorId) => _requestorId = requestorId;
  String get srSdateTime => _srSdateTime;
  set srSdateTime(String srSdateTime) => _srSdateTime = srSdateTime;
  String get srsReachdateTime => _srsReachdateTime;
  set srsReachdateTime(String srsReachdateTime) =>
      _srsReachdateTime = srsReachdateTime;
  String get srsStartdateTime => _srsStartdateTime;
  set srsStartdateTime(String srsStartdateTime) =>
      _srsStartdateTime = srsStartdateTime;
  String get srsEnddateTime => _srsEnddateTime;
  set srsEnddateTime(String srsEnddateTime) => _srsEnddateTime = srsEnddateTime;
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
  String get siteAddress => _siteAddress;
  set siteAddress(String siteAddress) => _siteAddress = siteAddress;
  String get dcAccessCode => _dcAccessCode;
  set dcAccessCode(String dcAccessCode) => _dcAccessCode = dcAccessCode;
  String get actionTaken => _actionTaken;
  set actionTaken(String actionTaken) => _actionTaken = actionTaken;
  String get tMsg => _tMsg;
  set tMsg(String tMsg) => _tMsg = tMsg;
  String get remarks => _remarks;
  set remarks(String remarks) => _remarks = remarks;
  List<Attachment> get attachments => _attachments;
  set attachments(List<Attachment> attachments) => _attachments = attachments;
  List<MsgLogs> get msgLogs => _msgLogs;
  set msgLogs(List<MsgLogs> msgLogs) => _msgLogs = msgLogs;
  List<SvcStaffs> get svcStaffs => _svcStaffs;
  set svcStaffs(List<SvcStaffs> svcStaffs) => _svcStaffs = svcStaffs;
  int get id => _id;
  set id(int id) => _id = id;
  String get uuid => _uuid;
  set uuid(String uuid) => _uuid = uuid;
  Null get createdby => _createdby;
  set createdby(Null createdby) => _createdby = createdby;
  String get createdon => _createdon;
  set createdon(String createdon) => _createdon = createdon;
  Null get modifiedby => _modifiedby;
  set modifiedby(Null modifiedby) => _modifiedby = modifiedby;
  String get modifiedon => _modifiedon;
  set modifiedon(String modifiedon) => _modifiedon = modifiedon;
  bool get deleted => _deleted;
  set deleted(bool deleted) => _deleted = deleted;

  Ticket.fromJson(Map<String, dynamic> json) {
    _svcTypeId = json['svcTypeId'];
    _naCode = json['naCode'];
    _contractId = json['contractId'];
    _contract = json['contract'] != null
        ? new Contract.fromJson(json['contract'])
        : null;
    _svcType = json['svcType'];
    _srsStatusId = json['srsStatusId'];
    _srsStatus = json['srsStatus'];
    _requestorId = json['requestorId'];
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
    if (json['attachments'] != null) {
      _attachments = new List<Attachment>();
      json['attachments'].forEach((v) {
        _attachments.add(new Attachment.fromJson(v));
      });
    }
    if (json['msgLogs'] != null) {
      _msgLogs = new List<MsgLogs>();
      json['msgLogs'].forEach((v) {
        _msgLogs.add(new MsgLogs.fromJson(v));
      });
    }
    if (json['svcStaffs'] != null) {
      _svcStaffs = new List<SvcStaffs>();
      json['svcStaffs'].forEach((v) {
        _svcStaffs.add(new SvcStaffs.fromJson(v));
      });
    }
    _id = json['id'];
    _uuid = json['uuid'];
    _createdby = json['createdby'];
    _createdon = json['createdon'];
    _modifiedby = json['modifiedby'];
    _modifiedon = json['modifiedon'];
    _deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['svcTypeId'] = this._svcTypeId;
    data['naCode'] = this._naCode;
    data['contractId'] = this._contractId;
    if (this._contract != null) {
      data['contract'] = this._contract.toJson();
    }
    data['svcType'] = this._svcType;
    data['srsStatusId'] = this._srsStatusId;
    data['srsStatus'] = this._srsStatus;
    data['requestorId'] = this._requestorId;
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
    if (this._attachments != null) {
      data['attachments'] = this._attachments.map((v) => v.toJson()).toList();
    }
    if (this._msgLogs != null) {
      data['msgLogs'] = this._msgLogs.map((v) => v.toJson()).toList();
    }
    if (this._svcStaffs != null) {
      data['svcStaffs'] = this._svcStaffs.map((v) => v.toJson()).toList();
    }
    data['id'] = this._id;
    data['uuid'] = this._uuid;
    data['createdby'] = this._createdby;
    data['createdon'] = this._createdon;
    data['modifiedby'] = this._modifiedby;
    data['modifiedon'] = this._modifiedon;
    data['deleted'] = this._deleted;
    return data;
  }
}
