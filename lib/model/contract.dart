import 'attachments.dart';

class Contract {
  String _contractNo;
  int _organisationId;
  String _organisation;
  String _startDate;
  String _endDate;
  bool _active;
  bool _useToken;
  String _maintProgram;
  String _custAddress;
  String _custContact;
  int _tokenCnt;
  List<Attachment> _attachments;
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
      String organisation,
      String startDate,
      String endDate,
      bool active,
      bool useToken,
      String maintProgram,
      String custAddress,
      String custContact,
      int tokenCnt,
      List<Attachment> attachments,
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
String get organisation => _organisation;
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
List<Attachment> get attachments => _attachments;
set attachments(List<Attachment> attachments) => _attachments = attachments;
List<String> get paymentSchedules => _paymentSchedules;
set paymentSchedules(List<String> paymentSchedules) =>
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
if (json['attachments'] != null) {
_attachments = new List<Null>();
json['attachments'].forEach((v) {
_attachments.add(new Attachment.fromJson(v));
});
}
if (json['paymentSchedules'] != null) {
_paymentSchedules = new List<String>();
json['paymentSchedules'].forEach((v) {
_paymentSchedules.add(v);
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