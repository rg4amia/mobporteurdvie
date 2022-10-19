import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import '../../../models/UserResponse.dart';
import '../../../helpers/shared_service.dart';
import '../../../helpers/base_url.dart';
import '../../../models/permission.dart';
import 'package:http/http.dart' as http;

class PermissionProvider extends GetConnect {

  UserResponse? user;
  PermissionAddResponse? permissionAddResponse;
  List <Permission>? listPermission;

  Future<PermissionAddResponse?> addPermission(Map<String, dynamic> resp) async {
    String baseUrl = BaseURL.host + "/obed-edom/add/permission";
    user = await SharedService.getDataUser();

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${user!.token}',
    };

    try {
      final response = await http.post(Uri.parse(baseUrl),
          headers: headers, body: jsonEncode(resp));

      print(response.body);

      if (response.statusCode == 200) {
        permissionAddResponse = permissionAddResponseFromJson(response.body);
        return permissionAddResponse!;
      }
    } on SocketException {} catch (e) {
      print(e.toString());
    }
  }

  Future<List<Permission>?> getAllPermission() async {
    user = await SharedService.getDataUser();

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${user!.token}',
    };

    try {
      final response = await http.get(Uri.parse(BaseURL.host + "/obed-edom/permission/getdata"), headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        listPermission = permissionFromJson(response.body);
        return listPermission;
      }
    } on SocketException {} catch (e) {
      print(e);
    }
  }
}