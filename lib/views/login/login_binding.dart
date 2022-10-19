import 'package:get/get.dart';
import '../../../views/dashboard/dashboard_controller.dart';
import 'login_controller.dart';
import 'login_provider.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginsProvider>(() => LoginsProvider());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
