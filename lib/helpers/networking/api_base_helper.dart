import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_exceptions.dart';
import 'dart:async';

class ApiBaseHelper {
  final String _baseUrl = "http://10.0.2.2:8000/api";
  ApiBaseHelper();

  Future<dynamic> get(String url, {String? token}) async {
    var responseJson;

    var tokenHeader = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };

    final response;

    try {
      if (token != null) {
         response =
            await http.get(Uri.parse(_baseUrl + url), headers: headers);
      } else {
         response =
            await http.get(Uri.parse(_baseUrl + url), headers: tokenHeader);
      }

      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body, {String? token}) async {
    var responseJson;
    try {
      final response = await http.post(Uri.parse(_baseUrl + url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api post.');
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body, {String? token}) async {
    var responseJson;
    try {
      final response = await http.put(Uri.parse(_baseUrl + url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api put.');
    print(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> delete(String url, {String? token}) async {
    var apiResponse;
    try {
      final response = await http.delete(Uri.parse(_baseUrl + url));
      apiResponse = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api delete.');
    return apiResponse;
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      print(responseJson);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
