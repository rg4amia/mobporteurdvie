
class User {
  late int _id;
  late String _fname;
  late String _lname;
  late String _email;
  late int _level;
  late int _status;
  late dynamic _numero;
  late String _rememberToken;

  int get id => _id;
  String get fname => _fname;
  String get lname => _lname;
  String get email => _email;
  int get level => _level;
  int get status => _status;
  dynamic get numero => _numero;
  String get rememberToken => _rememberToken;

  User(
      {int? id,
      String? fname,
      String? lname,
      String? email,
      int? level,
      int? status,
      dynamic numero,
      String? rememberToken}) {
    _id = id!;
    _fname = fname!;
    _lname = lname!;
    _email = email!;
    _level = level!;
    _status = status!;
    _numero = numero!;
    _rememberToken = rememberToken!;
  }

  User.fromJson(dynamic json) {
    _id = json["id"];
    _fname = json["fname"];
    _lname = json["lname"];
    _email = json["email"];
    _level = json["level"];
    _status = json["status"];
    _numero = json["numero"];
    _rememberToken = json["remember_token"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["fname"] = _fname;
    map["lname"] = _lname;
    map["email"] = _email;
    map["level"] = _level;
    map["status"] = _status;
    map["numero"] = _numero;
    map["remember_token"] = _rememberToken;
    return map;
  }
}
