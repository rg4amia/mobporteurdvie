
class UserResponse {
  String? token;
  String? email;
  String? numero_etudiant;
  String? name;
  int? level;
  String? errors;

  UserResponse(
      {this.email,
      this.level,
      this.numero_etudiant,
      this.name,
      this.token,
      this.errors});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
        email: json['email'],
        level: json['level'],
        numero_etudiant: json['numero_etudiant'],
        name: json['name'],
        token: json['token'],
        errors: (json['errors'] == null) ? "" : json['errors']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['level'] = this.level;
    data['numero_etudiant'] = this.numero_etudiant;
    data['name'] = this.name;
    data['token'] = this.token;
    data['errors'] = this.errors;
    return data;
  }
}
