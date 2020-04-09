class TicketById {
  int _status;
  Ticket _ticket;

  TicketById({int status, Ticket ticket}) {
    this._status = status;
    this._ticket = ticket;
  }

  int get status => _status;
  set status(int status) => _status = status;
  Ticket get ticket => _ticket;
  set ticket(Ticket ticket) => _ticket = ticket;

  TicketById.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _ticket =
    json['ticket'] != null ? new Ticket.fromJson(json['ticket']) : null;
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

class Ticket {
  int _svcTypeId;
  String _naCode;
  int _contractId;
  Contract _contract;
  String _svcType;
  int _srsStatusId;
  String _srsStatus;
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
  List<Attachments> _attachments;
  List<MsgLogs> _msgLogs;
  List<String> _svcStaffs;
  int _id;
  String _uuid;
  String _createdby;
  String _createdon;
  String _modifiedby;
  String _modifiedon;
  bool _deleted;

  Ticket(
      {int svcTypeId,
        String naCode,
        int contractId,
        Contract contract,
        String svcType,
        int srsStatusId,
        String srsStatus,
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
        String siteAddress,
        String dcAccessCode,
        String actionTaken,
        String tMsg,
        List<Attachments> attachments,
        List<MsgLogs> msgLogs,
        List<String> svcStaffs,
        int id,
        String uuid,
        Null createdby,
        String createdon,
        String modifiedby,
        String modifiedon,
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
  String get srsStatus => _srsStatus;
  set srsStatus(String srsStatus) => _srsStatus = srsStatus;
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
  Null get clientRef2 => _clientRef2;
  set clientRef2(Null clientRef2) => _clientRef2 = clientRef2;
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
  List<Attachments> get attachments => _attachments;
  set attachments(List<Attachments> attachments) => _attachments = attachments;
  List<MsgLogs> get msgLogs => _msgLogs;
  set msgLogs(List<MsgLogs> msgLogs) => _msgLogs = msgLogs;
  List<String> get svcStaffs => _svcStaffs;
  set svcStaffs(List<String> svcStaffs) => _svcStaffs = svcStaffs;
  int get id => _id;
  set id(int id) => _id = id;
  String get uuid => _uuid;
  set uuid(String uuid) => _uuid = uuid;
  String get createdby => _createdby;
  set createdby(String createdby) => _createdby = createdby;
  String get createdon => _createdon;
  set createdon(String createdon) => _createdon = createdon;
  String get modifiedby => _modifiedby;
  set modifiedby(String modifiedby) => _modifiedby = modifiedby;
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
      _attachments = new List<Attachments>();
      json['attachments'].forEach((v) {
        _attachments.add(new Attachments.fromJson(v));
      });
    }
    if (json['msgLogs'] != null) {
      _msgLogs = new List<MsgLogs>();
      json['msgLogs'].forEach((v) {
        _msgLogs.add(new MsgLogs.fromJson(v));
      });
    }
    if (json['svcStaffs'] != null) {
      _svcStaffs = new List<String>();
      json['svcStaffs'].forEach((v) {
        _svcStaffs.add(v); /// TO DO : Need a Staff object model ?
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
      data['svcStaffs'] = this._svcStaffs.map((v) => v.toString());
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

class Contract {
  String _contractNo;
  int _organisationId;
  Null _organisation;
  String _startDate;
  String _endDate;
  bool _active;
  bool _useToken;
  String _maintProgram;
  String _custAddress;
  String _custContact;
  int _tokenCnt;
  List<Attachments> _attachments;
  List<String> _paymentSchedules;
  int _id;
  String _uuid;
  String _createdby;
  String _createdon;
  String _modifiedby;
  String _modifiedon;
  bool _deleted;

  Contract(
      {String contractNo,
        int organisationId,
        Null organisation,
        String startDate,
        String endDate,
        bool active,
        bool useToken,
        String maintProgram,
        String custAddress,
        String custContact,
        int tokenCnt,
        List<Attachments> attachments,
        List<String> paymentSchedules,
        int id,
        String uuid,
        String createdby,
        String createdon,
        String modifiedby,
        String modifiedon,
        bool deleted}) {
    this._contractNo = contractNo;
    this._organisationId = organisationId;
    this._organisation = organisation;
    this._startDate = startDate;
    this._endDate = endDate;
    this._active = active;
    this._useToken = useToken;
    this._maintProgram = maintProgram;
    this._custAddress = custAddress;
    this._custContact = custContact;
    this._tokenCnt = tokenCnt;
    this._attachments = attachments;
    this._paymentSchedules = paymentSchedules;
    this._id = id;
    this._uuid = uuid;
    this._createdby = createdby;
    this._createdon = createdon;
    this._modifiedby = modifiedby;
    this._modifiedon = modifiedon;
    this._deleted = deleted;
  }

  String get contractNo => _contractNo;
  set contractNo(String contractNo) => _contractNo = contractNo;
  int get organisationId => _organisationId;
  set organisationId(int organisationId) => _organisationId = organisationId;
  Null get organisation => _organisation;
  set organisation(Null organisation) => _organisation = organisation;
  String get startDate => _startDate;
  set startDate(String startDate) => _startDate = startDate;
  String get endDate => _endDate;
  set endDate(String endDate) => _endDate = endDate;
  bool get active => _active;
  set active(bool active) => _active = active;
  bool get useToken => _useToken;
  set useToken(bool useToken) => _useToken = useToken;
  String get maintProgram => _maintProgram;
  set maintProgram(String maintProgram) => _maintProgram = maintProgram;
  String get custAddress => _custAddress;
  set custAddress(String custAddress) => _custAddress = custAddress;
  String get custContact => _custContact;
  set custContact(String custContact) => _custContact = custContact;
  int get tokenCnt => _tokenCnt;
  set tokenCnt(int tokenCnt) => _tokenCnt = tokenCnt;
  List<Null> get attachments => _attachments;
  set attachments(List<Attachments> attachments) => _attachments = attachments;
  List<Null> get paymentSchedules => _paymentSchedules;
  set paymentSchedules(List<Null> paymentSchedules) =>
      _paymentSchedules = paymentSchedules;
  int get id => _id;
  set id(int id) => _id = id;
  String get uuid => _uuid;
  set uuid(String uuid) => _uuid = uuid;
  String get createdby => _createdby;
  set createdby(String createdby) => _createdby = createdby;
  String get createdon => _createdon;
  set createdon(String createdon) => _createdon = createdon;
  String get modifiedby => _modifiedby;
  set modifiedby(String modifiedby) => _modifiedby = modifiedby;
  String get modifiedon => _modifiedon;
  set modifiedon(String modifiedon) => _modifiedon = modifiedon;
  bool get deleted => _deleted;
  set deleted(bool deleted) => _deleted = deleted;

  Contract.fromJson(Map<String, dynamic> json) {
    _contractNo = json['contractNo'];
    _organisationId = json['organisationId'];
    _organisation = json['organisation'];
    _startDate = json['startDate'];
    _endDate = json['endDate'];
    _active = json['active'];
    _useToken = json['useToken'];
    _maintProgram = json['maintProgram'];
    _custAddress = json['custAddress'];
    _custContact = json['custContact'];
    _tokenCnt = json['tokenCnt'];
//    if (json['attachments'] != null) {
//      _attachments = new List<Attachments>();
//      json['attachments'].forEach((v) {
//        _attachments.add(new v.fromJson(v));
//      });
//    }

    if (json['attachments'] != null) {
      _attachments = new List<Attachments>();
      json['attachments'].forEach((v) {
        _attachments.add(new Attachments.fromJson(v));
      });
    }

    if (json['paymentSchedules'] != null) {
      _paymentSchedules = new List<Null>();
      json['paymentSchedules'].forEach((v) {
        _paymentSchedules.add(v); /// TODO Need paymentschedule object model ?
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
    data['contractNo'] = this._contractNo;
    data['organisationId'] = this._organisationId;
    data['organisation'] = this._organisation;
    data['startDate'] = this._startDate;
    data['endDate'] = this._endDate;
    data['active'] = this._active;
    data['useToken'] = this._useToken;
    data['maintProgram'] = this._maintProgram;
    data['custAddress'] = this._custAddress;
    data['custContact'] = this._custContact;
    data['tokenCnt'] = this._tokenCnt;
    if (this._attachments != null) {
      data['attachments'] = this._attachments.map((v) => v.toJson()).toList();
    }
    if (this._paymentSchedules != null) {
      data['paymentSchedules'] =
          this._paymentSchedules.map((v) => v.toString());
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

class Attachments {
  String _fileName;
  String _fileType;
  String _fileUri;
  Null _fileDesc;
  int _fileSize;
  int _sReqId;
  Null _sReq;
  int _id;
  String _uuid;
  Null _createdby;
  String _createdon;
  Null _modifiedby;
  String _modifiedon;
  bool _deleted;

  Attachments(
      {String fileName,
        String fileType,
        String fileUri,
        Null fileDesc,
        int fileSize,
        int sReqId,
        Null sReq,
        int id,
        String uuid,
        Null createdby,
        String createdon,
        Null modifiedby,
        String modifiedon,
        bool deleted}) {
    this._fileName = fileName;
    this._fileType = fileType;
    this._fileUri = fileUri;
    this._fileDesc = fileDesc;
    this._fileSize = fileSize;
    this._sReqId = sReqId;
    this._sReq = sReq;
    this._id = id;
    this._uuid = uuid;
    this._createdby = createdby;
    this._createdon = createdon;
    this._modifiedby = modifiedby;
    this._modifiedon = modifiedon;
    this._deleted = deleted;
  }

  String get fileName => _fileName;
  set fileName(String fileName) => _fileName = fileName;
  String get fileType => _fileType;
  set fileType(String fileType) => _fileType = fileType;
  String get fileUri => _fileUri;
  set fileUri(String fileUri) => _fileUri = fileUri;
  Null get fileDesc => _fileDesc;
  set fileDesc(Null fileDesc) => _fileDesc = fileDesc;
  int get fileSize => _fileSize;
  set fileSize(int fileSize) => _fileSize = fileSize;
  int get sReqId => _sReqId;
  set sReqId(int sReqId) => _sReqId = sReqId;
  Null get sReq => _sReq;
  set sReq(Null sReq) => _sReq = sReq;
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

  Attachments.fromJson(Map<String, dynamic> json) {
    _fileName = json['fileName'];
    _fileType = json['fileType'];
    _fileUri = json['fileUri'];
    _fileDesc = json['fileDesc'];
    _fileSize = json['fileSize'];
    _sReqId = json['sReqId'];
    _sReq = json['sReq'];
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
    data['fileName'] = this._fileName;
    data['fileType'] = this._fileType;
    data['fileUri'] = this._fileUri;
    data['fileDesc'] = this._fileDesc;
    data['fileSize'] = this._fileSize;
    data['sReqId'] = this._sReqId;
    data['sReq'] = this._sReq;
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

class MsgLogs {
  String _message;
  String _action;
  Null _remarks;
  int _sReqId;
  Null _sReq;
  int _id;
  String _uuid;
  String _createdby;
  String _createdon;
  Null _modifiedby;
  String _modifiedon;
  bool _deleted;

  MsgLogs(
      {String message,
        String action,
        Null remarks,
        int sReqId,
        Null sReq,
        int id,
        String uuid,
        String createdby,
        String createdon,
        Null modifiedby,
        String modifiedon,
        bool deleted}) {
    this._message = message;
    this._action = action;
    this._remarks = remarks;
    this._sReqId = sReqId;
    this._sReq = sReq;
    this._id = id;
    this._uuid = uuid;
    this._createdby = createdby;
    this._createdon = createdon;
    this._modifiedby = modifiedby;
    this._modifiedon = modifiedon;
    this._deleted = deleted;
  }

  String get message => _message;
  set message(String message) => _message = message;
  String get action => _action;
  set action(String action) => _action = action;
  Null get remarks => _remarks;
  set remarks(Null remarks) => _remarks = remarks;
  int get sReqId => _sReqId;
  set sReqId(int sReqId) => _sReqId = sReqId;
  Null get sReq => _sReq;
  set sReq(Null sReq) => _sReq = sReq;
  int get id => _id;
  set id(int id) => _id = id;
  String get uuid => _uuid;
  set uuid(String uuid) => _uuid = uuid;
  String get createdby => _createdby;
  set createdby(String createdby) => _createdby = createdby;
  String get createdon => _createdon;
  set createdon(String createdon) => _createdon = createdon;
  Null get modifiedby => _modifiedby;
  set modifiedby(Null modifiedby) => _modifiedby = modifiedby;
  String get modifiedon => _modifiedon;
  set modifiedon(String modifiedon) => _modifiedon = modifiedon;
  bool get deleted => _deleted;
  set deleted(bool deleted) => _deleted = deleted;

  MsgLogs.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _action = json['action'];
    _remarks = json['remarks'];
    _sReqId = json['sReqId'];
    _sReq = json['sReq'];
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
    data['message'] = this._message;
    data['action'] = this._action;
    data['remarks'] = this._remarks;
    data['sReqId'] = this._sReqId;
    data['sReq'] = this._sReq;
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