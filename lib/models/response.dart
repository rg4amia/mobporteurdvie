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
    id: json["id"],
    reponse: json["reponse"] == null ? null : json["reponse"],
    questionId: json["question_id"],
    state: json["state"],
    responseId: json["response_id"] == null ? null : json["response_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "reponse": reponse == null ? null : reponse,
    "question_id": questionId,
    "state": state,
    "response_id": responseId == null ? null : responseId,
  };
}
/*class Response {
  late String _questionId;
  late int _responseId;
  late int _studentId;
  late int _courseEvaluationId;
  late int _state;
  late int _id;

  String get questionId => _questionId;
  int get responseId => _responseId;
  int get studentId => _studentId;
  int get courseEvaluationId => _courseEvaluationId;
  int get state => _state;
  int get id => _id;

  Response(
      {String? questionId,
      int? responseId,
      int? studentId,
      int? courseEvaluationId,
      int? state,
      int? id}) {
    _questionId = questionId!;
    _responseId = responseId!;
    _studentId = studentId!;
    _courseEvaluationId = courseEvaluationId!;
    _state = state!;
    _id = id!;
  }

  Response.fromJson(dynamic json) {
    _questionId = json["question_id"];
    _responseId = json["response_id"];
    _studentId = json["student_id"];
    _courseEvaluationId = json["course_evaluation_id"];
    _state = json["state"];
    _id = json["id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["question_id"] = _questionId;
    map["response_id"] = _responseId;
    map["student_id"] = _studentId;
    map["course_evaluation_id"] = _courseEvaluationId;
    map["state"] = _state;
    map["id"] = _id;
    return map;
  }
}*/
