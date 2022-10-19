import 'dart:convert';

UpdateInfoPersonResponse UpdateInfoPersonResponseFromJson(String str) => UpdateInfoPersonResponse.fromJson(json.decode(str));
String UpdateInfoPersonResponseToJson(UpdateInfoPersonResponse data) => json.encode(data.toJson());

class UpdateInfoPersonResponse {
  UpdateInfoPersonResponse({
    this.flash,
    this.status,
  });

  String? flash;
  int? status;

  factory UpdateInfoPersonResponse.fromJson(Map<String, dynamic> json) => UpdateInfoPersonResponse(
    flash: json["flash"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "flash": flash,
    "status": status,
  };
}

UpdateInfoPerson updateInfoPersonFromJson(String str) => UpdateInfoPerson.fromJson(json.decode(str));

String updateInfoPersonToJson(UpdateInfoPerson data) => json.encode(data.toJson());

class UpdateInfoPerson {
  UpdateInfoPerson({
    this.uid,
    this.sid,
    this.schoolId,
    this.vs,
    this.nom,
    this.pnom,
    this.naissance,
    this.habitation,
    this.contact1,
    this.contact2,
    this.email,
    this.facebook,
    this.sexe,
    this.matrimoniale,
    this.civilite,
    this.enfant,
    this.taille,
  });

  String? uid;
  String? sid;
  String? schoolId;
  dynamic vs;
  String? nom;
  String? pnom;
  String? naissance;
  String? habitation;
  String? contact1;
  String? contact2;
  String? email;
  String? facebook;
  String? sexe;
  String? matrimoniale;
  String? civilite;
  String? enfant;
  String? taille;

  factory UpdateInfoPerson.fromJson(Map<String, dynamic> json) => UpdateInfoPerson(
    uid: json["uid"] == null ? null : json["uid"],
    sid: json["sid"] == null ? null : json["sid"],
    schoolId: json["school_id"] == null ? null : json["school_id"],
    vs: json["vs"],
    nom: json["nom"] == null ? null : json["nom"],
    pnom: json["pnom"] == null ? null : json["pnom"],
    naissance: json["naissance"] == null ? null : json["naissance"],
    habitation: json["habitation"] == null ? null : json["habitation"],
    contact1: json["contact1"] == null ? null : json["contact1"],
    contact2: json["contact2"] == null ? null : json["contact2"],
    email: json["email"] == null ? null : json["email"],
    facebook: json["facebook"] == null ? null : json["facebook"],
    sexe: json["sexe"] == null ? null : json["sexe"],
    matrimoniale: json["matrimoniale"] == null ? null : json["matrimoniale"],
    civilite: json["civilite"] == null ? null : json["civilite"],
    enfant: json["enfant"] == null ? null : json["enfant"],
    taille: json["taille"] == null ? null : json["taille"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid == null ? null : uid,
    "sid": sid == null ? null : sid,
    "school_id": schoolId == null ? null : schoolId,
    "vs": vs,
    "nom": nom == null ? null : nom,
    "pnom": pnom == null ? null : pnom,
    "naissance": naissance == null ? null : naissance,
    "habitation": habitation == null ? null : habitation,
    "contact1": contact1 == null ? null : contact1,
    "contact2": contact2 == null ? null : contact2,
    "email": email == null ? null : email,
    "facebook": facebook == null ? null : facebook,
    "sexe": sexe == null ? null : sexe,
    "matrimoniale": matrimoniale == null ? null : matrimoniale,
    "civilite": civilite == null ? null : civilite,
    "enfant": enfant == null ? null : enfant,
    "taille": taille == null ? null : taille,
  };
}
