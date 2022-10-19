import 'dart:convert';

InscriptionResponse inscriptionResponseFromJson(String str) => InscriptionResponse.fromJson(json.decode(str));

String inscriptionResponseToJson(InscriptionResponse data) => json.encode(data.toJson());

class InscriptionResponse {
  InscriptionResponse({
    this.status,
    this.key,
    this.flash,
  });

  int? status;
  String? key;
  String? flash;

  factory InscriptionResponse.fromJson(Map<String, dynamic> json) => InscriptionResponse(
    status: json["status"],
    key: json["key"],
    flash: json["flash"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "key": key,
    "flash": flash,
  };
}
