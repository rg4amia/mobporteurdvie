import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../../../models/student_data.dart';
import '../../../helpers/base_url.dart';
import '../../../helpers/shared_service.dart';
import '../../../models/getbyschoolfromstudent.dart';

class ModuleCoursShowRepository extends GetConnect {
  StudentData? student;
  var user;
  Getbyschoolfromstudent? getbyschoolfromstudent;

  getStudentData() async {
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
      final response = await http
          .get(Uri.parse(BaseURL.host + BaseURL.studentdata), headers: headers);
      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        student = StudentData.fromJson(json);
        return student;
      }
    } on SocketException {} catch (e) {
      print(e);
    }
  }

  getSchoolFromStudent(int id) async {
    String baseUrl = BaseURL.host + BaseURL.getbyschoolfromstudent(id);
    user = await SharedService.getDataUser();

    print("test: " + id.toString());
    print("user: " + user.toString());

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${user.token}',
    };

    final response = await http.get(Uri.parse(baseUrl), headers: headers);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(response.body);
      getbyschoolfromstudent = Getbyschoolfromstudent.fromJson(json);
      // print(getbyschoolfromstudent);
    }
    return getbyschoolfromstudent;

    /* try {
      
    } on SocketException {

    } catch (e) {
      print(e);
    } */
  }
}
