class ServiceType {
  String _status;
  List<Svctypes> _svctypes;
  int _httpCode;

  ServiceType({String status, List<Svctypes> svctypes}) {
    this._status = status;
    this._svctypes = svctypes;
  }

  String get status => _status;
  set status(String status) => _status = status;
  List<Svctypes> get svctypes => _svctypes;
  set svctypes(List<Svctypes> svctypes) => _svctypes = svctypes;
  int get httpCode => _httpCode;
  set httpCode(int httpCode) => _httpCode = httpCode;

  ServiceType.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    if (json['svctypes'] != null) {
      _svctypes = new List<Svctypes>();
      json['svctypes'].forEach((v) {
        _svctypes.add(new Svctypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    if (this._svctypes != null) {
      data['svctypes'] = this._svctypes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Svctypes {
  String _description;
  int _id;
  String _uuid;
  String _createdby;
  String _createdon;
  String _modifiedby;
  String _modifiedon;
  bool _deleted;

  Svctypes(
      {String description,
        int id,
        String uuid,
        String createdby,
        String createdon,
        String modifiedby,
        String modifiedon,
        bool deleted}) {
    this._description = description;
    this._id = id;
    this._uuid = uuid;
    this._createdby = createdby;
    this._createdon = createdon;
    this._modifiedby = modifiedby;
    this._modifiedon = modifiedon;
    this._deleted = deleted;
  }

  String get description => _description;
  set description(String description) => _description = description;
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

  Svctypes.fromJson(Map<String, dynamic> json) {
    _description = json['description'];
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
    data['description'] = this._description;
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