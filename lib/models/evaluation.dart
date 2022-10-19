class Evaluation {
  Evaluation({
    this.id,
    this.exoId,
    this.courseId,
    this.studentId,
    this.noteV,
    this.state,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? exoId;
  int? courseId;
  int? studentId;
  int? noteV;
  int? state;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Evaluation.fromJson(Map<String, dynamic> json) => Evaluation(
        id: json["id"] == null ? null : json["id"],
        exoId: json["exo_id"] == null ? null : json["exo_id"],
        courseId: json["course_id"] == null ? null : json["course_id"],
        studentId: json["student_id"] == null ? null : json["student_id"],
        noteV: json["note_v"] == null ? null : json["note_v"],
        state: json["state"] == null ? null : json["state"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "exo_id": exoId == null ? null : exoId,
        "course_id": courseId == null ? null : courseId,
        "student_id": studentId == null ? null : studentId,
        "note_v": noteV == null ? null : noteV,
        "state": state == null ? null : state,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}

/* class Evaluation {
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

  Evaluation(
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

  Evaluation.fromJson(dynamic json) {
    _id = json["id"];
    _exoId = json["exo_id"];
    _courseId = json["course_id"];
    _studentId = json["student_id"];
    _noteV = json["note_v"];
    _state = json["state"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
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
 */