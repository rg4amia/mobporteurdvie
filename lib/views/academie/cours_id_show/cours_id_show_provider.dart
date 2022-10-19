import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../helpers/base_url.dart';
import '../../../helpers/shared_service.dart';
import '../../../models/UserResponse.dart';
import '../../../models/data_add_response.dart';
import '../../../models/response_add_update_resume.dart';
import '../../../models/responses.dart';
import '../../../models/student_data.dart';
import '../../../models/studentcoursshowdata.dart';

class CoursIdShowRepository extends GetConnect {
  UserResponse? user;
  List<Responses> listResponses = [];
  StudentData? student;
  Studentcoursshowdata? studentcoursshowdata;

  getCourseByID(int id) async {
    String baseUrl = BaseURL.host + BaseURL.getstudentcoursshowdata(id);
    user = await SharedService.getDataUser();

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${user!.token}',
    };

     try {
       final response = await http.get(Uri.parse(baseUrl), headers: headers);
       if (response.statusCode == 200) {
         print(response.body);
         studentcoursshowdata = studentcoursshowdataFromJson(response.body); // Studentcoursshowdata.fromJson(json);
         return studentcoursshowdata;
       }
    } on SocketException {
      print('erreur');
    } catch (e) {
       print(e);
    }
  }

  getResponseByQuestion(int id) async {
    String baseUrl = BaseURL.host + BaseURL.getresponsebyquestion(id);
    bool _result = await SharedService.isLoggeIn();
    if (_result) {
      user = await SharedService.getDataUser();
    }
    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${user!.token}',
    };

    try {
      final response = await http.get(Uri.parse(baseUrl), headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(response.body);
        listResponses = json['responses'].map<Responses>((map) {
          return Responses.fromJson(map);
        }).toList();
        return listResponses;
      }
    } on SocketException {} catch (e) {}
  }

  addAndUpdateResume(String resume, int cour_id) async {
    String baseUrl = BaseURL.host + "/add_update_resume";
    bool _result = await SharedService.isLoggeIn();
    if (_result) {
      user = await SharedService.getDataUser();
    }

    var data = {
      'resume': resume,
      'cour_id': cour_id,
    };

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${user!.token}',
    };

    try {
      final response = await http.post(Uri.parse(baseUrl),
          headers: headers, body: jsonEncode(data));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        ResponseAddUpdateResume responseAddUpdateResume =
            ResponseAddUpdateResume.fromJson(json);
        return responseAddUpdateResume;
      }
    } on SocketException {} catch (e) {}
  }

  addResponse(Map<String, dynamic> resp, int exo_id) async {
    String baseUrl = BaseURL.host + "/add_response";
    bool _result = await SharedService.isLoggeIn();

    if (_result) {
      user = await SharedService.getDataUser();
    }

    resp.addAll({'exo_id': exo_id});

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${user!.token}',
    };

    try {
      final response = await http.post(Uri.parse(baseUrl),
          headers: headers, body: jsonEncode(resp));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        DataAddResponse dataAddResponse = DataAddResponse.fromJson(json);
        return dataAddResponse;
      }
    } on SocketException {} catch (e) {}
  }

  getStudentData() async {
    String baseUrl = BaseURL.host + BaseURL.studentdata;
    print(baseUrl);
    bool _result = await SharedService.isLoggeIn();
    if (_result) {
      user = await SharedService.getDataUser();
    }

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${user!.token!}',
    };

    try {
      final response = await http.get(
          Uri.parse("https://api.porteursdevie.org/api/student/data"),
          headers: headers);
      final json = jsonDecode(response.body);
      print(baseUrl);
      if (response.statusCode == 200) {
        student = StudentData.fromJson(json);
        return student;
      }
    } on SocketException {} catch (e) {
      print(e);
    }
  }
}
