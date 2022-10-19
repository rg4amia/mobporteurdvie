import 'dart:convert';

PostReinscription postReinscriptionFromJson(String str) =>
    PostReinscription.fromJson(json.decode(str));

String postReinscriptionToJson(PostReinscription data) =>
    json.encode(data.toJson());

class PostReinscription {
  PostReinscription({
    this.nextS,
    this.habitation,
    this.facebook,
    this.contact1,
    this.contact2,
    this.matrimoniale,
    this.conjoint,
    this.enfant,
    this.taille,
    this.campus,
    this.departement,
    this.situationPro,
    this.profession,
    this.niveauAcademi,
    this.payment
  });

  String? nextS;
  String? habitation;
  String? facebook;
  String? contact1;
  String? contact2;
  String? matrimoniale;
  String? conjoint;
  String? enfant;
  String? taille;
  String? campus;
  String? departement;
  String? situationPro;
  String? profession;
  String? niveauAcademi;
  String? payment;

  factory PostReinscription.fromJson(Map<String, dynamic> json) =>
      PostReinscription(
        nextS: json["next_s"] == null ? null : json["next_s"],
        habitation: json["habitation"] == null ? null : json["habitation"],
        facebook: json["facebook"] == null ? null : json["facebook"],
        contact1: json["contact1"] == null ? null : json["contact1"],
        contact2: json["contact2"] == null ? null : json["contact2"],
        matrimoniale:
            json["matrimoniale"] == null ? null : json["matrimoniale"],
        conjoint: json["conjoint"] == null ? null : json["conjoint"],
        enfant: json["enfant"] == null ? null : json["enfant"],
        taille: json["taille"] == null ? null : json["taille"],
        campus: json["campus"] == null ? null : json["campus"],
        departement: json["departement"] == null ? null : json["departement"],
        situationPro:
            json["situation_pro"] == null ? null : json["situation_pro"],
        profession: json["profession"] == null ? null : json["profession"],
        niveauAcademi:
            json["niveau_academi"] == null ? null : json["niveau_academi"],
        payment:
            json["payment"] == null ? null : json["payment"],
      );

  Map<String, dynamic> toJson() => {
        "next_s": nextS == null ? null : nextS,
        "habitation": habitation == null ? null : habitation,
        "facebook": facebook == null ? null : facebook,
        "contact1": contact1 == null ? null : contact1,
        "contact2": contact2 == null ? null : contact2,
        "matrimoniale": matrimoniale == null ? null : matrimoniale,
        "conjoint": conjoint == null ? null : conjoint,
        "enfant": enfant == null ? null : enfant,
        "taille": taille == null ? null : taille,
        "campus": campus == null ? null : campus,
        "departement": departement == null ? null : departement,
        "situation_pro": situationPro == null ? null : situationPro,
        "profession": profession == null ? null : profession,
        "niveau_academi": niveauAcademi == null ? null : niveauAcademi,
        "payment": payment == null ? null : payment,
      };
}
