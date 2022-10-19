import 'dart:convert';

StartBillingResponse StartBillingResponseFromJson(String str) => StartBillingResponse.fromJson(json.decode(str));

String StartBillingResponseToJson(StartBillingResponse data) => json.encode(data.toJson());

class StartBillingResponse {
  StartBillingResponse({
    this.flash,
    this.status,
    this.key,
    //this.pay,
    this.token
  });

  String? flash;
  int? status;
  String? key;
  //String? pay;
  String? token;

  factory StartBillingResponse.fromJson(Map<String, dynamic> json) => StartBillingResponse(
    flash: json["flash"],
    status: json["status"],
    key: json['key'],
    token: json['token'],
    //pay: json['pay']
  );

  Map<String, dynamic> toJson() => {
    "flash": flash,
    "status": status,
    "key" : key,
    "token" : token,
    //"pay" : pay
  };
}

PaiementSend paiementSendFromJson(String str) => PaiementSend.fromJson(json.decode(str));
String paiementSendToJson(PaiementSend data) => json.encode(data.toJson());

class PaiementSend {
  PaiementSend({
    this.uid,
    this.sid,
    this.scolarite,
    this.motif,
    this.mode,
    this.montantChiffre,
    this.frais,
    this.netPayer,
    this.campus,
    this.montantLettre,
    this.reste,
    this.reglementTotal
  });

  String? uid;
  String? sid;
  String? scolarite;
  String? motif;
  String? mode;
  String? montantChiffre;
  String? frais;
  String? netPayer;
  String? campus;
  String? montantLettre;
  String? reglementTotal;
  String? reste;

  factory PaiementSend.fromJson(Map<String, dynamic> json) => PaiementSend(
    uid: json["uid"] == null ? null : json["uid"],
    sid: json["sid"] == null ? null : json["sid"],
    scolarite: json["scolarite"] == null ? null : json["scolarite"],
    motif: json["motif"] == null ? null : json["motif"],
    mode: json["mode"] == null ? null : json["mode"],
    montantChiffre: json["montant_chiffre"] == null ? null : json["montant_chiffre"],
    frais: json["frais"] == null ? null : json["frais"],
    netPayer: json["net_payer"] == null ? null : json["net_payer"],
    campus: json["campus"] == null ? null : json["campus"],
    montantLettre: json["montant_lettre"] == null ? null : json["montant_lettre"],
    reglementTotal: json["reglement_total"] == null ? null : json["reglement_total"],
    reste: json["reste"] == null ? null : json["reste"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid == null ? null : uid,
    "sid": sid == null ? null : sid,
    "scolarite": scolarite == null ? null : scolarite,
    "motif": motif == null ? null : motif,
    "mode": mode == null ? null : mode,
    "montant_chiffre": montantChiffre == null ? null : montantChiffre,
    "frais": frais == null ? null : frais,
    "net_payer": netPayer == null ? null : netPayer,
    "campus": campus == null ? null : campus,
    "montant_lettre": montantLettre == null ? null : montantLettre,
    "reglement_total" :reglementTotal == null ? null : reglementTotal,
    "reste" : reste == null ? null : reste
  };
}
