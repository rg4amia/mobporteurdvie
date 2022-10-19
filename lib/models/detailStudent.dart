import 'dart:convert';

DetailStudent detailStudentFromJson(String str) => DetailStudent.fromJson(json.decode(str));

String detailStudentToJson(DetailStudent data) => json.encode(data.toJson());

class DetailStudent {
  DetailStudent({
    this.students,
    this.versements,
    this.school,
    this.solde,
    this.comments,
    this.getEcole,
    this.getEcoleScolarite,
    this.getVersement
  });
/*"get_ecole_scolarite1": 50000,
    "get_ecole": 1,
    "get_versement": 1*/
  Students? students;
  List<Versement>? versements;
  School? school;
  int? solde;
  int? getEcoleScolarite;
  int? getEcole;
  int? getVersement;
  List<dynamic>? comments;

  factory DetailStudent.fromJson(Map<String, dynamic> json) => DetailStudent(
    students: json["students"] == null ? null : Students.fromJson(json["students"]),
    versements: json["versements"] == null ? null : List<Versement>.from(json["versements"].map((x) => Versement.fromJson(x))),
    school: json["school"] == null ? null : School.fromJson(json["school"]),
    solde: json["solde"] == null ? null : json["solde"],
    getEcoleScolarite: json["get_ecole_scolarite1"] == null ? null : json["get_ecole_scolarite1"],
    getEcole: json["get_ecole"] == null ? null : json["get_ecole"],
    getVersement: json["get_versement"] == null ? null : json["get_versement"],
    comments: json["comments"] == null ? null : List<dynamic>.from(json["comments"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "students": students == null ? null : students!.toJson(),
    "versements": versements == null ? null : List<dynamic>.from(versements!.map((x) => x.toJson())),
    "school": school == null ? null : school!.toJson(),
    "solde": solde == null ? null : solde,
    "comments": comments == null ? null : List<dynamic>.from(comments!.map((x) => x)),
  };
}

class School {
  School({
    this.classIdN,
    this.studentId,
    this.sessionId,
    this.schoolId,
    this.campusId,
    this.paymentStatus,
    this.vs,
    this.createdAt,
    this.updatedAt,
    this.statusN,
  });

  int? classIdN;
  int? studentId;
  int? sessionId;
  int? schoolId;
  int? campusId;
  int? paymentStatus;
  dynamic vs;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? statusN;

  factory School.fromJson(Map<String, dynamic> json) => School(
    classIdN: json["class_id_n"] == null ? null : json["class_id_n"],
    studentId: json["student_id"] == null ? null : json["student_id"],
    sessionId: json["session_id"] == null ? null : json["session_id"],
    schoolId: json["school_id"] == null ? null : json["school_id"],
    campusId: json["campus_id"] == null ? null : json["campus_id"],
    paymentStatus: json["payment_status"] == null ? null : json["payment_status"],
    vs: json["vs"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    statusN: json["status_n"] == null ? null : json["status_n"],
  );

  Map<String, dynamic> toJson() => {
    "class_id_n": classIdN == null ? null : classIdN,
    "student_id": studentId == null ? null : studentId,
    "session_id": sessionId == null ? null : sessionId,
    "school_id": schoolId == null ? null : schoolId,
    "campus_id": campusId == null ? null : campusId,
    "payment_status": paymentStatus == null ? null : paymentStatus,
    "vs": vs,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "status_n": statusN == null ? null : statusN,
  };
}

class Students {
  Students({
    this.sid,
    this.studentIdN,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.profileIdN,
    this.creatorIdN,
    this.defaultLangV,
    this.citizenV,
    this.primaryPhoneV,
    this.secondaryPhoneV,
    this.sexeV,
    this.tailleV,
    this.professionV,
    this.dateNaissance,
    this.matrimoniale,
    this.partenaireName,
    this.nombreEnfant,
    this.charField5,
    this.levelAcademy,
    this.facebook,
    this.pictureV,
    this.location,
    this.statusN,
    this.situationPro,
    this.callingCode,
    this.preferedCampus,
    this.ville,
    this.quartier,
    this.whatsapp,
    this.skype,
    this.id,
    this.fname,
    this.lname,
    this.email,
    this.password,
    this.level,
    this.status,
    this.numero,
    this.rememberToken,
    this.apiToken,
    this.detailsSpirituelsId,
    this.conversionDateD,
    this.baptemeDateD,
    this.spiritBaptN,
    this.langueN,
    this.dlangueDateD,
    this.aAssemblee,
    this.departementV,
    this.eglise,
    this.egliseActuel,
    this.convPersN,
    this.frequencePrayN,
    this.pageBiblique,
    this.dernierSujetV,
    this.aimeFaire,
    this.donV,
    this.detailDonV,
    this.fardeau,
    this.statuN,
  });

  int? sid;
  int? studentIdN;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? profileIdN;
  int? creatorIdN;
  String? defaultLangV;
  String? citizenV;
  String? primaryPhoneV;
  String? secondaryPhoneV;
  String? sexeV;
  String? tailleV;
  String? professionV;
  String? dateNaissance;
  int? matrimoniale;
  String? partenaireName;
  int? nombreEnfant;
  String? charField5;
  int? levelAcademy;
  String? facebook;
  String? pictureV;
  String? location;
  int? statusN;
  int? situationPro;
  String? callingCode;
  int? preferedCampus;
  String? ville;
  String? quartier;
  String? whatsapp;
  dynamic skype;
  int? id;
  String? fname;
  String? lname;
  String? email;
  String? password;
  int? level;
  int? status;
  String? numero;
  String? rememberToken;
  String? apiToken;
  int? detailsSpirituelsId;
  String? conversionDateD;
  String? baptemeDateD;
  int? spiritBaptN;
  int? langueN;
  String? dlangueDateD;
  int? aAssemblee;
  String? departementV;
  String? eglise;
  int? egliseActuel;
  int? convPersN;
  String? frequencePrayN;
  String? pageBiblique;
  String? dernierSujetV;
  String? aimeFaire;
  String? donV;
  String? detailDonV;
  String? fardeau;
  int? statuN;

  factory Students.fromJson(Map<String, dynamic> json) => Students(
    sid: json["sid"] == null ? null : json["sid"],
    studentIdN: json["student_id_n"] == null ? null : json["student_id_n"],
    userId: json["user_id"] == null ? null : json["user_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    profileIdN: json["profile_id_n"] == null ? null : json["profile_id_n"],
    creatorIdN: json["creator_id_n"] == null ? null : json["creator_id_n"],
    defaultLangV: json["default_lang_v"] == null ? null : json["default_lang_v"],
    citizenV: json["citizen_v"] == null ? null : json["citizen_v"],
    primaryPhoneV: json["primary_phone_v"] == null ? null : json["primary_phone_v"],
    secondaryPhoneV: json["secondary_phone_v"] == null ? null : json["secondary_phone_v"],
    sexeV: json["sexe_v"] == null ? null : json["sexe_v"],
    tailleV: json["taille_v"] == null ? null : json["taille_v"],
    professionV: json["profession_v"] == null ? null : json["profession_v"],
    dateNaissance: json["date_naissance"] == null ? null : json["date_naissance"],
    matrimoniale: json["matrimoniale"] == null ? null : json["matrimoniale"],
    partenaireName: json["partenaire_name"] == null ? null : json["partenaire_name"],
    nombreEnfant: json["nombre_enfant"] == null ? null : json["nombre_enfant"],
    charField5: json["char_field_5"] == null ? null : json["char_field_5"],
    levelAcademy: json["level_academy"] == null ? null : json["level_academy"],
    facebook: json["facebook"] == null ? null : json["facebook"],
    pictureV: json["picture_v"] == null ? null : json["picture_v"],
    location: json["location"] == null ? null : json["location"],
    statusN: json["status_n"] == null ? null : json["status_n"],
    situationPro: json["situation_pro"] == null ? null : json["situation_pro"],
    callingCode: json["calling_code"] == null ? null : json["calling_code"],
    preferedCampus: json["prefered_campus"] == null ? null : json["prefered_campus"],
    ville: json["ville"] == null ? null : json["ville"],
    quartier: json["quartier"] == null ? null : json["quartier"],
    whatsapp: json["whatsapp"] == null ? null : json["whatsapp"],
    skype: json["skype"],
    id: json["id"] == null ? null : json["id"],
    fname: json["fname"] == null ? null : json["fname"],
    lname: json["lname"] == null ? null : json["lname"],
    email: json["email"] == null ? null : json["email"],
    password: json["password"] == null ? null : json["password"],
    level: json["level"] == null ? null : json["level"],
    status: json["status"] == null ? null : json["status"],
    numero: json["numero"] == null ? null : json["numero"],
    rememberToken: json["remember_token"] == null ? null : json["remember_token"],
    apiToken: json["api_token"] == null ? null : json["api_token"],
    detailsSpirituelsId: json["details_spirituels_id"] == null ? null : json["details_spirituels_id"],
    conversionDateD: json["conversion_date_d"] == null ? null : json["conversion_date_d"],
    baptemeDateD: json["bapteme_date_d"] == null ? null : json["bapteme_date_d"],
    spiritBaptN: json["spirit_bapt_n"] == null ? null : json["spirit_bapt_n"],
    langueN: json["langue_n"] == null ? null : json["langue_n"],
    dlangueDateD: json["dlangue_date_d"] == null ? null : json["dlangue_date_d"],
    aAssemblee: json["aAssemblee"] == null ? null : json["aAssemblee"],
    departementV: json["departement_v"] == null ? null : json["departement_v"],
    eglise: json["eglise"] == null ? null : json["eglise"],
    egliseActuel: json["eglise_actuel"] == null ? null : json["eglise_actuel"],
    convPersN: json["conv_pers_n"] == null ? null : json["conv_pers_n"],
    frequencePrayN: json["frequence_pray_n"] == null ? null : json["frequence_pray_n"],
    pageBiblique: json["page_biblique"] == null ? null : json["page_biblique"],
    dernierSujetV: json["dernier_sujet_v"] == null ? null : json["dernier_sujet_v"],
    aimeFaire: json["aime_faire"] == null ? null : json["aime_faire"],
    donV: json["don_v"] == null ? null : json["don_v"],
    detailDonV: json["detail_don_v"] == null ? null : json["detail_don_v"],
    fardeau: json["fardeau"] == null ? null : json["fardeau"],
    statuN: json["statu_n"] == null ? null : json["statu_n"],
  );

  Map<String, dynamic> toJson() => {
    "sid": sid == null ? null : sid,
    "student_id_n": studentIdN == null ? null : studentIdN,
    "user_id": userId == null ? null : userId,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "profile_id_n": profileIdN == null ? null : profileIdN,
    "creator_id_n": creatorIdN == null ? null : creatorIdN,
    "default_lang_v": defaultLangV == null ? null : defaultLangV,
    "citizen_v": citizenV == null ? null : citizenV,
    "primary_phone_v": primaryPhoneV == null ? null : primaryPhoneV,
    "secondary_phone_v": secondaryPhoneV == null ? null : secondaryPhoneV,
    "sexe_v": sexeV == null ? null : sexeV,
    "taille_v": tailleV == null ? null : tailleV,
    "profession_v": professionV == null ? null : professionV,
    "date_naissance": dateNaissance == null ? null : dateNaissance,
    "matrimoniale": matrimoniale == null ? null : matrimoniale,
    "partenaire_name": partenaireName == null ? null : partenaireName,
    "nombre_enfant": nombreEnfant == null ? null : nombreEnfant,
    "char_field_5": charField5 == null ? null : charField5,
    "level_academy": levelAcademy == null ? null : levelAcademy,
    "facebook": facebook == null ? null : facebook,
    "picture_v": pictureV == null ? null : pictureV,
    "location": location == null ? null : location,
    "status_n": statusN == null ? null : statusN,
    "situation_pro": situationPro == null ? null : situationPro,
    "calling_code": callingCode == null ? null : callingCode,
    "prefered_campus": preferedCampus == null ? null : preferedCampus,
    "ville": ville == null ? null : ville,
    "quartier": quartier == null ? null : quartier,
    "whatsapp": whatsapp == null ? null : whatsapp,
    "skype": skype,
    "id": id == null ? null : id,
    "fname": fname == null ? null : fname,
    "lname": lname == null ? null : lname,
    "email": email == null ? null : email,
    "password": password == null ? null : password,
    "level": level == null ? null : level,
    "status": status == null ? null : status,
    "numero": numero == null ? null : numero,
    "remember_token": rememberToken == null ? null : rememberToken,
    "api_token": apiToken == null ? null : apiToken,
    "details_spirituels_id": detailsSpirituelsId == null ? null : detailsSpirituelsId,
    "conversion_date_d": conversionDateD == null ? null : conversionDateD,
    "bapteme_date_d": baptemeDateD == null ? null : baptemeDateD,
    "spirit_bapt_n": spiritBaptN == null ? null : spiritBaptN,
    "langue_n": langueN == null ? null : langueN,
    "dlangue_date_d": dlangueDateD == null ? null : dlangueDateD,
    "aAssemblee": aAssemblee == null ? null : aAssemblee,
    "departement_v": departementV == null ? null : departementV,
    "eglise": eglise == null ? null : eglise,
    "eglise_actuel": egliseActuel == null ? null : egliseActuel,
    "conv_pers_n": convPersN == null ? null : convPersN,
    "frequence_pray_n": frequencePrayN == null ? null : frequencePrayN,
    "page_biblique": pageBiblique == null ? null : pageBiblique,
    "dernier_sujet_v": dernierSujetV == null ? null : dernierSujetV,
    "aime_faire": aimeFaire == null ? null : aimeFaire,
    "don_v": donV == null ? null : donV,
    "detail_don_v": detailDonV == null ? null : detailDonV,
    "fardeau": fardeau == null ? null : fardeau,
    "statu_n": statuN == null ? null : statuN,
  };
}

class Versement {
  Versement({
    this.id,
    this.montant,
    this.frais,
    this.lettre,
    this.userId,
    this.rank,
    this.code,
    this.solde,
    this.reste,
    this.sessionId,
    this.status,
    this.author,
    this.reference,
    this.signature,
    this.dateD,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.url
  });

  int? id;
  int? montant;
  String? frais;
  String? lettre;
  int? userId;
  int? rank;
  String? code;
  int? solde;
  int? reste;
  int? sessionId;
  int? status;
  String? author;
  String? reference;
  dynamic signature;
  DateTime? dateD;
  int? type;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? url;

  factory Versement.fromJson(Map<String, dynamic> json) => Versement(
    id: json["id"] == null ? null : json["id"],
    montant: json["montant"] == null ? null : json["montant"],
    frais: json["frais"] == null ? null : json["frais"],
    lettre: json["lettre"] == null ? null : json["lettre"],
    userId: json["user_id"] == null ? null : json["user_id"],
    rank: json["rank"] == null ? null : json["rank"],
    code: json["code"] == null ? null : json["code"],
    solde: json["solde"] == null ? null : json["solde"],
    reste: json["reste"] == null ? null : json["reste"],
    sessionId: json["session_id"] == null ? null : json["session_id"],
    status: json["status"] == null ? null : json["status"],
    author: json["author"] == null ? null : json["author"],
    reference: json["reference"] == null ? null : json["reference"],
    signature: json["signature"],
    dateD: json["date_d"] == null ? null : DateTime.parse(json["date_d"]),
    type: json["type"] == null ? null : json["type"],
    url: json["url"] == null ? null : json["url"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "montant": montant == null ? null : montant,
    "frais": frais == null ? null : frais,
    "lettre": lettre == null ? null : lettre,
    "user_id": userId == null ? null : userId,
    "rank": rank == null ? null : rank,
    "code": code == null ? null : code,
    "solde": solde == null ? null : solde,
    "reste": reste == null ? null : reste,
    "session_id": sessionId == null ? null : sessionId,
    "status": status == null ? null : status,
    "author": author == null ? null : author,
    "reference": reference == null ? null : reference,
    "signature": signature,
    "date_d": dateD == null ? null : dateD!.toIso8601String(),
    "type": type == null ? null : type,
    "url": url == null ? null : url,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}
