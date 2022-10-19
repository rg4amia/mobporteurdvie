import 'package:get/get.dart';
import '../../views/login/login_controller.dart';
import 'dashboard_controller.dart';
import 'dashboard_provider.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<DashboardProvider>(() => DashboardProvider());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
