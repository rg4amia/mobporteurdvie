
class Campus {
  late int _campusIdN;
  late String _creationDateD;
  late String _countryCodeV;
  late String _codeCampusV;
  late String _nomCampV;
  late String _localisationV;
  late String _adresseV;
  late String _telephoneV;
  late String _mailV;
  late String _descriptionV;
  late String _charField1;
  late String _charField2;
  late String _charField3;
  late int _statusN;

  int get campusIdN => _campusIdN;
  String get creationDateD => _creationDateD;
  String get countryCodeV => _countryCodeV;
  String get codeCampusV => _codeCampusV;
  String get nomCampV => _nomCampV;
  String get localisationV => _localisationV;
  String get adresseV => _adresseV;
  String get telephoneV => _telephoneV;
  String get mailV => _mailV;
  String get descriptionV => _descriptionV;
  String get charField1 => _charField1;
  String get charField2 => _charField2;
  String get charField3 => _charField3;
  int get statusN => _statusN;


  Campus(
      {int? campusIdN,
      String? creationDateD,
      String? countryCodeV,
      String? codeCampusV,
      String? nomCampV,
      String? localisationV,
      String? adresseV,
      String? telephoneV,
      String? mailV,
      String? descriptionV,
      String? charField1,
      String? charField2,
      String? charField3,
      int? statusN}) {
    _campusIdN = campusIdN!;
    _creationDateD = creationDateD!;
    _countryCodeV = countryCodeV!;
    _codeCampusV = codeCampusV!;
    _nomCampV = nomCampV!;
    _localisationV = localisationV!;
    _adresseV = adresseV!;
    _telephoneV = telephoneV!;
    _mailV = mailV!;
    _descriptionV = descriptionV!;
    _charField1 = charField1!;
    _charField2 = charField2!;
    _charField3 = charField3!;
    _statusN = statusN!;
  }

  Campus.fromJson(dynamic json) {
    _campusIdN = json["campus_id_n"] != null ? json["campus_id_n"]: '';
    _creationDateD = json["creation_date_d"] != null ? json["creation_date_d"] : '';
    _countryCodeV = json["country_code_v"] != null ? json['country_code_v'] : '';
    _codeCampusV = json["code_campus_v"] != null ? json['code_campus_v'] : '';
    _nomCampV = json["nom_camp_v"] != null ? json['nom_camp_v'] : '';
    _localisationV = json["localisation_v"] != null ? json['localisation_v'] : '';
    _adresseV = json["adresse_v"] != null ? json['adresse_v'] : '';
    _telephoneV = json["telephone_v"] != null ? json['telephone_v'] : '';
    _mailV = json["mail_v"] != null ? json['mail_v'] : '';
    _descriptionV = json["description_v"] != null ? json['description_v'] : '';
    _charField1 = json["char_field_1"] != null ? json['char_field_1'] : '';
    _charField2 = json["char_field_2"] != null ? json['char_field_2'] : '';
    _charField3 = json["char_field_3"]  != null ? json['char_field_3'] : '';
    _statusN = json["status_n"] != null ? json['status_n'] : 0;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["campus_id_n"] = _campusIdN;
    map["creation_date_d"] = _creationDateD;
    map["country_code_v"] = _countryCodeV;
    map["code_campus_v"] = _codeCampusV;
    map["nom_camp_v"] = _nomCampV;
    map["localisation_v"] = _localisationV;
    map["adresse_v"] = _adresseV;
    map["telephone_v"] = _telephoneV;
    map["mail_v"] = _mailV;
    map["description_v"] = _descriptionV;
    map["char_field_1"] = _charField1;
    map["char_field_2"] = _charField2;
    map["char_field_3"] = _charField3;
    map["status_n"] = _statusN;
    return map;
  }
}
