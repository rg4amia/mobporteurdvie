import 'dart:convert';

List<Permission> permissionFromJson(String str) => List<Permission>.from(json.decode(str).map((x) => Permission.fromJson(x)));

String permissionToJson(List<Permission> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Permission {
  Permission({
    this.id,
    this.verdict,
    this.contentResponse,
    this.dateCreation,
    this.sujet,
    this.cour,
    this.tailleMessage,
    this.message,
    this.state,
    this.result,
  });

  int? id;
  String? verdict;
  String? contentResponse;
  String? dateCreation;
  String? sujet;
  String? cour;
  int? tailleMessage;
  String? message;
  int? state;
  int? result;

  factory Permission.fromJson(Map<String, dynamic> json) => Permission(
    id: json["id"] != null ? json["id"] : 0,
    verdict: json["verdict"] != null ? json["verdict"] : '',
    contentResponse: json["content_response"] != null ? json["content_response"] : '',
    dateCreation: json["date_creation"] != null ? json["date_creation"] : '',
    sujet: json["sujet"] != null ? json["sujet"] : '',
    cour: json["cour"] != null ? json["cour"] : '',
    tailleMessage: json["taille_message"] != null ? json["taille_message"] : 0,
    message: json["message"] != null ? json["message"] : '',
    state: json["state"] != null ? json["state"] : 0,
    result: json["result"] != null ? json["result"] : 0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "verdict": verdict,
    "content_response": contentResponse,
    "date_creation": dateCreation,
    "sujet":sujet,
    "cour": cour,
    "taille_message": tailleMessage,
    "message": message,
    "state": state,
    "result": result,
  };
}

PermissionAddResponse permissionAddResponseFromJson(String str) => PermissionAddResponse.fromJson(json.decode(str));

String permissionAddResponseToJson(PermissionAddResponse data) => json.encode(data.toJson());

class PermissionAddResponse {
  PermissionAddResponse({
    this.flash,
    this.status,
  });

  String? flash;
  int? status;

  factory PermissionAddResponse.fromJson(Map<String, dynamic> json) => PermissionAddResponse(
    flash: json["flash"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "flash": flash,
    "status": status,
  };
}
