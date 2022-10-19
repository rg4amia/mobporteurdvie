class Resume {
 late int _id;
 late String _resumeV;
 late int _userId;
 late int _sessionId;
 late int _courId;
 late int _state;
 late int _type;
 late String _createdAt;
 late String _updatedAt;

  int get id => _id;
  String get resumeV => _resumeV;
  int get userId => _userId;
  int get sessionId => _sessionId;
  int get courId => _courId;
  int get state => _state;
  int get type => _type;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  Resume(
      {int? id,
      String? resumeV,
      int? userId,
      int? sessionId,
      int? courId,
      int? state,
      int? type,
      String? createdAt,
      String? updatedAt}) {
    _id = id!;
    _resumeV = resumeV!;
    _userId = userId!;
    _sessionId = sessionId!;
    _courId = courId!;
    _state = state!;
    _type = type!;
    _createdAt = createdAt!;
    _updatedAt = updatedAt!;
  }

  Resume.fromJson(dynamic json) {
    _id = json["id"] != null ? json["id"] : 0;
    _resumeV = json["resume_v"] != null ? json["resume_v"] : '';
    _userId = json["user_id"] != null ? json["user_id"] : 0;
    _sessionId = json["session_id"] != null ? json["session_id"] : 0;
    _courId = json["cour_id"] != null ? json["cour_id"] : 0;
    _state = json["state"] != null ? json["state"] : 0;
    _type = json["type"] != null ? json["type"] : 0;
    _createdAt = json["created_at"] != null ? json["created_at"] : '';
    _updatedAt = json["updated_at"] != null ? json["updated_at"] : '';
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["resume_v"] = _resumeV;
    map["user_id"] = _userId;
    map["session_id"] = _sessionId;
    map["cour_id"] = _courId;
    map["state"] = _state;
    map["type"] = _type;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    return map;
  }
}
