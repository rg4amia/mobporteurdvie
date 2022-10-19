
class True_response {
 late int _id;
 late int _questionId;
 late int _responseId;
 late int _state;

  int get id => _id;
  int get questionId => _questionId;
  int get responseId => _responseId;
  int get state => _state;

  True_response({int? id, int? questionId, int? responseId, int? state}) {
    _id = id!;
    _questionId = questionId!;
    _responseId = responseId!;
    _state = state!;
  }

  True_response.fromJson(dynamic json) {
    _id = json["id"];
    _questionId = json["question_id"];
    _responseId = json["response_id"];
    _state = json["state"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["question_id"] = _questionId;
    map["response_id"] = _responseId;
    map["state"] = _state;
    return map;
  }
}
