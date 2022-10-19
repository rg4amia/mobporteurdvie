import 'modules.dart';

class Module {
  late List<Modules> _modules;
  late int _studentId;

  List<Modules> get modules => _modules;
  int get studentId => _studentId;

  Module({List<Modules>? modules, int? studentId}) {
    _modules = modules!;
    _studentId = studentId!;
  }

  Module.fromJson(dynamic json) {
    if (json["modules"] != null) {
      _modules = [];
      json["modules"].forEach((v) {
        _modules.add(Modules.fromJson(v));
      });
    }
    _studentId = json["studentId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_modules != null) {
      map["modules"] = _modules.map((v) => v.toJson()).toList();
    }
    map["studentId"] = _studentId;
    return map;
  }
}
