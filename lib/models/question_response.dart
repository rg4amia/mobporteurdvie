import 'dart:convert';
class Question {
  Question({
    this.id,
    this.question,
    this.studentResponse,
    this.trueResponse,
    this.bonnereponse,
    this.repid,
    this.exoId,
    this.state,
    this.type,
    this.correct,
    this.point,
    this.sessionId,
    this.createdAt,
    this.updatedAt,
    this.responses,
    this.indice,
  });

  int? id;
  String? question;
  int? studentResponse;
  Response? trueResponse;
  String? bonnereponse;
  int? repid;
  int? exoId;
  int? state;
  int? type;
  int? correct;
  int? point;
  int? sessionId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Response>? responses;
  int? indice;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
  id: json["id"] == null ? null : json["id"],
  question: json["question"] == null ? null : json["question"],
  studentResponse: json["student_response"] == null ? null : json["student_response"],
  trueResponse: json["true_response"] == null ? null : Response.fromJson(json["true_response"]),
  bonnereponse: json["bonnereponse"] == null ? null : json["bonnereponse"],
  repid: json["repid"] == null ? null : json["repid"],
  exoId: json["exo_id"] == null ? null : json["exo_id"],
  state: json["state"] == null ? null : json["state"],
  type: json["type"] == null ? null : json["type"],
  correct: json["correct"] == null ? null : json["correct"],
  point: json["point"] == null ? null : json["point"],
  sessionId: json["sessionId"] == null ? null : json["sessionId"],
  createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  responses: json["responses"] == null ? null : List<Response>.from(json["responses"].map((x) => Response.fromJson(x))),
  indice: json["indice"] == null ? null : json["indice"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "question": question == null ? null : question,
    "student_response": studentResponse == null ? null : studentResponse,
    "true_response": trueResponse == null ? null : trueResponse!.toJson(),
    "bonnereponse": bonnereponse == null ? null : bonnereponse,
    "repid": repid == null ? null : repid,
    "exo_id": exoId == null ? null : exoId,
    "state": state == null ? null : state,
    "type": type == null ? null : type,
    "correct": correct == null ? null : correct,
    "point": point == null ? null : point,
    "sessionId": sessionId == null ? null : sessionId,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "responses": responses == null ? null : List<dynamic>.from(responses!.map((x) => x.toJson())),
    "indice": indice == null ? null : indice,
  };
  }

  class Response {
    Response({
      this.id,
      this.reponse,
      this.questionId,
      this.state,
      this.responseId,
    });

    int? id;
    String? reponse;
    int? questionId;
    int? state;
    int? responseId;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
      id: json["id"] == null ? null : json["id"],
      reponse: json["reponse"] == null ? null : json["reponse"],
      questionId: json["question_id"] == null ? null : json["question_id"],
      state: json["state"] == null ? null : json["state"],
      responseId: json["response_id"] == null ? null : json["response_id"],
    );

    Map<String, dynamic> toJson() => {
      "id": id == null ? null : id,
      "reponse": reponse == null ? null : reponse,
      "question_id": questionId == null ? null : questionId,
      "state": state == null ? null : state,
      "response_id": responseId == null ? null : responseId,
    };
  }
