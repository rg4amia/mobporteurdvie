import 'package:get/get.dart';
import 'module_cours_controller.dart';
import 'module_cours_provider.dart';

class ModuleCoursBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModuleCoursController>(() => ModuleCoursController());
    Get.lazyPut<CoursModulesProvider>(() => CoursModulesProvider());
  }
}