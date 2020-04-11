class Attachments {
  String _fileName;
  String _fileType;
  String _fileUri;
  String _fileDesc;
  int _fileSize;
  int _sReqId;
  String _sReq;
  int _id;
  String _uuid;
  String _createdby;
  String _createdon;
  String _modifiedby;
  String _modifiedon;
  bool _deleted;

  Attachments(
      {String fileName,
        String fileType,
        String fileUri,
        String fileDesc,
        int fileSize,
        int sReqId,
        String sReq,
        int id,
        String uuid,
        String createdby,
        String createdon,
        String modifiedby,
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
  String get fileDesc => _fileDesc;
  set fileDesc(String fileDesc) => _fileDesc = fileDesc;
  int get fileSize => _fileSize;
  set fileSize(int fileSize) => _fileSize = fileSize;
  int get sReqId => _sReqId;
  set sReqId(int sReqId) => _sReqId = sReqId;
  String get sReq => _sReq;
  set sReq(String sReq) => _sReq = sReq;
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