import 'prevevaluation.dart';
import 'evaluation.dart';

class Cours_by_module {
  Cours_by_module({
    this.orateur,
    this.moderateur,
    this.prevevaluation,
    this.evaluation,
    this.coursId,
    this.courtheme,
    this.validation
  });

  String? orateur;
  String? moderateur;
  Prevevaluation? prevevaluation;
  Evaluation? evaluation;
  int? coursId;
  int? validation;
  String? courtheme;

  factory Cours_by_module.fromJson(Map<String, dynamic> json) =>
      Cours_by_module(
        orateur: json["orateur"] == null ? null : json["orateur"],
        validation: json["validation"] == null ? null : json["validation"],
        moderateur: json["moderateur"] == null ? null : json["moderateur"],
        prevevaluation: json["prevevaluation"] == null ? null : Prevevaluation.fromJson(json["prevevaluation"]),
        evaluation: json["evaluation"] == null ? null : Evaluation.fromJson(json["evaluation"]),
        coursId: json["cours_id"] == null ? null : json["cours_id"],
        courtheme: json["courtheme"] == null ? null : json["courtheme"],
      );

  Map<String, dynamic> toJson() => {
        "orateur": orateur == null ? null : orateur,
        "validation": validation == null ? null : validation,
        "moderateur": moderateur == null ? null : moderateur,
        "prevevaluation": prevevaluation == null ? null : prevevaluation!.toJson(),
        "evaluation": evaluation == null ? null : evaluation!.toJson(),
        "cours_id": coursId == null ? null : coursId,
        "courtheme": courtheme == null ? null : courtheme,
  };
}


/* class Cours_by_module {

  late String _orateur;
  late String _moderateur;
  Prevevaluation? _prevevaluation;
  Evaluation? _evaluation;
  late int _coursId;
  late String _courtheme;

  String get orateur => _orateur;
  String get moderateur => _moderateur;
  Prevevaluation? get prevevaluation => _prevevaluation;
  Evaluation? get evaluation => _evaluation;
  int get coursId => _coursId;
  String get courtheme => _courtheme;

  Cours_by_module(
      {String? orateur,
      String? moderateur,
      Prevevaluation? prevevaluation,
      Evaluation? evaluation,
      int? coursId,
      String? courtheme}) {
    _orateur = orateur!;
    _moderateur = moderateur!;
    _prevevaluation = prevevaluation!;
    _evaluation = evaluation!;
    _coursId = coursId!;
    _courtheme = courtheme!;
  }

  Cours_by_module.fromJson(dynamic json) {
     _evaluation = json["evaluation"] == null
        ? null
        : Evaluation.fromJson(json["evaluation"]);
    _orateur = json["orateur"];
    _moderateur = json["moderateur"]?? "";
    _prevevaluation =  json["prevevaluation"] == null ? null : Prevevaluation.fromJson(json["prevevaluation"]);

    _coursId = json["cours_id"];
    _courtheme = json["courtheme"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["orateur"] = _orateur;
    map["moderateur"] = _moderateur;
    if (_prevevaluation != null) {
      map["prevevaluation"] = _prevevaluation!.toJson();
    }
    if (_evaluation != null) {
      map["evaluation"] = _evaluation!.toJson();
    }
    map["cours_id"] = _coursId;
    map["courtheme"] = _courtheme;
    return map;
  }
}
 */