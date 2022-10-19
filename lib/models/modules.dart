
class Modules {
  late int _programmationId;
  late int _id;
  late int _moduleId;
  late int _schoolId;
  late int _prevModuleId;
  late int _sessionId;
  late  String _startDate;
  late String _endDate;
  late  String _createdAt;
  late String _updatedAt;
  late  int _state;
  late  String _moduleV;
  late dynamic _moduleDesc;
  late int _totalCourse;
  late int _nbValidate;
  late int _nNbValidate;
  late int _prodId;
  late  int _key_verif;
  late  dynamic _can_access_module;

  // "key_verif": false,
  //             "can_access_module": null

  int get programmationId => _programmationId;
  int get id => _id;
  int get moduleId => _moduleId;
  int get schoolId => _schoolId;
  int get prevModuleId => _prevModuleId;
  int get sessionId => _sessionId;
  String get startDate => _startDate;
  String get endDate => _endDate;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get state => _state;
  String get moduleV => _moduleV;
  dynamic get moduleDesc => _moduleDesc;
  int get totalCourse => _totalCourse;
  int get nbValidate => _nbValidate;
  int get nNbValidate => _nNbValidate;
  int get prodId => _prodId;
  int get key_verif => _key_verif;
  dynamic get can_access_module => _can_access_module;

  Modules({
    int? programmationId,
    int? id,
    int? moduleId,
    int? schoolId,
    int? prevModuleId,
    int? sessionId,
    String? startDate,
    String? endDate,
    String? createdAt,
    String? updatedAt,
    int? state,
    String? moduleV,
    dynamic moduleDesc,
    int? totalCourse,
    int? nbValidate,
    int? nNbValidate,
    int? prodId,
    dynamic can_access_module,
    int? key_verif,
  }) {
    _programmationId = programmationId!;
    _id = id!;
    _moduleId = moduleId!;
    _schoolId = schoolId!;
    _prevModuleId = prevModuleId!;
    _sessionId = sessionId!;
    _startDate = startDate!;
    _endDate = endDate!;
    _createdAt = createdAt!;
    _updatedAt = updatedAt!;
    _state = state!;
    _moduleV = moduleV!;
    _moduleDesc = moduleDesc!;
    _totalCourse = totalCourse!;
    _nbValidate = nbValidate!;
    _nNbValidate = nNbValidate!;
    _prodId = prodId!;
    _can_access_module = can_access_module!;
    _key_verif = key_verif!;
  }

  Modules.fromJson(dynamic json) {
    _programmationId = json["programmation_id"] != null ? json["programmation_id"] : 0 ;
    _id = json["id"] != null ? json["id"] : 0;
    _moduleId = json["module_id"] != null ? json["module_id"] : 0;
    _schoolId = json["school_id"] != null ? json["school_id"] : 0;
    _prevModuleId = json["prev_module_id"] != null ? json["prev_module_id"] : 0;
    _sessionId = json["session_id"] != null ? json["session_id"] : 0;
    _startDate = json["start_date"] != null ? json["start_date"] : '';
    _endDate = json["end_date"] != null ? json["end_date"] : '';
    _createdAt = json["created_at"] != null ? json["created_at"] : '';
    _updatedAt = json["updated_at"] != null ? json["updated_at"] : '';
    _state = json["state"] != null ? json["state"] : 0;
    _moduleV = json["module_v"] != null ? json["module_v"] : '';
    _moduleDesc = json["module_desc"] != null ? json["module_desc"] : '';
    _totalCourse = json["total_course"] != null ? json["total_course"] : 0;
    _nbValidate = json["nb_validate"] != null ? json["nb_validate"] : 0;
    _nNbValidate = json["n_nb_validate"] != null ? json["n_nb_validate"] : 0;
    _prodId = json["prod_id"] != null ? json["n_nb_validate"] : 0;
    _key_verif = json["key_verif"] != null ? json["key_verif"] : 0;
    _can_access_module = json["can_access_module"] != null ? json["can_access_module"] : '';
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["programmation_id"] = _programmationId;
    map["id"] = _id;
    map["module_id"] = _moduleId;
    map["school_id"] = _schoolId;
    map["prev_module_id"] = _prevModuleId;
    map["session_id"] = _sessionId;
    map["start_date"] = _startDate;
    map["end_date"] = _endDate;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    map["state"] = _state;
    map["module_v"] = _moduleV;
    map["module_desc"] = _moduleDesc;
    map["total_course"] = _totalCourse;
    map["nb_validate"] = _nbValidate;
    map["n_nb_validate"] = _nNbValidate;
    map["prod_id"] = _prodId;
    map["key_verif"] = _key_verif;
    map["can_access_module"] = _can_access_module;
    return map;
  }
}
