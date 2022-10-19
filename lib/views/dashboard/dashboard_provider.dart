import 'dart:convert';
import 'dart:io';
import '../../../helpers/base_url.dart';
import '../../../helpers/shared_service.dart';
import '../../../models/UserResponse.dart';
import '../../../models/student_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DashboardProvider extends GetConnect {
  late UserResponse user;
  StudentData? student;

  getStudentData() async {
    String baseUrl = BaseURL.host + BaseURL.studentdata;
    user = await SharedService.getDataUser();

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${user.token!}',
    };

    try {
      final response = await http.get(Uri.parse(baseUrl), headers: headers);
      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        student = StudentData.fromJson(json);
        return student;
      }
    } on SocketException {
      print('pas de connexion internet');
    } catch (e) {
      print(e.toString());
    }
  }
}
