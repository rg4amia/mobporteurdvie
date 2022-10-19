
class Class_infos {
  late int _classIdN;
  late int _studentId;
  late int _sessionId;
  late int _schoolId;
  late int _campusId;
  late int _paymentStatus;
  late dynamic _vs;
  late String _createdAt;
  late String _updatedAt;
  late int _statusN;

  int get classIdN => _classIdN;
  int get studentId => _studentId;
  int get sessionId => _sessionId;
  int get schoolId => _schoolId;
  int get campusId => _campusId;
  int get paymentStatus => _paymentStatus;
  dynamic get vs => _vs;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get statusN => _statusN;

  Class_infos(
      {int? classIdN,
      int? studentId,
      int? sessionId,
      int? schoolId,
      int? campusId,
      int? paymentStatus,
      dynamic vs,
      String? createdAt,
      String? updatedAt,
      int? statusN}) {
    _classIdN = classIdN!;
    _studentId = studentId!;
    _sessionId = sessionId!;
    _schoolId = schoolId!;
    _campusId = campusId!;
    _paymentStatus = paymentStatus!;
    _vs = vs!;
    _createdAt = createdAt!;
    _updatedAt = updatedAt!;
    _statusN = statusN!;
  }

  Class_infos.fromJson(dynamic json) {
    _classIdN = json["class_id_n"] != null ? json["class_id_n"] : 0;
    _studentId = json["student_id"] != null ? json["student_id"] : 0;
    _sessionId = json["session_id"] != null ? json["session_id"] : 0;
    _schoolId = json["school_id"] != null ? json["school_id"] : 0;
    _campusId = json["campus_id"] != null ? json["campus_id"] : 0;
    _paymentStatus = json["payment_status"] != null ? json["payment_status"] : 0;
    _vs = json["vs"];
    _createdAt = json["created_at"] != null ? json["created_at"] : '';
    _updatedAt = json["updated_at"] != null ? json["updated_at"] : '';
    _statusN = json["status_n"] != null ? json['status_n'] : '';
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["class_id_n"] = _classIdN;
    map["student_id"] = _studentId;
    map["session_id"] = _sessionId;
    map["school_id"] = _schoolId;
    map["campus_id"] = _campusId;
    map["payment_status"] = _paymentStatus;
    map["vs"] = _vs;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    map["status_n"] = _statusN;
    return map;
  }

  String getFromList(Map<String, dynamic> json, String key) {
    return json != null ? json[key] : "";
  }
}
