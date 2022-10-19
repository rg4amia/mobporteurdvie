import 'package:get/get.dart';
import 'reinscription_controller.dart';
import 'reinscription_provider.dart';

class ReinscriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReinscriptionController>(() => ReinscriptionController());
    Get.lazyPut<ReinscriptionProvider>(() => ReinscriptionProvider());
  }
}
