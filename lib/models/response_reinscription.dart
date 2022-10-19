import 'dart:convert';

ResponseReinscription responseReinscriptionFromJson(String str) =>
    ResponseReinscription.fromJson(json.decode(str));

String responseReinscriptionToJson(ResponseReinscription data) =>
    json.encode(data.toJson());

class ResponseReinscription {
  ResponseReinscription({
    this.status,
    this.message,
    this.student,
    this.user,
     this.token,
    this.nextS,
    this.gradue,
    this.finalDecision,
  });

  String? status;
  String? message;
  Student? student;
  User? user;
  String? token;
  int? nextS;
  ResponseReinscriptionGradue? gradue;
  FinalDecision? finalDecision;

  factory ResponseReinscription.fromJson(Map<String, dynamic> json) =>
      ResponseReinscription(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        student:
            json["student"] == null ? null : Student.fromJson(json["student"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
          token: json["token"] == null ? null : json["token"],
        nextS: json["next_s"] == null ? null : json["next_s"],
        gradue: json["gradue"] == null
            ? null
            : ResponseReinscriptionGradue.fromJson(json["gradue"]),
        finalDecision: json["finalDecision"] == null
            ? null
            : FinalDecision.fromJson(json["finalDecision"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "student": student == null ? null : student!.toJson(),
        "user": user == null ? null : user!.toJson(),
        "gradue": gradue == null ? null : gradue!.toJson(),
        "token": token == null ? null : token,
        "next_s": nextS == null ? null : nextS,
        "finalDecision": finalDecision == null ? null : finalDecision!.toJson(),
      };
}

class FinalDecision {
  FinalDecision({
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
    this.id,
    this.userId,
    this.studentClassId,
    this.moyenne,
    this.comment,
    this.rank,
    this.state,
    this.validatedBy,
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
  int? id;
  int? userId;
  int? studentClassId;
  double? moyenne;
  String? comment;
  int? rank;
  int? state;
  int? validatedBy;

  factory FinalDecision.fromJson(Map<String, dynamic> json) => FinalDecision(
        classIdN: json["class_id_n"] == null ? null : json["class_id_n"],
        studentId: json["student_id"] == null ? null : json["student_id"],
        sessionId: json["session_id"] == null ? null : json["session_id"],
        schoolId: json["school_id"] == null ? null : json["school_id"],
        campusId: json["campus_id"] == null ? null : json["campus_id"],
        paymentStatus:
            json["payment_status"] == null ? null : json["payment_status"],
        vs: json["vs"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        statusN: json["status_n"] == null ? null : json["status_n"],
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        studentClassId:
            json["student_class_id"] == null ? null : json["student_class_id"],
        moyenne: json["moyenne"] == null ? null : json["moyenne"].toDouble(),
        comment: json["comment"] == null ? null : json["comment"],
        rank: json["rank"] == null ? null : json["rank"],
        state: json["state"] == null ? null : json["state"],
        validatedBy: json["validated_by"] == null ? null : json["validated_by"],
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
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "student_class_id": studentClassId == null ? null : studentClassId,
        "moyenne": moyenne == null ? null : moyenne,
        "comment": comment == null ? null : comment,
        "rank": rank == null ? null : rank,
        "state": state == null ? null : state,
        "validated_by": validatedBy == null ? null : validatedBy,
      };
}

class ResponseReinscriptionGradue {
  ResponseReinscriptionGradue({
    this.gradue,
    this.gradue1,
    this.gradue2,
  });

  Gradue? gradue;
  Gradue? gradue1;
  Gradue? gradue2;

  factory ResponseReinscriptionGradue.fromJson(Map<String, dynamic> json) =>
      ResponseReinscriptionGradue(
        gradue: json["gradue"] == null
            ? null
            : Gradue.fromJson(json["gradue"]),
        gradue1: json["gradue_1"] == null
            ? null
            : Gradue.fromJson(json["gradue_1"]),
        gradue2: json["gradue_2"] == null
            ? null
            : Gradue.fromJson(json["gradue_2"]),
      );

  Map<String, dynamic> toJson() => {
        "gradue": gradue == null ? null : gradue!.toJson(),
        "gradue_1": gradue1 == null ? null : gradue1!.toJson(),
        "gradue_2": gradue2 == null ? null : gradue2!.toJson(),
      };
}

class Gradue {
  Gradue({
    this.text,
    this.color,
    this.icon,
  });

  String? text;
  String? color;
  String? icon;

  factory Gradue.fromJson(Map<String, dynamic> json) => Gradue(
        text: json["text"] == null ? null : json["text"],
        color: json["color"] == null ? null : json["color"],
        icon: json["icon"] == null ? null : json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "text": text == null ? null : text,
        "color": color == null ? null : color,
        "icon": icon == null ? null : icon,
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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        profileIdN: json["profile_id_n"] == null ? null : json["profile_id_n"],
        creatorIdN: json["creator_id_n"] == null ? null : json["creator_id_n"],
        defaultLangV:
            json["default_lang_v"] == null ? null : json["default_lang_v"],
        citizenV: json["citizen_v"] == null ? null : json["citizen_v"],
        primaryPhoneV:
            json["primary_phone_v"] == null ? null : json["primary_phone_v"],
        secondaryPhoneV: json["secondary_phone_v"] == null
            ? null
            : json["secondary_phone_v"],
        sexeV: json["sexe_v"] == null ? null : json["sexe_v"],
        tailleV: json["taille_v"] == null ? null : json["taille_v"],
        professionV: json["profession_v"] == null ? null : json["profession_v"],
        dateNaissance: json["date_naissance"] == null
            ? null
            : DateTime.parse(json["date_naissance"]),
        matrimoniale:
            json["matrimoniale"] == null ? null : json["matrimoniale"],
        partenaireName:
            json["partenaire_name"] == null ? null : json["partenaire_name"],
        nombreEnfant:
            json["nombre_enfant"] == null ? null : json["nombre_enfant"],
        charField5: json["char_field_5"] == null ? null : json["char_field_5"],
        levelAcademy:
            json["level_academy"] == null ? null : json["level_academy"],
        facebook: json["facebook"] == null ? null : json["facebook"],
        pictureV: json["picture_v"] == null ? null : json["picture_v"],
        location: json["location"] == null ? null : json["location"],
        statusN: json["status_n"] == null ? null : json["status_n"],
        situationPro:
            json["situation_pro"] == null ? null : json["situation_pro"],
        callingCode: json["calling_code"] == null ? null : json["calling_code"],
        preferedCampus:
            json["prefered_campus"] == null ? null : json["prefered_campus"],
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
        "date_naissance":
            dateNaissance == null ? null : dateNaissance!.toIso8601String(),
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

class User {
  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        fname: json["fname"] == null ? null : json["fname"],
        lname: json["lname"] == null ? null : json["lname"],
        email: json["email"] == null ? null : json["email"],
        level: json["level"] == null ? null : json["level"],
        status: json["status"] == null ? null : json["status"],
        numero: json["numero"] == null ? null : json["numero"],
        rememberToken:
            json["remember_token"] == null ? null : json["remember_token"],
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
