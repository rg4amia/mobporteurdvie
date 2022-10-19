import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helpers/shared_service.dart';
import '../../models/UserResponse.dart';
import '../../views/dashboard/dashboard.dart';
import '../../views/dashboard/dashboard_binding.dart';
import 'login_provider.dart';

class LoginController extends GetxController {
  LoginsProvider _repository = LoginsProvider();
  LoginController() {
    _repository = Get.find<LoginsProvider>();
  }
  late UserResponse userResponse;
  RxBool? isLoading = false.obs;
  bool? verif = false;
  String? token;

  getLogin(email, password) async {
    isLoading!.toggle();
    final result = await _repository.login(email, password);
    if (result != null) {
      userResponse = result;
      await SharedService.setDataUser(userResponse);
      verif = await SharedService.isLoggeIn();
      if (verif!) {
        isLoading!.toggle();
        Get.offAll(() => DashboardPage(),
            routeName: '/dashboard',
            binding: DashboardBinding(),
            arguments: {'username': userResponse.name!});
      }
      update();
    } else {
      isLoading!.toggle();
      Get.snackbar('Connexion', "Verifier vos paramettres de connexion",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
      update();
    }
    update();
  }

  showLoading() {
    isLoading!.toggle();
  }

  hideLoading() {
    isLoading!.toggle();
  }
}
