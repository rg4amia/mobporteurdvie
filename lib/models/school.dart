class School {
  late int _schoolIdN;
  late String _creationDateD;
  late String _nomSchoolV;
  late String _themeV;
  late int _scolariteN;
  late String _telephoneV;
  late String _mobileV;
  late String _descriptionV;
  late String _code;
  late String _slogan;
  late String _statusN;

  int get schoolIdN => _schoolIdN;
  String get creationDateD => _creationDateD;
  String get nomSchoolV => _nomSchoolV;
  String get themeV => _themeV;
  int get scolariteN => _scolariteN;
  String get telephoneV => _telephoneV;
  String get mobileV => _mobileV;
  String get descriptionV => _descriptionV;
  String get code => _code;
  String get slogan => _slogan;
  String get statusN => _statusN;

  School(
      {int? schoolIdN,
      String? creationDateD,
      String? nomSchoolV,
      String? themeV,
      int? scolariteN,
      String? telephoneV,
      String? mobileV,
      String? descriptionV,
      String? code,
      String? slogan,
      String? statusN}) {
    _schoolIdN = schoolIdN!;
    _creationDateD = creationDateD!;
    _nomSchoolV = nomSchoolV!;
    _themeV = themeV!;
    _scolariteN = scolariteN!;
    _telephoneV = telephoneV!;
    _mobileV = mobileV!;
    _descriptionV = descriptionV!;
    _code = code!;
    _slogan = slogan!;
    _statusN = statusN!;
  }

  School.fromJson(dynamic json) {
    _schoolIdN = json["school_id_n"] != null ? json["school_id_n"] : 0;
    _creationDateD = json["creation_date_d"] != null ? json["creation_date_d"] : '';
    _nomSchoolV = json["nom_school_v"] != null ? json["nom_school_v"] : '';
    _themeV = json["theme_v"] != null ? json["theme_v"] : '';
    _scolariteN = json["scolarite_n"] != null ? json["scolarite_n"] : 0;
    _telephoneV = json["telephone_v"] != null ? json["telephone_v"] : '';
    _mobileV = json["mobile_v"] != null ? json["mobile_v"] : '';
    _descriptionV = json["description_v"] != null ? json["description_v"] : '';
    _code = json["code"] != null ? json["code"] : '';
    _slogan = json["slogan"] != null ? json["slogan"] : '';
    _statusN = json["status_n"] != null ? json["slogan"] : '';
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["school_id_n"] = _schoolIdN;
    map["creation_date_d"] = _creationDateD;
    map["nom_school_v"] = _nomSchoolV;
    map["theme_v"] = _themeV;
    map["scolarite_n"] = _scolariteN;
    map["telephone_v"] = _telephoneV;
    map["mobile_v"] = _mobileV;
    map["description_v"] = _descriptionV;
    map["code"] = _code;
    map["slogan"] = _slogan;
    map["status_n"] = _statusN;
    return map;
  }
}
