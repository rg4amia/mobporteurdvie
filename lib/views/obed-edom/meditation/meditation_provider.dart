import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import '../../../helpers/base_url.dart';
import '../../../helpers/shared_service.dart';
import '../../../models/UserResponse.dart';
import '../../../models/logsmeditation.dart';
import '../../../models/meditation.dart';
import 'package:http/http.dart' as http;

class MeditationProvider extends GetConnect {
  Meditation? meditation;
  MeditationAddResponse? meditationAddResponse;
  UserResponse? user;

  LogsMeditations? _logsMeditation;

  Future<MeditationAddResponse?> addMeditation(Map<String, dynamic> resp) async {
    String baseUrl = BaseURL.host + "/obed-edom/add/meditation";
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
      final response = await http.post(Uri.parse(baseUrl),
          headers: headers, body: jsonEncode(resp));

      if (response.statusCode == 200) {
        meditationAddResponse = meditationAddResponseFromJson(response.body);
        return meditationAddResponse!;
      }
    } on SocketException {} catch (e) {
      print(e.toString());
    }
  }

  Future<Meditation?> getDataMeditation() async {
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
      final response = await http.get(
          Uri.parse(BaseURL.host + "/obed-edom/meditation/data"),
          headers: headers);
      if (response.statusCode == 200) {
        meditation = meditationFromJson(response.body);
        return meditation;
      }
    } on SocketException {} catch (e) {
      print(e);
    }
  }

  Future<LogsMeditations?> getLogsMeditation() async  {

    String baseUrl = BaseURL.host + "/obed-edom/logs/meditation";
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
      final response = await http.get(
          Uri.parse(baseUrl),
          headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        _logsMeditation = logsMeditationsFromJson(response.body);
        return _logsMeditation;
      }
    } on SocketException {} catch (e) {
      print(e);
    }
  }
}