import 'dart:convert';

LogsMeditations logsMeditationsFromJson(String str) => LogsMeditations.fromJson(json.decode(str));
String logsMeditationsToJson(LogsMeditations data) => json.encode(data.toJson());

class LogsMeditations {
  LogsMeditations({
    this.nombre,
    this.fetchMeditations,
    this.studentId,
    this.userId,
    this.campusId,
    this.schoolId,
    this.student,
    this.userData,
    this.counter,
  });

  int? nombre;
  List<FetchMeditation>? fetchMeditations;
  int? studentId;
  int? userId;
  int? campusId;
  int? schoolId;
  Student? student;
  UserData? userData;
  int? counter;

  factory LogsMeditations.fromJson(Map<String, dynamic> json) => LogsMeditations(
    nombre: json["nombre"] == null ? null : json["nombre"],
    fetchMeditations: json["fetchMeditations"] == null ? null : List<FetchMeditation>.from(json["fetchMeditations"].map((x) => FetchMeditation.fromJson(x))),
    studentId: json["student_id"] == null ? null : json["student_id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    campusId: json["campus_id"] == null ? null : json["campus_id"],
    schoolId: json["school_id"] == null ? null : json["school_id"],
    student: json["student"] == null ? null : Student.fromJson(json["student"]),
    userData: json["userData"] == null ? null : UserData.fromJson(json["userData"]),
    counter: json["counter"] == null ? null : json["counter"],
  );

  Map<String, dynamic> toJson() => {
    "nombre": nombre == null ? null : nombre,
    "fetchMeditations": fetchMeditations == null ? null : List<dynamic>.from(fetchMeditations!.map((x) => x.toJson())),
    "student_id": studentId == null ? null : studentId,
    "user_id": userId == null ? null : userId,
    "campus_id": campusId == null ? null : campusId,
    "school_id": schoolId == null ? null : schoolId,
    "student": student == null ? null : student!.toJson(),
    "userData": userData == null ? null : userData!.toJson(),
    "counter": counter == null ? null : counter,
  };
}

class FetchMeditation {
  FetchMeditation({
    this.id,
    this.userId,
    this.state,
    this.weekNumber,
    this.sessionId,
    this.createdAt,
    this.updatedAt,
    this.reponseMeditations,
  });

  int? id;
  int? userId;
  int? state;
  int? weekNumber;
  int? sessionId;
  DateTime? createdAt;
  DateTime? updatedAt;
  ReponseMeditations? reponseMeditations;

  factory FetchMeditation.fromJson(Map<String, dynamic> json) => FetchMeditation(
    id: json["id"] == null ? null : json["id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    state: json["state"] == null ? null : json["state"],
    weekNumber: json["weekNumber"] == null ? null : json["weekNumber"],
    sessionId: json["session_id"] == null ? null : json["session_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    reponseMeditations: json["reponseMeditations"] == null ? null : ReponseMeditations.fromJson(json["reponseMeditations"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_id": userId == null ? null : userId,
    "state": state == null ? null : state,
    "weekNumber": weekNumber == null ? null : weekNumber,
    "session_id": sessionId == null ? null : sessionId,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "reponseMeditations": reponseMeditations == null ? null : reponseMeditations!.toJson(),
  };
}

class ReponseMeditations {
  ReponseMeditations({
    this.id,
    this.textToMeditate,
    this.meditation,
    this.revelation,
    this.action,
    this.planLectureDetail,
    this.priere,
    this.userId,
    this.vertumetreId,
  });

  int? id;
  String? textToMeditate;
  String? meditation;
  String? revelation;
  String? action;
  dynamic planLectureDetail;
  String? priere;
  int? userId;
  int? vertumetreId;

  factory ReponseMeditations.fromJson(Map<String, dynamic> json) => ReponseMeditations(
    id: json["id"] == null ? null : json["id"],
    textToMeditate: json["textToMeditate"] == null ? null : json["textToMeditate"],
    meditation: json["meditation"] == null ? null : json["meditation"],
    revelation: json["revelation"] == null ? null : json["revelation"],
    action: json["action"] == null ? null : json["action"],
    planLectureDetail: json["plan_lecture_detail"],
    priere: json["priere"] == null ? null : json["priere"],
    userId: json["user_id"] == null ? null : json["user_id"],
    vertumetreId: json["vertumetre_id"] == null ? null : json["vertumetre_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "textToMeditate": textToMeditate == null ? null : textToMeditate,
    "meditation": meditation == null ? null : meditation,
    "revelation": revelation == null ? null : revelation,
    "action": action == null ? null : action,
    "plan_lecture_detail": planLectureDetail,
    "priere": priere == null ? null : priere,
    "user_id": userId == null ? null : userId,
    "vertumetre_id": vertumetreId == null ? null : vertumetreId,
  };
}

class Student {
  Student({
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
  });

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
  DateTime? dateNaissance;
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

  factory Student.fromJson(Map<String, dynamic> json) => Student(
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
    dateNaissance: json["date_naissance"] == null ? null : DateTime.parse(json["date_naissance"]),
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
  );

  Map<String, dynamic> toJson() => {
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
    "date_naissance": dateNaissance == null ? null : dateNaissance!.toIso8601String(),
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
  };
}

class UserData {
  UserData({
    this.id,
    this.fname,
    this.lname,
    this.email,
    this.level,
    this.status,
    this.numero,
    this.rememberToken,
    this.apiToken,
  });

  int? id;
  String? fname;
  String? lname;
  String? email;
  int? level;
  int? status;
  String? numero;
  String? rememberToken;
  String? apiToken;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["id"] == null ? null : json["id"],
    fname: json["fname"] == null ? null : json["fname"],
    lname: json["lname"] == null ? null : json["lname"],
    email: json["email"] == null ? null : json["email"],
    level: json["level"] == null ? null : json["level"],
    status: json["status"] == null ? null : json["status"],
    numero: json["numero"] == null ? null : json["numero"],
    rememberToken: json["remember_token"] == null ? null : json["remember_token"],
    apiToken: json["api_token"] == null ? null : json["api_token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "fname": fname == null ? null : fname,
    "lname": lname == null ? null : lname,
    "email": email == null ? null : email,
    "level": level == null ? null : level,
    "status": status == null ? null : status,
    "numero": numero == null ? null : numero,
    "remember_token": rememberToken == null ? null : rememberToken,
    "api_token": apiToken == null ? null : apiToken,
  };
}
