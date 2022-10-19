import 'responses.dart';
import 'dart:convert';
import 'studentevaluation.dart';
import 'question_response.dart';

Studentcoursshowdata studentcoursshowdataFromJson(String str) => Studentcoursshowdata.fromJson(json.decode(str));

String studentcoursshowdataToJson(Studentcoursshowdata data) => json.encode(data.toJson());

class Studentcoursshowdata {
  Studentcoursshowdata({
    this.cours,
    this.resume,
    this.exercice,
    this.questions,
    this.pointDispo,
    this.studentEvaluation,
    this.essais,
    this.media,
    this.studentId,
  });

  Cours? cours;
  String? resume;
  Exercice? exercice;
  List<Question>? questions;
  int? pointDispo;
  StudentEvaluation? studentEvaluation;
  List<dynamic>? essais;
  List<Media>? media;
  int? studentId;

  factory Studentcoursshowdata.fromJson(Map<String, dynamic> json) => Studentcoursshowdata(
    cours: json["cours"] == null ? null : Cours.fromJson(json["cours"]),
    resume: json["resume"] == null ? null : json["resume"],
    exercice: json["exercice"] == null ? null : Exercice.fromJson(json["exercice"]),
    questions: json["questions"] == null ? null : List<Question>.from(json["questions"].map((x) => Question.fromJson(x))), //List<dynamic>.from(json["questions"].map((x) => x)),
    pointDispo: json["point_dispo"] == null ? null : json["point_dispo"],
    studentEvaluation: json["studentEvaluation"] == null ? null : StudentEvaluation.fromJson(json["studentEvaluation"]) ,
    essais: json["essais"] == null ? null : List<dynamic>.from(json["essais"].map((x) => x)),
    media: json["media"] == null ? null : List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
    studentId: json["student_id"] == null ? null : json["student_id"],
  );

  Map<String, dynamic> toJson() => {
    "cours": cours == null ? null : cours!.toJson(),
    "resume": resume == null ? null : resume,
    "exercice": exercice,
    "questions": questions == null ? null : List<dynamic>.from(questions!.map((x) => x)),
    "point_dispo": pointDispo == null ? null : pointDispo,
    "studentEvaluation": studentEvaluation,
    "essais": essais == null ? null : List<dynamic>.from(essais!.map((x) => x)),
    "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toJson())),
    "student_id": studentId == null ? null : studentId,
  };
}

class Cours {
  Cours({
    this.coursIdN,
    this.fileV,
    this.sessionId,
    this.campusId,
    this.schoolId,
    this.moduleId,
    this.themeV,
    this.orateurId,
    this.moderateurId,
    this.coursDateD,
    this.audioLink,
    this.videoLink,
    this.coursLieuV,
    this.coursObsV,
    this.notification,
    this.statusN,
    this.exoRequire,
    this.resumeRequire,
    this.prevCoursId,
    this.createdAt,
    this.updatedAt,
  });

  int? coursIdN;
  String? fileV;
  int? sessionId;
  dynamic campusId;
  dynamic schoolId;
  int? moduleId;
  String? themeV;
  int? orateurId;
  int? moderateurId;
  dynamic coursDateD;
  dynamic audioLink;
  dynamic videoLink;
  String? coursLieuV;
  String? coursObsV;
  int? notification;
  int? statusN;
  int? exoRequire;
  int? resumeRequire;
  int? prevCoursId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Cours.fromJson(Map<String, dynamic> json) => Cours(
    coursIdN: json["cours_id_n"] == null ? null : json["cours_id_n"],
    fileV: json["file_v"] == null ? null : json["file_v"],
    sessionId: json["session_id"] == null ? null : json["session_id"],
    campusId: json["campus_id"],
    schoolId: json["school_id"],
    moduleId: json["module_id"] == null ? null : json["module_id"],
    themeV: json["theme_v"] == null ? null : json["theme_v"],
    orateurId: json["orateur_id"] == null ? null : json["orateur_id"],
    moderateurId: json["moderateur_id"] == null ? null : json["moderateur_id"],
    coursDateD: json["cours_date_d"],
    audioLink: json["audio_link"],
    videoLink: json["video_link"],
    coursLieuV: json["cours_lieu_v"] == null ? null : json["cours_lieu_v"],
    coursObsV: json["cours_obs_v"] == null ? null : json["cours_obs_v"],
    notification: json["notification"] == null ? null : json["notification"],
    statusN: json["status_n"] == null ? null : json["status_n"],
    exoRequire: json["exo_require"] == null ? null : json["exo_require"],
    resumeRequire: json["resume_require"] == null ? null : json["resume_require"],
    prevCoursId: json["prev_cours_id"] == null ? null : json["prev_cours_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "cours_id_n": coursIdN == null ? null : coursIdN,
    "file_v": fileV == null ? null : fileV,
    "session_id": sessionId == null ? null : sessionId,
    "campus_id": campusId,
    "school_id": schoolId,
    "module_id": moduleId == null ? null : moduleId,
    "theme_v": themeV == null ? null : themeV,
    "orateur_id": orateurId == null ? null : orateurId,
    "moderateur_id": moderateurId == null ? null : moderateurId,
    "cours_date_d": coursDateD,
    "audio_link": audioLink,
    "video_link": videoLink,
    "cours_lieu_v": coursLieuV == null ? null : coursLieuV,
    "cours_obs_v": coursObsV == null ? null : coursObsV,
    "notification": notification == null ? null : notification,
    "status_n": statusN == null ? null : statusN,
    "exo_require": exoRequire == null ? null : exoRequire,
    "resume_require": resumeRequire == null ? null : resumeRequire,
    "prev_cours_id": prevCoursId == null ? null : prevCoursId,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}

class Exercice {
  Exercice({
    required this.id,
    required this.courseId,
    required this.requireNote,
    required this.state,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int courseId;
  late final int requireNote;
  late final int state;
  late final String createdAt;
  late final String updatedAt;

  Exercice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    requireNote = json['require_note'];
    state = json['state'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['course_id'] = courseId;
    _data['require_note'] = requireNote;
    _data['state'] = state;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Questions {
  Questions({
    required this.id,
    required this.question,
    required this.studentResponse,
    required this.trueResponse,
    required this.bonnereponse,
    required this.repid,
    required this.exoId,
    required this.state,
    required this.type,
    required this.correct,
    required this.point,
    required this.sessionId,
    required this.createdAt,
    required this.updatedAt,
    required this.responses,
    required this.indice,
  });
  late final int id;
  late final String question;
  late final int studentResponse;
  late final TrueResponse trueResponse;
  late final String bonnereponse;
  late final int repid;
  late final int exoId;
  late final int state;
  late final int type;
  late final int correct;
  late final int point;
  late final int sessionId;
  late final String createdAt;
  late final String updatedAt;
  late final List<Responses> responses;
  late final int indice;

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    studentResponse = json['student_response'];
    trueResponse = TrueResponse.fromJson(json['true_response']);
    bonnereponse = json['bonnereponse'];
    repid = json['repid'];
    exoId = json['exo_id'];
    state = json['state'];
    type = json['type'];
    correct = json['correct'];
    point = json['point'];
    sessionId = json['sessionId'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    responses =
        List.from(json['responses']).map((e) => Responses.fromJson(e)).toList();
    indice = json['indice'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['question'] = question;
    _data['student_response'] = studentResponse;
    _data['true_response'] = trueResponse.toJson();
    _data['bonnereponse'] = bonnereponse;
    _data['repid'] = repid;
    _data['exo_id'] = exoId;
    _data['state'] = state;
    _data['type'] = type;
    _data['correct'] = correct;
    _data['point'] = point;
    _data['sessionId'] = sessionId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['responses'] = responses.map((e) => e.toJson()).toList();
    _data['indice'] = indice;
    return _data;
  }
}

class TrueResponse {
  TrueResponse({
    required this.id,
    required this.questionId,
    required this.responseId,
    required this.state,
  });

  late final int id;
  late final int questionId;
  late final int responseId;
  late final int state;

  TrueResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionId = json['question_id'];
    responseId = json['response_id'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['question_id'] = questionId;
    _data['response_id'] = responseId;
    _data['state'] = state;
    return _data;
  }
}

class Essais {
  Essais({
    required this.id,
    required this.exoId,
    required this.courseId,
    required this.studentId,
    required this.noteV,
    required this.state,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int exoId;
  late final int courseId;
  late final int studentId;
  late final int noteV;
  late final int state;
  late final String createdAt;
  late final String updatedAt;

  Essais.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    exoId = json['exo_id'];
    courseId = json['course_id'];
    studentId = json['student_id'];
    noteV = json['note_v'];
    state = json['state'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['exo_id'] = exoId;
    _data['course_id'] = courseId;
    _data['student_id'] = studentId;
    _data['note_v'] = noteV;
    _data['state'] = state;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Media {
  Media({
    this.id,
    this.mediaUrl,
    this.courseId,
    this.type,
    this.state,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? mediaUrl;
  int? courseId;
  int? type;
  int? state;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    id: json["id"] == null ? null : json["id"],
    mediaUrl: json["media_url"] == null ? null : json["media_url"],
    courseId: json["course_id"] == null ? null : json["course_id"],
    type: json["type"] == null ? null : json["type"],
    state: json["state"] == null ? null : json["state"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "media_url": mediaUrl == null ? null : mediaUrl,
    "course_id": courseId == null ? null : courseId,
    "type": type == null ? null : type,
    "state": state == null ? null : state,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}

