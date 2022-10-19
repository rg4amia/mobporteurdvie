import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../helpers/base_url.dart';
import '../../models/student_data.dart';
import '../../models/UserResponse.dart';
import '../../models/detailStudent.dart';
import '../../models/paiement_send.dart';
import '../../models/updateinfoperso.dart';
import '../../helpers/shared_service.dart';
import '../../models/updateinfospirituel.dart';

class AdministrateurDetailProvider extends GetConnect {
  late UserResponse user;
  StudentData? student;
  DetailStudent? detailStudent;
  StartBillingResponse? startBillingResponse;
  UpdateInfoPersonResponse? updateInfoPersonResponse;
  UpdateInfoSpirituelResponse? updateInfoSpirituelResponse;

  getStudentDetailData() async {
    String baseUrl = BaseURL.host + '/student/detail/data';
    user = await SharedService.getDataUser();

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${user.token!}',
    };

    try {
      final response = await http.get(Uri.parse(baseUrl), headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        detailStudent = detailStudentFromJson(response.body);
        return detailStudent;
      }
    } on SocketException {

    } catch (e) {
      print(e);
    }
  }

  Future<UpdateInfoPersonResponse?> UpdateInfoPerson(Map<String, dynamic> resp) async {

    String baseUrl = BaseURL.host + "/student/infopersonnel/update";
    user = await SharedService.getDataUser();

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${user.token}',
    };

    try {
      final response = await http.post(Uri.parse(baseUrl), headers: headers, body: jsonEncode(resp));
      if (response.statusCode == 200) {
        updateInfoPersonResponse = UpdateInfoPersonResponseFromJson(response.body);
        return updateInfoPersonResponse;
      }
    } on SocketException {} catch (e) {
      print(e.toString());
    }
  }

  Future<UpdateInfoSpirituelResponse?> UpdateInfoSpirituel(Map<String, dynamic> resp) async {

    String baseUrl = BaseURL.host + "/student/infospirituel/update";
    user = await SharedService.getDataUser();

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${user.token}',
    };

    try {
      final response = await http.post(Uri.parse(baseUrl), headers: headers, body: jsonEncode(resp));
      print(response.body);
      if (response.statusCode == 200) {
        updateInfoSpirituelResponse = UpdateInfoSpirituelResponseFromJson(response.body);
        return updateInfoSpirituelResponse;
      }
    } on SocketException {} catch (e) {
      print(e.toString());
    }
  }

  Future<StartBillingResponse?> startBillingCinetPay(Map<String, dynamic> resp) async {

    String baseUrl = BaseURL.host + "/paiement/cinetpay";

    user = await SharedService.getDataUser();

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${user.token}',
    };

    try {
      final response = await http.post(Uri.parse(baseUrl), headers: headers, body: jsonEncode(resp));
      if (response.statusCode == 200) {
        startBillingResponse = StartBillingResponseFromJson(response.body);
        return startBillingResponse;
      }
      /* else {
        startBillingResponse = StartBillingResponseFromJson(response.body);
        return startBillingResponse;
      }*/
    } on SocketException {} catch (e) {
      print(e.toString());
    }
  }
}