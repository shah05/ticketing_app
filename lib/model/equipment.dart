class Equipment {
  int _httpCode;
  int _status;
  String _message;
  String _sla;

  Equipment({String message, String sla}) {
    this._message = message;
    this._sla = sla;
  }

  int get httpCode => _httpCode;
  set httpCode(httpCode) => _httpCode = httpCode;
  String get message => _message;
  String get sla => _sla;

  Equipment.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    if (json['sla'] != null) {
      _sla = json['sla'];
    } else {
      _sla = null;
    }
  }
}
