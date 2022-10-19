import 'dart:convert';

MeditationData meditationDataFromJson(String str) => MeditationData.fromJson(json.decode(str));

String meditationDataToJson(MeditationData data) => json.encode(data.toJson());

class MeditationData {
  MeditationData({
    this.nombre,
  });

  int? nombre;

  factory MeditationData.fromJson(Map<String, dynamic> json) => MeditationData(
    nombre: json["nombre"],
  );

  Map<String, dynamic> toJson() => {
    "nombre": nombre,
  };
}

MeditationAddResponse meditationAddResponseFromJson(String str) => MeditationAddResponse.fromJson(json.decode(str));
String meditationAddResponseToJson(MeditationAddResponse data) => json.encode(data.toJson());

class MeditationAddResponse {
  MeditationAddResponse({
    this.flash,
    this.status,
  });

  String? flash;
  int? status;

  factory MeditationAddResponse.fromJson(Map<String, dynamic> json) => MeditationAddResponse(
    flash: json["flash"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "flash": flash,
    "status": status,
  };
}

Meditation meditationFromJson(String str) => Meditation.fromJson(json.decode(str));

String meditationToJson(Meditation data) => json.encode(data.toJson());

class Meditation {
  Meditation({
    this.id,
    this.textToMeditate,
    this.meditation,
    this.revelation,
    this.action,
    this.planLectureDetail,
    this.priere,
    this.userId,
    this.vertumetreId,
    this.nombre
  });

  int? id;
  int? nombre;
  String? textToMeditate;
  String? meditation;
  String? revelation;
  String? action;
  dynamic planLectureDetail;
  dynamic priere;
  int? userId;
  int? vertumetreId;

  factory Meditation.fromJson(Map<String, dynamic> json) => Meditation(
    id: json["id"],
    nombre : json['nombre'],
    textToMeditate: json["textToMeditate"],
    meditation: json["meditation"],
    revelation: json["revelation"],
    action: json["action"],
    planLectureDetail: json["plan_lecture_detail"],
    priere: json["priere"],
    userId: json["user_id"],
    vertumetreId: json["vertumetre_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre" : nombre,
    "textToMeditate": textToMeditate,
    "meditation": meditation,
    "revelation": revelation,
    "action": action,
    "plan_lecture_detail": planLectureDetail,
    "priere": priere,
    "user_id": userId,
    "vertumetre_id": vertumetreId,
  };
}

