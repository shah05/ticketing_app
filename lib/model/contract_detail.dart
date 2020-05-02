class Contractdetail {
  String _companyName;
  String _contractUUID;
  String _rolename;
  bool _usetoken;
  String _startd;
  String _endd;

  Contractdetail(
      {String companyName,
      String contractUUID,
      String rolename,
      bool usetoken,
      String startd,
      String endd});

  String get companyName => _companyName;
  String get contractUUID => _contractUUID;
  String get startd => _startd;
  String get endd => _endd;

  Contractdetail.fromJson(Map<String, dynamic> json) {
    _companyName = json['companyName'];
    _contractUUID = json['contractUUID'];
    _rolename = json['rolename'];
    _usetoken = json['usetoken'];
    _startd = json['startd'];
    _endd = json['endd'];
  }
}
