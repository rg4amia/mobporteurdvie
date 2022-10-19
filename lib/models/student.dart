
class Student {
  late int _sid;
  late int _studentIdN;
  late int _userId;
  late String _createdAt;
  late String _updatedAt;
  late int _profileIdN;
  late int _creatorIdN;
  late String _defaultLangV;
  late String _citizenV;
  late String _primaryPhoneV;
  late String _secondaryPhoneV;
  late String _sexeV;
  late String _tailleV;
  late String _professionV;
  late String _dateNaissance;
  late int _matrimoniale;
  late String _partenaireName;
  late int _nombreEnfant;
  late String _charField5;
  late int _levelAcademy;
  late String _facebook;
  late String _pictureV;
  late String _location;
  late int _statusN;
  late int _situationPro;
  late String _callingCode;
  late int _preferedCampus;
  late String _ville;
  late String _quartier;
  late String _whatsapp;
  late dynamic _skype;
  late int _id;
  late String _fname;
  late String _lname;
  late String _email;
  late String _password;
  late int _level;
  late int _status;
  late String _numero;
  late String _rememberToken;
  late int _detailsSpirituelsId;
  late String _conversionDateD;
  late String _baptemeDateD;
  late int _spiritBaptN;
  late int _langueN;
  late String _dlangueDateD;
  late int _aAssemblee;
  late String _departementV;
  late String _eglise;
  late int _egliseActuel;
  late int _convPersN;
  late String _frequencePrayN;
  late String _pageBiblique;
  late String _dernierSujetV;
  late String _aimeFaire;
  late String _donV;
  late String _detailDonV;
  late String _fardeau;
  late int _statuN;

  int get sid => _sid;
  int get studentIdN => _studentIdN;
  int get userId => _userId;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get profileIdN => _profileIdN;
  int get creatorIdN => _creatorIdN;
  String get defaultLangV => _defaultLangV;
  String get citizenV => _citizenV;
  String get primaryPhoneV => _primaryPhoneV;
  String get secondaryPhoneV => _secondaryPhoneV;
  String get sexeV => _sexeV;
  String get tailleV => _tailleV;
  String get professionV => _professionV;
  String get dateNaissance => _dateNaissance;
  int get matrimoniale => _matrimoniale;
  String get partenaireName => _partenaireName;
  int get nombreEnfant => _nombreEnfant;
  String get charField5 => _charField5;
  int get levelAcademy => _levelAcademy;
  String get facebook => _facebook;
  String get pictureV => _pictureV;
  String get location => _location;
  int get statusN => _statusN;
  int get situationPro => _situationPro;
  String get callingCode => _callingCode;
  int get preferedCampus => _preferedCampus;
  String get ville => _ville;
  String get quartier => _quartier;
  String get whatsapp => _whatsapp;
  dynamic get skype => _skype;
  int get id => _id;
  String get fname => _fname;
  String get lname => _lname;
  String get email => _email;
  String get password => _password;
  int get level => _level;
  int get status => _status;
  String get numero => _numero;
  String get rememberToken => _rememberToken;
  int get detailsSpirituelsId => _detailsSpirituelsId;
  String get conversionDateD => _conversionDateD;
  String get baptemeDateD => _baptemeDateD;
  int get spiritBaptN => _spiritBaptN;
  int get langueN => _langueN;
  String get dlangueDateD => _dlangueDateD;
  int get aAssemblee => _aAssemblee;
  String get departementV => _departementV;
  String get eglise => _eglise;
  int get egliseActuel => _egliseActuel;
  int get convPersN => _convPersN;
  String get frequencePrayN => _frequencePrayN;
  String get pageBiblique => _pageBiblique;
  String get dernierSujetV => _dernierSujetV;
  String get aimeFaire => _aimeFaire;
  String get donV => _donV;
  String get detailDonV => _detailDonV;
  String get fardeau => _fardeau;
  int get statuN => _statuN;

  Student(
      {int? sid,
      int? studentIdN,
      int? userId,
      String? createdAt,
      String? updatedAt,
      int? profileIdN,
      int? creatorIdN,
      String? defaultLangV,
      String? citizenV,
      String? primaryPhoneV,
      String? secondaryPhoneV,
      String? sexeV,
      String? tailleV,
      String? professionV,
      String? dateNaissance,
      int? matrimoniale,
      String? partenaireName,
      int? nombreEnfant,
      String? charField5,
      int? levelAcademy,
      String? facebook,
      String? pictureV,
      String? location,
      int? statusN,
      int? situationPro,
      String? callingCode,
      int? preferedCampus,
      String? ville,
      String? quartier,
      String? whatsapp,
      dynamic skype,
      int? id,
      String? fname,
      String? lname,
      String? email,
      String? password,
      int? level,
      int? status,
      String? numero,
      String? rememberToken,
      int? detailsSpirituelsId,
      String? conversionDateD,
      String? baptemeDateD,
      int? spiritBaptN,
      int? langueN,
      String? dlangueDateD,
      int? aAssemblee,
      String? departementV,
      String? eglise,
      int? egliseActuel,
      int? convPersN,
      String? frequencePrayN,
      String? pageBiblique,
      String? dernierSujetV,
      String? aimeFaire,
      String? donV,
      String? detailDonV,
      String? fardeau,
      int? statuN}) {
    _sid = sid!;
    _studentIdN = studentIdN!;
    _userId = userId!;
    _createdAt = createdAt!;
    _updatedAt = updatedAt!;
    _profileIdN = profileIdN!;
    _creatorIdN = creatorIdN!;
    _defaultLangV = defaultLangV!;
    _citizenV = citizenV!;
    _primaryPhoneV = primaryPhoneV!;
    _secondaryPhoneV = secondaryPhoneV!;
    _sexeV = sexeV!;
    _tailleV = tailleV!;
    _professionV = professionV!;
    _dateNaissance = dateNaissance!;
    _matrimoniale = matrimoniale!;
    _partenaireName = partenaireName!;
    _nombreEnfant = nombreEnfant!;
    _charField5 = charField5!;
    _levelAcademy = levelAcademy!;
    _facebook = facebook!;
    _pictureV = pictureV!;
    _location = location!;
    _statusN = statusN!;
    _situationPro = situationPro!;
    _callingCode = callingCode!;
    _preferedCampus = preferedCampus!;
    _ville = ville!;
    _quartier = quartier!;
    _whatsapp = whatsapp!;
    _skype = skype!;
    _id = id!;
    _fname = fname!;
    _lname = lname!;
    _email = email!;
    _password = password!;
    _level = level!;
    _status = status!;
    _numero = numero!;
    _rememberToken = rememberToken!;
    _detailsSpirituelsId = detailsSpirituelsId!;
    _conversionDateD = conversionDateD!;
    _baptemeDateD = baptemeDateD!;
    _spiritBaptN = spiritBaptN!;
    _langueN = langueN!;
    _dlangueDateD = dlangueDateD!;
    _aAssemblee = aAssemblee!;
    _departementV = departementV!;
    _eglise = eglise!;
    _egliseActuel = egliseActuel!;
    _convPersN = convPersN!;
    _frequencePrayN = frequencePrayN!;
    _pageBiblique = pageBiblique!;
    _dernierSujetV = dernierSujetV!;
    _aimeFaire = aimeFaire!;
    _donV = donV!;
    _detailDonV = detailDonV!;
    _fardeau = fardeau!;
    _statuN = statuN!;
  }

  Student.fromJson(dynamic json) {
    _sid = json["sid"] != null ? json["sid"] : 0;
    _studentIdN = json["student_id_n"] != null ? json["student_id_n"] : 0;
    _userId = json["user_id"] != null ? json["user_id"] : 0;
    _createdAt = json["created_at"] != null ? json["created_at"] : '';
    _updatedAt = json["updated_at"] != null ? json["updated_at"] : '';
    _profileIdN = json["profile_id_n"] != null ? json["profile_id_n"] : 0;
    _creatorIdN = json["creator_id_n"] != null ? json["creator_id_n"] : 0;
    _defaultLangV = json["default_lang_v"] != null ? json["default_lang_v"] : '';
    _citizenV = json["citizen_v"] != null ? json["citizen_v"] : '';
    _primaryPhoneV = json["primary_phone_v"] != null ? json["primary_phone_v"] : '';
    _secondaryPhoneV = json["secondary_phone_v"] != null ? json["secondary_phone_v"] : '';
    _sexeV = json["sexe_v"] != null ? json["sexe_v"] : '';
    _tailleV = json["taille_v"] != null ? json["taille_v"] : '';
    _professionV = json["profession_v"] != null ? json["profession_v"] : '';
    _dateNaissance = json["date_naissance"] != null ? json["date_naissance"] : '';
    _matrimoniale = json["matrimoniale"] != null ? json["matrimoniale"] : "";
    _partenaireName = json["partenaire_name"] != null ? json["partenaire_name"] : "";
    _nombreEnfant = json["nombre_enfant"] != null ? json["nombre_enfant"] : "";
    _charField5 = json["char_field_5"] != null ? json["char_field_5"] : "";
    _levelAcademy = json["level_academy"] != null ? json["level_academy"] : "";
    _facebook = json["facebook"] != null ? json["facebook"] : "";
    _pictureV = json["picture_v"] != null ? json["picture_v"] : "";
    _location = json["location"] != null ? json["location"] : "";
    _statusN = json["status_n"] != null ? json["status_n"] : 0;
    _situationPro = json["situation_pro"] != null ? json["situation_pro"] : 0;
    _callingCode = json["calling_code"] != null ? json["calling_code"] : "";
    _preferedCampus = json["prefered_campus"] != null ? json["prefered_campus"] : 0;
    _ville = json["ville"] != null ? json["ville"] : "";
    _quartier = json["quartier"] != null ? json["quartier"] : "";
    _whatsapp = json["whatsapp"] != null ? json["whatsapp"] : "";
    _skype = json["skype"] != null ? json["skype"] : "";
    _id = json["id"];
    _fname = json["fname"] != null ? json["fname"] : "";
    _lname = json["lname"] != null ? json["lname"] : "";
    _email = json["email"] != null ? json["email"] : "";
    _password = json["password"] != null ? json["password"] : "";
    _level = json["level"] != null ? json["level"] : 0;
    _status = json["status"];
    _numero = json["numero"] != null ? json["numero"] : "";
    _rememberToken =json["remember_token"] != null ? json["remember_token"] : "";
    _detailsSpirituelsId = json["details_spirituels_id"];
    _conversionDateD =
        json["conversion_date_d"] != null ? json["conversion_date_d"] : "";
    _baptemeDateD =
        json["bapteme_date_d"] != null ? json["bapteme_date_d"] : "";
    _spiritBaptN = json["spirit_bapt_n"] != null ? json["spirit_bapt_n"] : 0;
    _langueN = json["langue_n"] != null ? json["langue_n"] : 0;
    _dlangueDateD =
        json["dlangue_date_d"] != null ? json["dlangue_date_d"] : "";
    _aAssemblee = json["aAssemblee"] != null ? json["aAssemblee"] : 0;
    _departementV =
        (json["departement_v"] != null ? json["departement_v"] : "");
    _eglise = json["eglise"] != null ? json['eglise'] : "";
    _egliseActuel = json["eglise_actuel"] != null ? json["eglise_actuel"] : 0;
    _convPersN = json["conv_pers_n"] != null ? json["conv_pers_n"] : 0;
    _frequencePrayN =
        json["frequence_pray_n"] != null ? json["frequence_pray_n"] : "";
    _pageBiblique = json["page_biblique"] != null ? json["page_biblique"] : "";
    _dernierSujetV =
        json["dernier_sujet_v"] != null ? json["dernier_sujet_v"] : "";
    _aimeFaire = json["aime_faire"] != null ? json["aime_faire"] : "";
    _donV = json["don_v"] != null ? json["don_v"] : "";
    _detailDonV = json["detail_don_v"] != null ? json["detail_don_v"] : "";
    _fardeau = json["fardeau"] != null ? json["fardeau"] : "";
    _statuN = json["statu_n"] != null ? json["statu_n"] : 0;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["sid"] = _sid;
    map["student_id_n"] = _studentIdN;
    map["user_id"] = _userId;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    map["profile_id_n"] = _profileIdN;
    map["creator_id_n"] = _creatorIdN;
    map["default_lang_v"] = _defaultLangV;
    map["citizen_v"] = _citizenV;
    map["primary_phone_v"] = _primaryPhoneV;
    map["secondary_phone_v"] = _secondaryPhoneV;
    map["sexe_v"] = _sexeV;
    map["taille_v"] = _tailleV;
    map["profession_v"] = _professionV;
    map["date_naissance"] = _dateNaissance;
    map["matrimoniale"] = _matrimoniale;
    map["partenaire_name"] = _partenaireName;
    map["nombre_enfant"] = _nombreEnfant;
    map["char_field_5"] = _charField5;
    map["level_academy"] = _levelAcademy;
    map["facebook"] = _facebook;
    map["picture_v"] = _pictureV;
    map["location"] = _location;
    map["status_n"] = _statusN;
    map["situation_pro"] = _situationPro;
    map["calling_code"] = _callingCode;
    map["prefered_campus"] = _preferedCampus;
    map["ville"] = _ville;
    map["quartier"] = _quartier;
    map["whatsapp"] = _whatsapp;
    map["skype"] = _skype;
    map["id"] = _id;
    map["fname"] = _fname;
    map["lname"] = _lname;
    map["email"] = _email;
    map["password"] = _password;
    map["level"] = _level;
    map["status"] = _status;
    map["numero"] = _numero;
    map["remember_token"] = _rememberToken;
    map["details_spirituels_id"] = _detailsSpirituelsId;
    map["conversion_date_d"] = _conversionDateD;
    map["bapteme_date_d"] = _baptemeDateD;
    map["spirit_bapt_n"] = _spiritBaptN;
    map["langue_n"] = _langueN;
    map["dlangue_date_d"] = _dlangueDateD;
    map["aAssemblee"] = _aAssemblee;
    map["departement_v"] = _departementV;
    map["eglise"] = _eglise;
    map["eglise_actuel"] = _egliseActuel;
    map["conv_pers_n"] = _convPersN;
    map["frequence_pray_n"] = _frequencePrayN;
    map["page_biblique"] = _pageBiblique;
    map["dernier_sujet_v"] = _dernierSujetV;
    map["aime_faire"] = _aimeFaire;
    map["don_v"] = _donV;
    map["detail_don_v"] = _detailDonV;
    map["fardeau"] = _fardeau;
    map["statu_n"] = _statuN;
    return map;
  }
}
