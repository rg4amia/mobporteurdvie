import 'package:get/get.dart';
import 'permission_controller.dart';
import 'permission_provider.dart';

class PermissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PermissionController>(() => PermissionController());
    Get.lazyPut<PermissionProvider>(() => PermissionProvider());
  }
}