
class Responses {
  Responses({
    required this.id,
    required this.reponse,
    required this.questionId,
    required this.state,
  });
  late final int id;
  late final String reponse;
  late final int questionId;
  late final int state;

  Responses.fromJson(Map<String, dynamic> json){
    id = json['id'];
    reponse = json['reponse'];
    questionId = json['question_id'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['reponse'] = reponse;
    _data['question_id'] = questionId;
    _data['state'] = state;
    return _data;
  }
}