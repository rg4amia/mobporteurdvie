import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../helpers/base_url.dart';

class ApiRequest {
  final String? url;
  var data;
  final String? token;

  ApiRequest({@required this.url, this.data, this.token});

  Dio _dio() {
    // Put your authorization token here
    return Dio(BaseOptions(baseUrl: BaseURL.host, headers: {
      'Authorization': 'Bearer $token',
    }));
  }

  void get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    _dio()
        .get(
      this.url!,
      queryParameters: this.data,
    )
        .then((res) {
      if (onSuccess != null) onSuccess(res.data);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }

  void post({
    Function()? beforeSend,
    String? token,
    //Map<String,dynamic> request,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    _dio()
        .post(this.url!,
            queryParameters: this.data,
            options: Options(
                contentType: "application/json",
                headers: {"Authorization": "Bearer $token"}))
        .then((res) {
      if (onSuccess != null) onSuccess(res.data);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }
}
