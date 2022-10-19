import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../models/logsvertumetre.dart';
import '../../../helpers/base_url.dart';
import '../../../models/UserResponse.dart';
import '../../../models/vertumetre_data.dart';
import '../../../helpers/shared_service.dart';

class VertumetreProvider extends GetConnect {
  UserResponse? user;
  VertumetreData? _vertumetreData;
  VertumetreAddResponse? _vertumetreAddResponse;
  LogsVertumetre? _logsVertumetre;

  Future<VertumetreData?> getDataVertumetre() async {
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
          Uri.parse(BaseURL.host + "/obed-edom/vertumetre/data"),
          headers: headers);

      if (response.statusCode == 200) {
        _vertumetreData = vertumetreDataFromJson(response.body);
        return _vertumetreData;
      }
    } on SocketException {} catch (e) {
      print(e);
    }
  }

  Future<VertumetreAddResponse?> addVertumetre(
      Map<String, dynamic> resp) async {
    String baseUrl = BaseURL.host + "/obed-edom/add/vertumetre";
    user = await SharedService.getDataUser();

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${user!.token}',
    };

    try {
      final response = await http.post(Uri.parse(baseUrl),
          headers: headers, body: jsonEncode(resp));

      if (response.statusCode == 200) {
        _vertumetreAddResponse = vertumetreAddResponseFromJson(response.body);
        return _vertumetreAddResponse!;
      }
    } on SocketException {} catch (e) {
      print(e.toString());
    }
  }

  Future<LogsVertumetre?> logsVertumetre() async{

    String baseUrl = BaseURL.host + "/obed-edom/logs/vertumetre";
    user = await SharedService.getDataUser();

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${user!.token}',
    };

    try {
      final response = await http.get(Uri.parse(baseUrl), headers: headers);
      
      if (response.statusCode == 200) {
        _logsVertumetre = logsVertumetreFromJson(response.body);
        return _logsVertumetre;
      }
    } on SocketException {} catch (e) {
      print(e);
    }

  }
}
