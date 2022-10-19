import 'dart:convert';

StudentEvaluation studentEvaluationFromJson(String str) => StudentEvaluation.fromJson(json.decode(str));

String studentEvaluationToJson(StudentEvaluation data) => json.encode(data.toJson());

class StudentEvaluation {
  StudentEvaluation({
    this.id,
    this.studentId,
    this.exoId,
    this.courseId,
    this.moduleId,
    this.note,
    this.sessionId,
    this.createdAt,
    this.updatedAt,
    this.state,
  });

  int? id;
  int? studentId;
  int? exoId;
  int? courseId;
  int? moduleId;
  int? note;
  int? sessionId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? state;

  factory StudentEvaluation.fromJson(Map<String, dynamic> json) => StudentEvaluation(
    id: json["id"] == null ? null : json["id"],
    studentId: json["student_id"] == null ? null : json["student_id"],
    exoId: json["exo_id"] == null ? null : json["exo_id"],
    courseId: json["course_id"] == null ? null : json["course_id"],
    moduleId: json["module_id"] == null ? null : json["module_id"],
    note: json["note"] == null ? null : json["note"],
    sessionId: json["session_id"] == null ? null : json["session_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    state: json["state"] == null ? null : json["state"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "student_id": studentId == null ? null : studentId,
    "exo_id": exoId == null ? null : exoId,
    "course_id": courseId == null ? null : courseId,
    "module_id": moduleId == null ? null : moduleId,
    "note": note == null ? null : note,
    "session_id": sessionId == null ? null : sessionId,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "state": state == null ? null : state,
  };
}
