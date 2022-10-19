import 'package:get/get.dart';
import 'cours_id_show_controller.dart';
import 'cours_id_show_provider.dart';

class CoursIdShowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoursIdShowController>(() => CoursIdShowController());
    Get.lazyPut<CoursIdShowRepository>(() => CoursIdShowRepository());
  }
}