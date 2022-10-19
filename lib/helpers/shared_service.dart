import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/UserResponse.dart';

class SharedService {
  static Future<bool> isLoggeIn() async {
    final prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('user');

    if (userPref == null) {
      return false;
    } else {
      var userMap = jsonDecode(prefs.getString('user')!);
      var user = UserResponse.fromJson(userMap);
      return user.token != null ? true : false;
    }
  }

  static void clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    print(prefs.clear());
  }

  // ignore: missing_return
  static Future<UserResponse> setDataUser(UserResponse userData) async {
    //clear();
    final UserResponse user = UserResponse.fromJson(userData.toJson());
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = await prefs.setString('user', jsonEncode(user));
    return getDataUser();
  }

  static Future<UserResponse> getDataUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userMap = jsonDecode(prefs.getString('user')!);
    UserResponse user = UserResponse.fromJson(userMap);
    return user;
  }
}
