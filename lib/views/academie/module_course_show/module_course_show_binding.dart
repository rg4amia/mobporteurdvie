import 'package:get/get.dart';
import 'module_course_show_controller.dart';
import 'module_course_show_provider.dart';

class ModuleCoursShowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModuleCoursShowController>(() => ModuleCoursShowController());
    Get.lazyPut<ModuleCoursShowRepository>(() => ModuleCoursShowRepository());
  }
}