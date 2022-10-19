class ApercuStatistique {
  late String _presence;
  late String _retart;
  late String _absJustifie;
  late String _absNonJustifie;
  late String _resume;
  late String _exercie;
  late String _vertumetre;
  late String _module;

  String get presence => _presence;
  String get retart => _retart;
  String get absJustifie => _absJustifie;
  String get absNonJustifie => _absNonJustifie;
  String get resume => _resume;
  String get exercie => _exercie;
  String get vertumetre => _vertumetre;
  String get module => _module;

  ApercuStatistique({
      String? presence,
      String? retart,
      String? absJustifie,
      String? absNonJustifie,
      String? resume,
      String? exercie,
      String? vertumetre,
      String? module,
  }){
    _presence = presence!;
    _retart = retart!;
    _absJustifie = absJustifie!;
    _absNonJustifie = absNonJustifie!;
    _resume = resume!;
    _exercie = exercie!;
    _vertumetre = vertumetre!;
    _module = module!;
}

  ApercuStatistique.fromJson(dynamic json) {
    _presence = json["presence"] != null ? json["presence"] : '';
    _retart = json["retart"] != null ? json["retart"] : '';
    _absJustifie = json["abs_justifie"] != null ? json["abs_justifie"] : '';
    _absNonJustifie = json["abs_non_justifie"] != null ? json["abs_non_justifie"] : '';
    _resume = json["resume"] != null ? json["resume"] : '';
    _exercie = json["exercie"] != null ? json["exercie"] : '';
    _vertumetre = json["vertumetre"] != null ? json["vertumetre"] : '';
    _module = json["module"] != null ? json["module"] : '';
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["presence"] = _presence;
    map["retart"] = _retart;
    map["abs_justifie"] = _absJustifie;
    map["abs_non_justifie"] = _absNonJustifie;
    map["resume"] = _resume;
    map["exercie"] = _exercie;
    map["vertumetre"] = _vertumetre;
    map["module"] = _module;
    return map;
  }

}