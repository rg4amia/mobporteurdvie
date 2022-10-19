import 'package:get/get.dart';
import '../../../constants/data/churchs/churchs_controller.dart';
import 'coolstep/controller/imageController.dart';
import 'formulaire_controller.dart';
import 'formulaire_provider.dart';

class FormulaireBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChurchsController>(() => ChurchsController());
    Get.lazyPut<ChurchsController>(() => ChurchsController());
    Get.lazyPut<FormulaireController>(() => FormulaireController());
    Get.lazyPut<FormulaireProvider>(() => FormulaireProvider());
    Get.lazyPut<ImageController>(() => ImageController());
  }
}
