import 'dart:convert';

LogsVertumetre logsVertumetreFromJson(String str) => LogsVertumetre.fromJson(json.decode(str));
String logsVertumetreToJson(LogsVertumetre data) => json.encode(data.toJson());

class LogsVertumetre {
  LogsVertumetre({
    this.fetchDataVertumetres,
    this.studentId,
    this.userId,
    this.mapData,
    this.mapData2,
    this.campusId,
    this.schoolId,
    this.student,
    this.userData,
    this.counter,
  });

  List<FetchDataVertumetre>? fetchDataVertumetres;
  int? studentId;
  int? userId;
  String? mapData;
  String? mapData2;
  int? campusId;
  int? schoolId;
  Student? student;
  UserData? userData;
  int? counter;

  factory LogsVertumetre.fromJson(Map<String, dynamic> json) => LogsVertumetre(
    fetchDataVertumetres: json["fetchDataVertumetres"] == null ? null : List<FetchDataVertumetre>.from(json["fetchDataVertumetres"].map((x) => FetchDataVertumetre.fromJson(x))),
    studentId: json["student_id"] == null ? null : json["student_id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    mapData: json["mapData"] == null ? null : json["mapData"],
    mapData2: json["mapData2"] == null ? null : json["mapData2"],
    campusId: json["campus_id"] == null ? null : json["campus_id"],
    schoolId: json["school_id"] == null ? null : json["school_id"],
    student: json["student"] == null ? null : Student.fromJson(json["student"]),
    userData: json["userData"] == null ? null : UserData.fromJson(json["userData"]),
    counter: json["counter"] == null ? null : json["counter"],
  );

  Map<String, dynamic> toJson() => {
    "fetchDataVertumetres": fetchDataVertumetres == null ? null : List<dynamic>.from(fetchDataVertumetres!.map((x) => x.toJson())),
    "student_id": studentId == null ? null : studentId,
    "user_id": userId == null ? null : userId,
    "mapData": mapData == null ? null : mapData,
    "mapData2": mapData2 == null ? null : mapData2,
    "campus_id": campusId == null ? null : campusId,
    "school_id": schoolId == null ? null : schoolId,
    "student": student == null ? null : student!.toJson(),
    "userData": userData == null ? null : userData!.toJson(),
    "counter": counter == null ? null : counter,
  };
}

class FetchDataVertumetre {
  FetchDataVertumetre({
    this.id,
    this.userId,
    this.state,
    this.weekNumber,
    this.sessionId,
    this.createdAt,
    this.updatedAt,
    this.responseVertumetre,
  });

  int? id;
  int?  userId;
  int? state;
  int? weekNumber;
  int? sessionId;
  DateTime? createdAt;
  DateTime? updatedAt;
  ResponseVertumetre? responseVertumetre;

  factory FetchDataVertumetre.fromJson(Map<String, dynamic> json) => FetchDataVertumetre(
    id: json["id"] == null ? null : json["id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    state: json["state"] == null ? null : json["state"],
    weekNumber: json["weekNumber"] == null ? null : json["weekNumber"],
    sessionId: json["session_id"] == null ? null : json["session_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    responseVertumetre: json["responseVertumetre"] == null ? null : ResponseVertumetre.fromJson(json["responseVertumetre"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_id": userId == null ? null : userId,
    "state": state == null ? null : state,
    "weekNumber": weekNumber == null ? null : weekNumber,
    "session_id": sessionId == null ? null : sessionId,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "responseVertumetre": responseVertumetre == null ? null : responseVertumetre!.toJson(),
  };
}

class ResponseVertumetre {
  ResponseVertumetre({
    this.nombre,
    this.viePriere1,
    this.viePriere2,
    this.viePriere3,
    this.viePriere4,
    this.tempsPriere1,
    this.tempsPriere2,
    this.tempsPriere3,
    this.tempsPriere4,
    this.jeunePriere1,
    this.jeunePriere2,
    this.jeunePriere3,
    this.jeunePriere4,
    this.sujetPriere,
    this.sujetPriereAutre,
    this.soutienSujet,
    this.mediParoleJour1,
    this.mediParoleJour2,
    this.mediParoleJour3,
    this.mediParoleJour4,
    this.mediParoleDuree1,
    this.mediParoleDuree2,
    this.mediParoleDuree3,
    this.mediParoleDuree4,
    this.mediParoleVlecture1,
    this.mediParoleVlecture2,
    this.mediParoleVlecture3,
    this.mediParoleVlecture4,
    this.mediParolePlecture1,
    this.mediParolePlecture2,
    this.mediParolePlecture3,
    this.mediParolePprecisez,
    this.enseiEcoute,
    this.mediParoleTemoi1,
    this.mediParoleTemoi2,
    this.mediParoleTemoi3,
    this.mediParoleTemoi4,
    this.mediParoleTemoi5,
    this.mediParoleTemoi6,
    this.mediParoleTemoi7,
    this.mediParoleTemoi8,
    this.mediParoleTemoi9,
    this.mediParoleTemoi10,
    this.mediParoleTexplik,
    this.examHebdoEx11,
    this.examHebdoEx12,
    this.examHebdoEx13,
    this.examHebdoEx14,
    this.examHebdoEx21,
    this.examHebdoEx22,
    this.examHebdoEx23,
    this.examHebdoEx24,
    this.examHebdoEx31,
    this.examHebdoEx32,
    this.examHebdoEx33,
    this.examHebdoEx34,
    this.examHebdoEx41,
    this.examHebdoEx42,
    this.examHebdoEx43,
    this.examHebdoEx44,
    this.examHebdoEx51,
    this.examHebdoEx52,
    this.examHebdoEx53,
    this.examHebdoEx54,
    this.examHebdoEx61,
    this.examHebdoEx62,
    this.examHebdoEx63,
    this.examHebdoEx64,
  });

  int? nombre;
  bool? viePriere1;
  bool? viePriere2;
  bool? viePriere3;
  bool? viePriere4;
  bool? tempsPriere1;
  bool? tempsPriere2;
  bool? tempsPriere3;
  bool? tempsPriere4;
  bool? jeunePriere1;
  bool? jeunePriere2;
  bool? jeunePriere3;
  bool? jeunePriere4;
  Map<String, bool>? sujetPriere;
  String? sujetPriereAutre;
  String? soutienSujet;
  bool? mediParoleJour1;
  bool? mediParoleJour2;
  bool? mediParoleJour3;
  bool? mediParoleJour4;
  bool? mediParoleDuree1;
  bool? mediParoleDuree2;
  bool? mediParoleDuree3;
  bool? mediParoleDuree4;
  bool? mediParoleVlecture1;
  bool? mediParoleVlecture2;
  bool? mediParoleVlecture3;
  bool? mediParoleVlecture4;
  bool? mediParolePlecture1;
  bool? mediParolePlecture2;
  bool? mediParolePlecture3;
  String? mediParolePprecisez;
  String? enseiEcoute;
  bool? mediParoleTemoi1;
  bool? mediParoleTemoi2;
  bool? mediParoleTemoi3;
  bool? mediParoleTemoi4;
  bool? mediParoleTemoi5;
  bool? mediParoleTemoi6;
  bool? mediParoleTemoi7;
  bool? mediParoleTemoi8;
  bool? mediParoleTemoi9;
  bool? mediParoleTemoi10;
  String? mediParoleTexplik;
  bool? examHebdoEx11;
  bool? examHebdoEx12;
  bool? examHebdoEx13;
  bool? examHebdoEx14;
  bool? examHebdoEx21;
  bool? examHebdoEx22;
  bool? examHebdoEx23;
  bool? examHebdoEx24;
  bool? examHebdoEx31;
  bool? examHebdoEx32;
  bool? examHebdoEx33;
  bool? examHebdoEx34;
  bool? examHebdoEx41;
  bool? examHebdoEx42;
  bool? examHebdoEx43;
  bool? examHebdoEx44;
  bool? examHebdoEx51;
  bool? examHebdoEx52;
  bool? examHebdoEx53;
  bool? examHebdoEx54;
  bool? examHebdoEx61;
  bool? examHebdoEx62;
  bool? examHebdoEx63;
  bool? examHebdoEx64;

  factory ResponseVertumetre.fromJson(Map<String, dynamic> json) => ResponseVertumetre(
    nombre: json["nombre"] == null ? null : json["nombre"],
    viePriere1: json["vie_priere1"] == null ? null : json["vie_priere1"],
    viePriere2: json["vie_priere2"] == null ? null : json["vie_priere2"],
    viePriere3: json["vie_priere3"] == null ? null : json["vie_priere3"],
    viePriere4: json["vie_priere4"] == null ? null : json["vie_priere4"],
    tempsPriere1: json["temps_priere1"] == null ? null : json["temps_priere1"],
    tempsPriere2: json["temps_priere2"] == null ? null : json["temps_priere2"],
    tempsPriere3: json["temps_priere3"] == null ? null : json["temps_priere3"],
    tempsPriere4: json["temps_priere4"] == null ? null : json["temps_priere4"],
    jeunePriere1: json["jeune_priere1"] == null ? null : json["jeune_priere1"],
    jeunePriere2: json["jeune_priere2"] == null ? null : json["jeune_priere2"],
    jeunePriere3: json["jeune_priere3"] == null ? null : json["jeune_priere3"],
    jeunePriere4: json["jeune_priere4"] == null ? null : json["jeune_priere4"],
    sujetPriere: json["sujet_priere"] == null ? null : Map.from(json["sujet_priere"]).map((k, v) => MapEntry<String, bool>(k, v)),
    sujetPriereAutre: json["sujet_priere_autre"] == null ? null : json["sujet_priere_autre"],
    soutienSujet: json["soutien_sujet"] == null ? null : json["soutien_sujet"],
    mediParoleJour1: json["medi_parole_jour1"] == null ? null : json["medi_parole_jour1"],
    mediParoleJour2: json["medi_parole_jour2"] == null ? null : json["medi_parole_jour2"],
    mediParoleJour3: json["medi_parole_jour3"] == null ? null : json["medi_parole_jour3"],
    mediParoleJour4: json["medi_parole_jour4"] == null ? null : json["medi_parole_jour4"],
    mediParoleDuree1: json["medi_parole_duree1"] == null ? null : json["medi_parole_duree1"],
    mediParoleDuree2: json["medi_parole_duree2"] == null ? null : json["medi_parole_duree2"],
    mediParoleDuree3: json["medi_parole_duree3"] == null ? null : json["medi_parole_duree3"],
    mediParoleDuree4: json["medi_parole_duree4"] == null ? null : json["medi_parole_duree4"],
    mediParoleVlecture1: json["medi_parole_vlecture1"] == null ? null : json["medi_parole_vlecture1"],
    mediParoleVlecture2: json["medi_parole_vlecture2"] == null ? null : json["medi_parole_vlecture2"],
    mediParoleVlecture3: json["medi_parole_vlecture3"] == null ? null : json["medi_parole_vlecture3"],
    mediParoleVlecture4: json["medi_parole_vlecture4"] == null ? null : json["medi_parole_vlecture4"],
    mediParolePlecture1: json["medi_parole_plecture1"] == null ? null : json["medi_parole_plecture1"],
    mediParolePlecture2: json["medi_parole_plecture2"] == null ? null : json["medi_parole_plecture2"],
    mediParolePlecture3: json["medi_parole_plecture3"] == null ? null : json["medi_parole_plecture3"],
    mediParolePprecisez: json["medi_parole_pprecisez"] == null ? null : json["medi_parole_pprecisez"],
    enseiEcoute: json["ensei_ecoute"] == null ? null : json["ensei_ecoute"],
    mediParoleTemoi1: json["medi_parole_temoi1"] == null ? null : json["medi_parole_temoi1"],
    mediParoleTemoi2: json["medi_parole_temoi2"] == null ? null : json["medi_parole_temoi2"],
    mediParoleTemoi3: json["medi_parole_temoi3"] == null ? null : json["medi_parole_temoi3"],
    mediParoleTemoi4: json["medi_parole_temoi4"] == null ? null : json["medi_parole_temoi4"],
    mediParoleTemoi5: json["medi_parole_temoi5"] == null ? null : json["medi_parole_temoi5"],
    mediParoleTemoi6: json["medi_parole_temoi6"] == null ? null : json["medi_parole_temoi6"],
    mediParoleTemoi7: json["medi_parole_temoi7"] == null ? null : json["medi_parole_temoi7"],
    mediParoleTemoi8: json["medi_parole_temoi8"] == null ? null : json["medi_parole_temoi8"],
    mediParoleTemoi9: json["medi_parole_temoi9"] == null ? null : json["medi_parole_temoi9"],
    mediParoleTemoi10: json["medi_parole_temoi10"] == null ? null : json["medi_parole_temoi10"],
    mediParoleTexplik: json["medi_parole_texplik"] == null ? null : json["medi_parole_texplik"],
    examHebdoEx11: json["exam_hebdo_ex11"] == null ? null : json["exam_hebdo_ex11"],
    examHebdoEx12: json["exam_hebdo_ex12"] == null ? null : json["exam_hebdo_ex12"],
    examHebdoEx13: json["exam_hebdo_ex13"] == null ? null : json["exam_hebdo_ex13"],
    examHebdoEx14: json["exam_hebdo_ex14"] == null ? null : json["exam_hebdo_ex14"],
    examHebdoEx21: json["exam_hebdo_ex21"] == null ? null : json["exam_hebdo_ex21"],
    examHebdoEx22: json["exam_hebdo_ex22"] == null ? null : json["exam_hebdo_ex22"],
    examHebdoEx23: json["exam_hebdo_ex23"] == null ? null : json["exam_hebdo_ex23"],
    examHebdoEx24: json["exam_hebdo_ex24"] == null ? null : json["exam_hebdo_ex24"],
    examHebdoEx31: json["exam_hebdo_ex31"] == null ? null : json["exam_hebdo_ex31"],
    examHebdoEx32: json["exam_hebdo_ex32"] == null ? null : json["exam_hebdo_ex32"],
    examHebdoEx33: json["exam_hebdo_ex33"] == null ? null : json["exam_hebdo_ex33"],
    examHebdoEx34: json["exam_hebdo_ex34"] == null ? null : json["exam_hebdo_ex34"],
    examHebdoEx41: json["exam_hebdo_ex41"] == null ? null : json["exam_hebdo_ex41"],
    examHebdoEx42: json["exam_hebdo_ex42"] == null ? null : json["exam_hebdo_ex42"],
    examHebdoEx43: json["exam_hebdo_ex43"] == null ? null : json["exam_hebdo_ex43"],
    examHebdoEx44: json["exam_hebdo_ex44"] == null ? null : json["exam_hebdo_ex44"],
    examHebdoEx51: json["exam_hebdo_ex51"] == null ? null : json["exam_hebdo_ex51"],
    examHebdoEx52: json["exam_hebdo_ex52"] == null ? null : json["exam_hebdo_ex52"],
    examHebdoEx53: json["exam_hebdo_ex53"] == null ? null : json["exam_hebdo_ex53"],
    examHebdoEx54: json["exam_hebdo_ex54"] == null ? null : json["exam_hebdo_ex54"],
    examHebdoEx61: json["exam_hebdo_ex61"] == null ? null : json["exam_hebdo_ex61"],
    examHebdoEx62: json["exam_hebdo_ex62"] == null ? null : json["exam_hebdo_ex62"],
    examHebdoEx63: json["exam_hebdo_ex63"] == null ? null : json["exam_hebdo_ex63"],
    examHebdoEx64: json["exam_hebdo_ex64"] == null ? null : json["exam_hebdo_ex64"],
  );

  Map<String, dynamic> toJson() => {
    "nombre": nombre == null ? null : nombre,
    "vie_priere1": viePriere1 == null ? null : viePriere1,
    "vie_priere2": viePriere2 == null ? null : viePriere2,
    "vie_priere3": viePriere3 == null ? null : viePriere3,
    "vie_priere4": viePriere4 == null ? null : viePriere4,
    "temps_priere1": tempsPriere1 == null ? null : tempsPriere1,
    "temps_priere2": tempsPriere2 == null ? null : tempsPriere2,
    "temps_priere3": tempsPriere3 == null ? null : tempsPriere3,
    "temps_priere4": tempsPriere4 == null ? null : tempsPriere4,
    "jeune_priere1": jeunePriere1 == null ? null : jeunePriere1,
    "jeune_priere2": jeunePriere2 == null ? null : jeunePriere2,
    "jeune_priere3": jeunePriere3 == null ? null : jeunePriere3,
    "jeune_priere4": jeunePriere4 == null ? null : jeunePriere4,
    "sujet_priere": sujetPriere == null ? null : Map.from(sujetPriere!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "sujet_priere_autre": sujetPriereAutre == null ? null : sujetPriereAutre,
    "soutien_sujet": soutienSujet == null ? null : soutienSujet,
    "medi_parole_jour1": mediParoleJour1 == null ? null : mediParoleJour1,
    "medi_parole_jour2": mediParoleJour2 == null ? null : mediParoleJour2,
    "medi_parole_jour3": mediParoleJour3 == null ? null : mediParoleJour3,
    "medi_parole_jour4": mediParoleJour4 == null ? null : mediParoleJour4,
    "medi_parole_duree1": mediParoleDuree1 == null ? null : mediParoleDuree1,
    "medi_parole_duree2": mediParoleDuree2 == null ? null : mediParoleDuree2,
    "medi_parole_duree3": mediParoleDuree3 == null ? null : mediParoleDuree3,
    "medi_parole_duree4": mediParoleDuree4 == null ? null : mediParoleDuree4,
    "medi_parole_vlecture1": mediParoleVlecture1 == null ? null : mediParoleVlecture1,
    "medi_parole_vlecture2": mediParoleVlecture2 == null ? null : mediParoleVlecture2,
    "medi_parole_vlecture3": mediParoleVlecture3 == null ? null : mediParoleVlecture3,
    "medi_parole_vlecture4": mediParoleVlecture4 == null ? null : mediParoleVlecture4,
    "medi_parole_plecture1": mediParolePlecture1 == null ? null : mediParolePlecture1,
    "medi_parole_plecture2": mediParolePlecture2 == null ? null : mediParolePlecture2,
    "medi_parole_plecture3": mediParolePlecture3 == null ? null : mediParolePlecture3,
    "medi_parole_pprecisez": mediParolePprecisez == null ? null : mediParolePprecisez,
    "ensei_ecoute": enseiEcoute == null ? null : enseiEcoute,
    "medi_parole_temoi1": mediParoleTemoi1 == null ? null : mediParoleTemoi1,
    "medi_parole_temoi2": mediParoleTemoi2 == null ? null : mediParoleTemoi2,
    "medi_parole_temoi3": mediParoleTemoi3 == null ? null : mediParoleTemoi3,
    "medi_parole_temoi4": mediParoleTemoi4 == null ? null : mediParoleTemoi4,
    "medi_parole_temoi5": mediParoleTemoi5 == null ? null : mediParoleTemoi5,
    "medi_parole_temoi6": mediParoleTemoi6 == null ? null : mediParoleTemoi6,
    "medi_parole_temoi7": mediParoleTemoi7 == null ? null : mediParoleTemoi7,
    "medi_parole_temoi8": mediParoleTemoi8 == null ? null : mediParoleTemoi8,
    "medi_parole_temoi9": mediParoleTemoi9 == null ? null : mediParoleTemoi9,
    "medi_parole_temoi10": mediParoleTemoi10 == null ? null : mediParoleTemoi10,
    "medi_parole_texplik": mediParoleTexplik == null ? null : mediParoleTexplik,
    "exam_hebdo_ex11": examHebdoEx11 == null ? null : examHebdoEx11,
    "exam_hebdo_ex12": examHebdoEx12 == null ? null : examHebdoEx12,
    "exam_hebdo_ex13": examHebdoEx13 == null ? null : examHebdoEx13,
    "exam_hebdo_ex14": examHebdoEx14 == null ? null : examHebdoEx14,
    "exam_hebdo_ex21": examHebdoEx21 == null ? null : examHebdoEx21,
    "exam_hebdo_ex22": examHebdoEx22 == null ? null : examHebdoEx22,
    "exam_hebdo_ex23": examHebdoEx23 == null ? null : examHebdoEx23,
    "exam_hebdo_ex24": examHebdoEx24 == null ? null : examHebdoEx24,
    "exam_hebdo_ex31": examHebdoEx31 == null ? null : examHebdoEx31,
    "exam_hebdo_ex32": examHebdoEx32 == null ? null : examHebdoEx32,
    "exam_hebdo_ex33": examHebdoEx33 == null ? null : examHebdoEx33,
    "exam_hebdo_ex34": examHebdoEx34 == null ? null : examHebdoEx34,
    "exam_hebdo_ex41": examHebdoEx41 == null ? null : examHebdoEx41,
    "exam_hebdo_ex42": examHebdoEx42 == null ? null : examHebdoEx42,
    "exam_hebdo_ex43": examHebdoEx43 == null ? null : examHebdoEx43,
    "exam_hebdo_ex44": examHebdoEx44 == null ? null : examHebdoEx44,
    "exam_hebdo_ex51": examHebdoEx51 == null ? null : examHebdoEx51,
    "exam_hebdo_ex52": examHebdoEx52 == null ? null : examHebdoEx52,
    "exam_hebdo_ex53": examHebdoEx53 == null ? null : examHebdoEx53,
    "exam_hebdo_ex54": examHebdoEx54 == null ? null : examHebdoEx54,
    "exam_hebdo_ex61": examHebdoEx61 == null ? null : examHebdoEx61,
    "exam_hebdo_ex62": examHebdoEx62 == null ? null : examHebdoEx62,
    "exam_hebdo_ex63": examHebdoEx63 == null ? null : examHebdoEx63,
    "exam_hebdo_ex64": examHebdoEx64 == null ? null : examHebdoEx64,
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
