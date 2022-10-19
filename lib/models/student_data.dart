import 'resultat_final.dart';
import 'SchoolLink.dart';
import 'studentcoursshowdata.dart';
import 'class_infos.dart';
import 'campus.dart';
import 'school.dart';
import 'student.dart';
import 'apercu_statistique.dart';

class StudentData {
  late int _vertuStatment;
  late ResultatFinal _resultatFinal;
  late Class_infos _classInfos;
  late Campus _campus;
  late School _school;
  late List<Cours> _cours;
  late int _studentId;
  late int _userId;
  late int _campusId;
  late int _schoolId;
  late Student _student;
  late SchoolLink _schoolLink;
  late int _watcher;
  late String _photo;
  late ApercuStatistique _apercuStatistique;

  int get vertuStatment => _vertuStatment;
  ResultatFinal get resultatFinal => _resultatFinal;
  Class_infos get classInfos => _classInfos;
  String get photo => _photo;
  Campus get campus => _campus;
  School get school => _school;
  List<Cours> get cours => _cours;
  int get studentId => _studentId;
  int get userId => _userId;
  int get campusId => _campusId;
  int get schoolId => _schoolId;
  Student get student => _student;
  SchoolLink get schoolLink => _schoolLink;
  int get watcher => _watcher;
  ApercuStatistique get apercuStatistique => _apercuStatistique;

  StudentData(
      {int? vertuStatment,
      ResultatFinal? resultatFinal,
      Class_infos? classInfos,
      String? photo,
      Campus? campus,
      School? school,
      List<Cours>? cours,
      int? studentId,
      int? userId,
      int? campusId,
      int? schoolId,
      ApercuStatistique? apercuStatistique,
      Student? student,
      SchoolLink? schoolLink,
      int? watcher}) {
    _vertuStatment = vertuStatment!;
    _resultatFinal = resultatFinal!;
    _classInfos = classInfos!;
    _campus = campus!;
    _school = school!;
    _cours = cours!;
    _studentId = studentId!;
    _userId = userId!;
    _campusId = campusId!;
    _schoolId = schoolId!;
    _student = student!;
    _watcher = watcher!;
    _photo = photo!;
    _apercuStatistique = apercuStatistique!;
  }

  StudentData.fromJson(dynamic json) {
    _vertuStatment = json["vertuStatment"];
    _resultatFinal = (json["final_resultat"] != null
        ? ResultatFinal.fromJson(json["final_resultat"])
        : null)!;
    _classInfos = (json["class_infos"] != null
        ? Class_infos.fromJson(json["class_infos"])
        : null)!;
    _photo = json['photo'];
    _campus =
        (json["campus"] != null ? Campus.fromJson(json["campus"]) : null)!;
    _school =
        (json["school"] != null ? School.fromJson(json["school"]) : null)!;
    if (json["cours"] != null) {
      _cours = [];
      json["cours"].forEach((v) {
        _cours.add(Cours.fromJson(v));
      });
    }
    _studentId = json["student_id"];
    _userId = json["user_id"];
    _campusId = json["campus_id"];
    _schoolId = json["school_id"];
    _student =
        (json["student"] != null ? Student.fromJson(json["student"]) : null)!;
    _schoolLink =
        (json["schools"] != null ? SchoolLink.fromJson(json["schools"]) : null)!;
    _apercuStatistique = (json['apercu_stat'] != null
        ? ApercuStatistique.fromJson(json['apercu_stat'])
        : null)!;
    _watcher = json["watcher"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["vertuStatment"] = _vertuStatment;
    if (_resultatFinal != null) {
      map['final_resultat'] = _resultatFinal.toJson();
    }
    if (_classInfos != null) {
      map["class_infos"] = _classInfos.toJson();
    }
    if (_campus != null) {
      map["campus"] = _campus.toJson();
    }
    if (_school != null) {
      map["school"] = _school.toJson();
    }
    if (_cours != null) {
      map["cours"] = _cours.map((v) => v.toJson()).toList();
    }

    map["student_id"] = _studentId;
    map["user_id"] = _userId;
    map["campus_id"] = _campusId;
    map["school_id"] = _schoolId;
    map["photo"] = _photo;

    if (_apercuStatistique != null) {
      map["apercu_stat"] = _apercuStatistique.toJson();
    }

    if (_student != null) {
      map["student"] = _student.toJson();
    }

    if (_schoolLink != null) {
      map["schools"] = _schoolLink.toJson();
    }

    map["watcher"] = _watcher;
    return map;
  }
}
