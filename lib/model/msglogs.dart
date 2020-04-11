class MsgLogs {
  String _message;
  String _action;
  String _remarks;
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
        String remarks,
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
  String get remarks => _remarks;
  set remarks(String remarks) => _remarks = remarks;
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