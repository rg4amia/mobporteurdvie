
class Essais {
  late int _id;
  late int _exoId;
  late int _courseId;
  late int _studentId;
  late int _noteV;
  late int _state;
  late String _createdAt;
  late String _updatedAt;

  int get id => _id;
  int get exoId => _exoId;
  int get courseId => _courseId;
  int get studentId => _studentId;
  int get noteV => _noteV;
  int get state => _state;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  Essais(
      {int? id,
      int? exoId,
      int? courseId,
      int? studentId,
      int? noteV,
      int? state,
      String? createdAt,
      String? updatedAt}) {
    _id = id!;
    _exoId = exoId!;
    _courseId = courseId!;
    _studentId = studentId!;
    _noteV = noteV!;
    _state = state!;
    _createdAt = createdAt!;
    _updatedAt = updatedAt!;
  }

  Essais.fromJson(dynamic json) {
    _id = json["id"] != null ? json["id"] : 0 ;
    _exoId = json["exo_id"] != null ? json["exo_id"] : 0;
    _courseId = json["course_id"] != null ? json["course_id"] : 0;
    _studentId = json["student_id"] != null ? json["student_id"] : 0;
    _noteV = json["note_v"] != null ? json["note_v"] : 0;
    _state = json["state"] != null ? json["state"] : 0;
    _createdAt = json["created_at"] != null ? json["created_at"] : '';
    _updatedAt = json["updated_at"] != null ? json["updated_at"] : '';
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["exo_id"] = _exoId;
    map["course_id"] = _courseId;
    map["student_id"] = _studentId;
    map["note_v"] = _noteV;
    map["state"] = _state;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    return map;
  }
}
