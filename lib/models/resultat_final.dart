import 'dart:convert';

ResultatFinal resultatFinalFromJson(String str) =>
    ResultatFinal.fromJson(json.decode(str));

String resultatFinalToJson(ResultatFinal data) => json.encode(data.toJson());

class ResultatFinal {
  ResultatFinal({
    this.finalResultat,
  });

  FinalResultat? finalResultat;

  factory ResultatFinal.fromJson(Map<String, dynamic> json) => ResultatFinal(
        finalResultat: json == null ? null : FinalResultat.fromJson(json),
      );

  Map<String, dynamic> toJson() => {
        "final_resultat":
            finalResultat == null ? null : finalResultat!.toJson(),
      };
}

class FinalResultat {
  FinalResultat(
      {this.id,
      this.userId,
      this.studentClassId,
      this.moyenne,
      this.comment,
      this.rank,
      this.state,
      this.validatedBy,
      this.createdAt,
      this.updatedAt,
      this.url});

  int? id;
  int? userId;
  int? studentClassId;
  int? moyenne;
  String? comment;
  int? rank;
  int? state;
  int? validatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? url;

  factory FinalResultat.fromJson(Map<String, dynamic> json) => FinalResultat(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        studentClassId:
            json["student_class_id"] == null ? null : json["student_class_id"],
        moyenne: json["moyenne"] == null ? null : json["moyenne"],
        comment: json["comment"] == null ? null : json["comment"],
        rank: json["rank"] == null ? null : json["rank"],
        state: json["state"] == null ? null : json["state"],
        validatedBy: json["validated_by"] == null ? null : json["validated_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
            url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "student_class_id": studentClassId == null ? null : studentClassId,
        "moyenne": moyenne == null ? null : moyenne,
        "comment": comment == null ? null : comment,
        "rank": rank == null ? null : rank,
        "state": state == null ? null : state,
        "validated_by": validatedBy == null ? null : validatedBy,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "url": url == null ? null : url,
      };
}
