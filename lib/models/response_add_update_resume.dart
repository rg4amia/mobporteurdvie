import 'resume.dart';

class ResponseAddUpdateResume {
 late bool _status;
 late String _mode;
 late Resume _resume;

  bool get status => _status;
  String get mode => _mode;
  Resume get resume => _resume;

  ResponseAddUpdateResume({bool? status, String? mode, Resume? resume}) {
    _status = status!;
    _mode = mode!;
    _resume = resume!;
  }

  ResponseAddUpdateResume.fromJson(dynamic json) {
    _status = json["status"];
    _mode = json["mode"];
    _resume = (json["resume"] != null ? Resume.fromJson(json["resume"]) : null)!;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["mode"] = _mode;
    if (_resume != null) {
      map["resume"] = _resume.toJson();
    }
    return map;
  }
}
