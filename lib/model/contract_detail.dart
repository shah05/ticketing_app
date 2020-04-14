class Contractdetail {
  final String companyName;
  final String contractUUID;
  final String rolename;
  final bool usetoken;
  final String startd;
  final String endd;

  Contractdetail(
      {this.companyName,
        this.contractUUID,
        this.rolename,
        this.usetoken,
        this.startd,
        this.endd});

  factory Contractdetail.fromJson(Map<String, dynamic> parsedJson) {
    return Contractdetail(
        companyName: parsedJson['companyName'],
        contractUUID: parsedJson['contractUUID'],
        rolename: parsedJson['rolename'],
        usetoken: parsedJson['usetoken'],
        startd: parsedJson['startd'],
        endd: parsedJson['endd']);
  }
}