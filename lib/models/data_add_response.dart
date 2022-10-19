import 'response.dart';

class DataAddResponse {
  late bool _status;
  late Response _response;

  bool get status => _status;
  Response get response => _response;

  DataAddResponse({bool? status, Response? response}) {
    _status = status!;
    _response = response!;
  }

  DataAddResponse.fromJson(dynamic json) {
    _status = json["status"];
    _response =
        (json["response"] != null ? Response.fromJson(json["response"]) : null)!;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    if (_response != null) {
      map["response"] = _response.toJson();
    }
    return map;
  }
}
