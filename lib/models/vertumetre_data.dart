import 'dart:convert';

VertumetreData vertumetreDataFromJson(String str) => VertumetreData.fromJson(json.decode(str));

String vertumetreDataToJson(VertumetreData data) => json.encode(data.toJson());

class VertumetreData {
  VertumetreData({
    this.disable,
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

  bool? disable;
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
  Map<String, dynamic>? sujetPriere;
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

  factory VertumetreData.fromJson(Map<String, dynamic> json) => VertumetreData(
    disable: json["disable"],
    nombre: json["nombre"],
    viePriere1: json["vie_priere1"],
    viePriere2: json["vie_priere2"],
    viePriere3: json["vie_priere3"],
    viePriere4: json["vie_priere4"],
    tempsPriere1: json["temps_priere1"],
    tempsPriere2: json["temps_priere2"],
    tempsPriere3: json["temps_priere3"],
    tempsPriere4: json["temps_priere4"],
    jeunePriere1: json["jeune_priere1"],
    jeunePriere2: json["jeune_priere2"],
    jeunePriere3: json["jeune_priere3"],
    jeunePriere4: json["jeune_priere4"],
    sujetPriere: json["sujet_priere"] != null ?  Map.from(json["sujet_priere"]).map((k, v) => MapEntry<String, dynamic>(k, v)) : null,
    sujetPriereAutre: json["sujet_priere_autre"],
    soutienSujet: json["soutien_sujet"],
    mediParoleJour1: json["medi_parole_jour1"],
    mediParoleJour2: json["medi_parole_jour2"],
    mediParoleJour3: json["medi_parole_jour3"],
    mediParoleJour4: json["medi_parole_jour4"],
    mediParoleDuree1: json["medi_parole_duree1"],
    mediParoleDuree2: json["medi_parole_duree2"],
    mediParoleDuree3: json["medi_parole_duree3"],
    mediParoleDuree4: json["medi_parole_duree4"],
    mediParoleVlecture1: json["medi_parole_vlecture1"],
    mediParoleVlecture2: json["medi_parole_vlecture2"],
    mediParoleVlecture3: json["medi_parole_vlecture3"],
    mediParoleVlecture4: json["medi_parole_vlecture4"],
    mediParolePlecture1: json["medi_parole_plecture1"],
    mediParolePlecture2: json["medi_parole_plecture2"],
    mediParolePlecture3: json["medi_parole_plecture3"],
    mediParolePprecisez: json["medi_parole_pprecisez"],
    enseiEcoute: json["ensei_ecoute"],
    mediParoleTemoi1: json["medi_parole_temoi1"],
    mediParoleTemoi2: json["medi_parole_temoi2"],
    mediParoleTemoi3: json["medi_parole_temoi3"],
    mediParoleTemoi4: json["medi_parole_temoi4"],
    mediParoleTemoi5: json["medi_parole_temoi5"],
    mediParoleTemoi6: json["medi_parole_temoi6"],
    mediParoleTemoi7: json["medi_parole_temoi7"],
    mediParoleTemoi8: json["medi_parole_temoi8"],
    mediParoleTemoi9: json["medi_parole_temoi9"],
    mediParoleTemoi10: json["medi_parole_temoi10"],
    mediParoleTexplik: json["medi_parole_texplik"],
    examHebdoEx11: json["exam_hebdo_ex11"],
    examHebdoEx12: json["exam_hebdo_ex12"],
    examHebdoEx13: json["exam_hebdo_ex13"],
    examHebdoEx14: json["exam_hebdo_ex14"],
    examHebdoEx21: json["exam_hebdo_ex21"],
    examHebdoEx22: json["exam_hebdo_ex22"],
    examHebdoEx23: json["exam_hebdo_ex23"],
    examHebdoEx24: json["exam_hebdo_ex24"],
    examHebdoEx31: json["exam_hebdo_ex31"],
    examHebdoEx32: json["exam_hebdo_ex32"],
    examHebdoEx33: json["exam_hebdo_ex33"],
    examHebdoEx34: json["exam_hebdo_ex34"],
    examHebdoEx41: json["exam_hebdo_ex41"],
    examHebdoEx42: json["exam_hebdo_ex42"],
    examHebdoEx43: json["exam_hebdo_ex43"],
    examHebdoEx44: json["exam_hebdo_ex44"],
    examHebdoEx51: json["exam_hebdo_ex51"],
    examHebdoEx52: json["exam_hebdo_ex52"],
    examHebdoEx53: json["exam_hebdo_ex53"],
    examHebdoEx54: json["exam_hebdo_ex54"],
    examHebdoEx61: json["exam_hebdo_ex61"],
    examHebdoEx62: json["exam_hebdo_ex62"],
    examHebdoEx63: json["exam_hebdo_ex63"],
    examHebdoEx64: json["exam_hebdo_ex64"],
  );

  Map<String, dynamic> toJson() => {
    "disable": disable,
    "nombre": nombre,
    "vie_priere1": viePriere1,
    "vie_priere2": viePriere2,
    "vie_priere3": viePriere3,
    "vie_priere4": viePriere4,
    "temps_priere1": tempsPriere1,
    "temps_priere2": tempsPriere2,
    "temps_priere3": tempsPriere3,
    "temps_priere4": tempsPriere4,
    "jeune_priere1": jeunePriere1,
    "jeune_priere2": jeunePriere2,
    "jeune_priere3": jeunePriere3,
    "jeune_priere4": jeunePriere4,
    "sujet_priere": Map.from(sujetPriere!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "sujet_priere_autre": sujetPriereAutre,
    "soutien_sujet": soutienSujet,
    "medi_parole_jour1": mediParoleJour1,
    "medi_parole_jour2": mediParoleJour2,
    "medi_parole_jour3": mediParoleJour3,
    "medi_parole_jour4": mediParoleJour4,
    "medi_parole_duree1": mediParoleDuree1,
    "medi_parole_duree2": mediParoleDuree2,
    "medi_parole_duree3": mediParoleDuree3,
    "medi_parole_duree4": mediParoleDuree4,
    "medi_parole_vlecture1": mediParoleVlecture1,
    "medi_parole_vlecture2": mediParoleVlecture2,
    "medi_parole_vlecture3": mediParoleVlecture3,
    "medi_parole_vlecture4": mediParoleVlecture4,
    "medi_parole_plecture1": mediParolePlecture1,
    "medi_parole_plecture2": mediParolePlecture2,
    "medi_parole_plecture3": mediParolePlecture3,
    "medi_parole_pprecisez": mediParolePprecisez,
    "ensei_ecoute": enseiEcoute,
    "medi_parole_temoi1": mediParoleTemoi1,
    "medi_parole_temoi2": mediParoleTemoi2,
    "medi_parole_temoi3": mediParoleTemoi3,
    "medi_parole_temoi4": mediParoleTemoi4,
    "medi_parole_temoi5": mediParoleTemoi5,
    "medi_parole_temoi6": mediParoleTemoi6,
    "medi_parole_temoi7": mediParoleTemoi7,
    "medi_parole_temoi8": mediParoleTemoi8,
    "medi_parole_temoi9": mediParoleTemoi9,
    "medi_parole_temoi10": mediParoleTemoi10,
    "medi_parole_texplik": mediParoleTexplik,
    "exam_hebdo_ex11": examHebdoEx11,
    "exam_hebdo_ex12": examHebdoEx12,
    "exam_hebdo_ex13": examHebdoEx13,
    "exam_hebdo_ex14": examHebdoEx14,
    "exam_hebdo_ex21": examHebdoEx21,
    "exam_hebdo_ex22": examHebdoEx22,
    "exam_hebdo_ex23": examHebdoEx23,
    "exam_hebdo_ex24": examHebdoEx24,
    "exam_hebdo_ex31": examHebdoEx31,
    "exam_hebdo_ex32": examHebdoEx32,
    "exam_hebdo_ex33": examHebdoEx33,
    "exam_hebdo_ex34": examHebdoEx34,
    "exam_hebdo_ex41": examHebdoEx41,
    "exam_hebdo_ex42": examHebdoEx42,
    "exam_hebdo_ex43": examHebdoEx43,
    "exam_hebdo_ex44": examHebdoEx44,
    "exam_hebdo_ex51": examHebdoEx51,
    "exam_hebdo_ex52": examHebdoEx52,
    "exam_hebdo_ex53": examHebdoEx53,
    "exam_hebdo_ex54": examHebdoEx54,
    "exam_hebdo_ex61": examHebdoEx61,
    "exam_hebdo_ex62": examHebdoEx62,
    "exam_hebdo_ex63": examHebdoEx63,
    "exam_hebdo_ex64": examHebdoEx64,
  };
}

VertumetreAddResponse vertumetreAddResponseFromJson(String str) => VertumetreAddResponse.fromJson(json.decode(str));

String vertumetreAddResponseToJson(VertumetreAddResponse data) => json.encode(data.toJson());

class VertumetreAddResponse {
  VertumetreAddResponse({
    this.flash,
    this.status,
  });

  String? flash;
  int? status;

  factory VertumetreAddResponse.fromJson(Map<String, dynamic> json) => VertumetreAddResponse(
    flash: json["flash"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "flash": flash,
    "status": status,
  };
}