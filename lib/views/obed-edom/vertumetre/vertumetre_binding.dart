import 'package:get/get.dart';
import 'vertumetre_controller.dart';
import 'vertumetre_provider.dart';

class VertumetreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VertumetreProvider>(() => VertumetreProvider());
    Get.lazyPut<VertumetreController>(() => VertumetreController());
  }
}