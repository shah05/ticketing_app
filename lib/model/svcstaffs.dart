import 'contract.dart';

class SvcStaffs {
  int _id;
  String _uuid;
  String _userid;
  int _contractId;
  Contract _contract;

  SvcStaffs(
      {int id, String uuid, String userid, int contractId, Contract contract}) {
    this._id = id;
    this._uuid = uuid;
    this._userid = userid;
    this._contractId = contractId;
    this._contract = contract;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get uuid => _uuid;
  set uuid(String uuid) => _uuid = uuid;
  String get userid => _userid;
  set userid(String userid) => _userid = userid;
  int get contractId => _contractId;
  set contractId(int contractId) => _contractId = contractId;
  Contract get contract => _contract;
  set contract(Contract contract) => _contract = contract;

  SvcStaffs.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _userid = json['userid'];
    _contractId = json['contractId'];
    _contract = json['contract'] != null
        ? new Contract.fromJson(json['contract'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['uuid'] = this._uuid;
    data['userid'] = this._userid;
    data['contractId'] = this._contractId;
    if (this._contract != null) {
      data['contract'] = this._contract.toJson();
    }
    return data;
  }
}