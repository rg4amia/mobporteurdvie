import 'package:get/get.dart';

import 'churchs_controller.dart';

class ChurchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChurchsController>(() => ChurchsController());
  }
}
