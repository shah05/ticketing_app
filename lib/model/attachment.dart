class Attachments {
  String _fileName;
  String _fileType;
  String _fileUri;
  Null _fileDesc;
  int _fileSize;
  int _sReqId;

  Attachments(
      {String fileName,
        String fileType,
        String fileUri,
        Null fileDesc,
        int fileSize,
        int sReqId}) {
    this._fileName = fileName;
    this._fileType = fileType;
    this._fileUri = fileUri;
    this._fileDesc = fileDesc;
    this._fileSize = fileSize;
    this._sReqId = sReqId;
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

  Attachments.fromJson(Map<String, dynamic> json) {
    _fileName = json['fileName'];
    _fileType = json['fileType'];
    _fileUri = json['fileUri'];
    _fileDesc = json['fileDesc'];
    _fileSize = json['fileSize'];
    _sReqId = json['sReqId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileName'] = this._fileName;
    data['fileType'] = this._fileType;
    data['fileUri'] = this._fileUri;
    data['fileDesc'] = this._fileDesc;
    data['fileSize'] = this._fileSize;
    data['sReqId'] = this._sReqId;
    return data;
  }
}