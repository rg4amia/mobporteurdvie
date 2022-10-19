import 'cours_by_module.dart';
import 'user.dart';

class Getbyschoolfromstudent {

  Getbyschoolfromstudent({
    this.titleModule,
    this.nbrcours,
    this.coursByModule,
    this.user,
  });

  String? titleModule;
  int? nbrcours;
  List<Cours_by_module>? coursByModule;
  List<User>? user;

  factory Getbyschoolfromstudent.fromJson(Map<String, dynamic> json) => Getbyschoolfromstudent(
        titleModule: json["titleModule"],
        nbrcours: json["nbrcours"],
        coursByModule: List<Cours_by_module>.from(
            json["cours_by_module"].map((x) => Cours_by_module.fromJson(x))),
        user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "titleModule": titleModule,
        "nbrcours": nbrcours,
        "cours_by_module": coursByModule!.map((v) => v.toJson()).toList(),
        "user": user!.map((v) => v.toJson()).toList(),
      };
}