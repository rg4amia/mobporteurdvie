import 'dart:convert';

UpdateInfoSpirituelResponse UpdateInfoSpirituelResponseFromJson(String str) => UpdateInfoSpirituelResponse.fromJson(json.decode(str));
String UpdateInfoSpirituelResponseToJson(UpdateInfoSpirituelResponse data) => json.encode(data.toJson());

class UpdateInfoSpirituelResponse {
  UpdateInfoSpirituelResponse({
    this.flash,
    this.status,
  });

  String? flash;
  int? status;

  factory UpdateInfoSpirituelResponse.fromJson(Map<String, dynamic> json) => UpdateInfoSpirituelResponse(
    flash: json["flash"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "flash": flash,
    "status": status,
  };
}

UpdateInfoSpirituel updateInfoSpirituelFromJson(String str) => UpdateInfoSpirituel.fromJson(json.decode(str));
String updateInfoSpirituelToJson(UpdateInfoSpirituel data) => json.encode(data.toJson());

class UpdateInfoSpirituel {
  UpdateInfoSpirituel({
    this.spid,
    this.conversionDate,
    this.pageBiblique,
    this.dateBaptemeImmersion,
    this.baptemeEsprit,
    this.fardeau,
    this.inLang,
    this.inLangDate,
    this.actif,
    this.actifEglise,
    this.actifDepartement,
    this.convertis,
    this.frequencePriere,
    this.premierSujet,
    this.aimeFaire,
    this.don,
    this.donV,
  });

  String? spid;
  String? conversionDate;
  String? pageBiblique;
  String? dateBaptemeImmersion;
  String? baptemeEsprit;
  String? fardeau;
  String? inLang;
  String? inLangDate;
  String? actif;
  String? actifEglise;
  String? actifDepartement;
  String? convertis;
  String? frequencePriere;
  String? premierSujet;
  String? aimeFaire;
  String? don;
  String? donV;

  factory UpdateInfoSpirituel.fromJson(Map<String, dynamic> json) => UpdateInfoSpirituel(
    spid: json["spid"] == null ? null : json["spid"],
    conversionDate: json["conversion_date"] == null ? null : json["conversion_date"],
    pageBiblique: json["page_biblique"] == null ? null : json["page_biblique"],
    dateBaptemeImmersion: json["date_bapteme_immersion"] == null ? null : json["date_bapteme_immersion"],
    baptemeEsprit: json["Bapteme_esprit"] == null ? null : json["Bapteme_esprit"],
    fardeau: json["fardeau"] == null ? null : json["fardeau"],
    inLang: json["in_lang"] == null ? null : json["in_lang"],
    inLangDate: json["in_lang_date"] == null ? null : json["in_lang_date"],
    actif: json["actif"] == null ? null : json["actif"],
    actifEglise: json["actif_eglise"] == null ? null : json["actif_eglise"],
    actifDepartement: json["actif_departement"] == null ? null : json["actif_departement"],
    convertis: json["convertis"] == null ? null : json["convertis"],
    frequencePriere: json["frequence_priere"] == null ? null : json["frequence_priere"],
    premierSujet: json["premier_sujet"] == null ? null : json["premier_sujet"],
    aimeFaire: json["aime_faire"] == null ? null : json["aime_faire"],
    don: json["don"] == null ? null : json["don"],
    donV: json["don_v"] == null ? null : json["don_v"],
  );

  Map<String, dynamic> toJson() => {
    "spid": spid == null ? null : spid,
    "conversion_date": conversionDate == null ? null : conversionDate,
    "page_biblique": pageBiblique == null ? null : pageBiblique,
    "date_bapteme_immersion": dateBaptemeImmersion == null ? null : dateBaptemeImmersion,
    "Bapteme_esprit": baptemeEsprit == null ? null : baptemeEsprit,
    "fardeau": fardeau == null ? null : fardeau,
    "in_lang": inLang == null ? null : inLang,
    "in_lang_date": inLangDate == null ? null : inLangDate,
    "actif": actif == null ? null : actif,
    "actif_eglise": actifEglise == null ? null : actifEglise,
    "actif_departement": actifDepartement == null ? null : actifDepartement,
    "convertis": convertis == null ? null : convertis,
    "frequence_priere": frequencePriere == null ? null : frequencePriere,
    "premier_sujet": premierSujet == null ? null : premierSujet,
    "aime_faire": aimeFaire == null ? null : aimeFaire,
    "don": don == null ? null : don,
    "don_v": donV == null ? null : donV,
  };
}
