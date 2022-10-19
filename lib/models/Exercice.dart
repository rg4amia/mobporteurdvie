import 'dart:convert';

Exercice exerciceFromJson(String str) => Exercice.fromJson(json.decode(str));

String exerciceToJson(Exercice data) => json.encode(data.toJson());

class Exercice {
  Exercice({
    this.id,
    this.courseId,
    this.requireNote,
    this.state,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? courseId;
  int? requireNote;
  int? state;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Exercice.fromJson(Map<String, dynamic> json) => Exercice(
    id: json["id"] == null ? null : json["id"],
    courseId: json["course_id"] == null ? null : json["course_id"],
    requireNote: json["require_note"] == null ? null : json["require_note"],
    state: json["state"] == null ? null : json["state"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "course_id": courseId == null ? null : courseId,
    "require_note": requireNote == null ? null : requireNote,
    "state": state == null ? null : state,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}