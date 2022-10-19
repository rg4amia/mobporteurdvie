import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import '../../../models/modules.dart';
import '../../../models/responses.dart';
import '../../../helpers/base_url.dart';
import '../../../models/UserResponse.dart';
import '../../../helpers/shared_service.dart';
import '../../../models/data_add_response.dart';
import '../../../models/studentcoursshowdata.dart';
import '../../../models/getbyschoolfromstudent.dart';
import '../../../models/response_add_update_resume.dart';
import 'package:http/http.dart' as http;


class CoursModulesProvider extends GetConnect {
  late UserResponse user;
  List<Responses> listResponses = [];

  getCourseByID(int id) async {
    String baseUrl = BaseURL.host + BaseURL.getstudentcoursshowdata(id);

  
    user = await SharedService.getDataUser();


    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${user.token}',
    };

    try {
      final response = await http.get(Uri.parse(baseUrl), headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        //print(response.body);
        Studentcoursshowdata studentcoursshowdata =
        Studentcoursshowdata.fromJson(json);
        return studentcoursshowdata;
      }
    } on SocketException {} catch (e) {}
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
      'Authorization': 'Bearer ${user.token}',
    };

    try {
      final response = await http.get(Uri.parse(baseUrl), headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
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
      'Authorization': 'Bearer ${user.token}',
    };

    try {
      final response = await http.post(Uri.parse(baseUrl),
          headers: headers, body: jsonEncode(data));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
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
      'Authorization': 'Bearer ${user.token}',
    };

    try {
      final response = await http.post(Uri.parse(baseUrl),
          headers: headers, body: jsonEncode(resp));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        DataAddResponse dataAddResponse = DataAddResponse.fromJson(json);
        return dataAddResponse;
      }
    } on SocketException {} catch (e) {}
  }

  renvoiTousModules() async {

    user = await SharedService.getDataUser();
    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${user.token}',
    };

    try {
      final response = await http.get(Uri.parse(BaseURL.host + BaseURL.moduledata), headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        List<Modules> modules = json['modules'].map<Modules>((map) {
          return Modules.fromJson(map);
        }).toList();
        return modules;
      }
    } on SocketException {} catch (e) {
      print(e);
    }
  }

  getSchoolFromStudent(int id) async {
    String baseUrl = BaseURL.host + BaseURL.getbyschoolfromstudent(id);
    bool _result = await SharedService.isLoggeIn();
    if (_result) {
      user = await SharedService.getDataUser();
    }

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${user.token}',
    };

    try {
      final response = await http.get(Uri.parse(baseUrl), headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        Getbyschoolfromstudent getbyschoolfromstudent = Getbyschoolfromstudent.fromJson(json);
        return getbyschoolfromstudent;
      }
    } on SocketException {} catch (e) {}
  }
}