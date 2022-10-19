import 'dart:convert';

SchoolLink schoolLinkFromJson(String str) =>
    SchoolLink.fromJson(json.decode(str));

String schoolLinkToJson(SchoolLink data) => json.encode(data.toJson());

class SchoolLink {
  SchoolLink({
    this.ecole1,
    this.ecole2,
    this.ecole3,
    this.ecole4,
  });

  String? ecole1;
  String? ecole2;
  String? ecole3;
  String? ecole4;

  factory SchoolLink.fromJson(Map<String, dynamic> json) => SchoolLink(
        // ignore: prefer_if_null_operators
        ecole1: json["ecole_1"] == null ? null : json["ecole_1"],
        // ignore: prefer_if_null_operators
        ecole2: json["ecole_2"] == null ? null : json["ecole_2"],
        // ignore: prefer_if_null_operators
        ecole3: json["ecole_3"] == null ? null : json["ecole_3"],
        // ignore: prefer_if_null_operators
        ecole4: json["ecole_4"] == null ? null : json["ecole_4"],
      );

  Map<String, dynamic> toJson() => {
        // ignore: prefer_if_null_operators
        "ecole_1": ecole1 == null ? null : ecole1,
        // ignore: prefer_if_null_operators
        "ecole_2": ecole2 == null ? null : ecole2,
        // ignore: prefer_if_null_operators
        "ecole_3": ecole3 == null ? null : ecole3,
        // ignore: prefer_if_null_operators
        "ecole_4": ecole4 == null ? null : ecole4,
  };
}
