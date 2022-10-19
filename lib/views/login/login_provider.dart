import 'dart:convert';
import 'dart:io';
import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;
import '../../../helpers/base_url.dart';
import '../../../models/UserResponse.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class LoginsProvider extends GetConnect {
  UserResponse? userResponse;

  login(email, password) async {
    
    var data = {
      'email': email,
      'password': password,
    };

    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      http.Response response = await http
          .post(Uri.parse(BaseURL.host + BaseURL.login),
          body: jsonEncode(data), headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        userResponse = UserResponse.fromJson(json);
        return userResponse;
      }
    } on SocketException {} catch (e) {
      print(e);
    }
  }
}