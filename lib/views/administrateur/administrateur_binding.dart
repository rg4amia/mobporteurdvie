import 'package:get/get.dart';
import 'administrateur_controller.dart';
import 'administrateur_provider.dart';

class AdministrateurDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdministrateurDetailController>(() => AdministrateurDetailController());
    Get.lazyPut<AdministrateurDetailProvider>(() => AdministrateurDetailProvider());
  }
}
