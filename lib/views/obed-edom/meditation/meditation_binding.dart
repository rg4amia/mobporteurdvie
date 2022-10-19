import 'package:get/get.dart';
import 'meditation_controller.dart';
import 'meditation_provider.dart';

class MeditationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MeditationController>(() => MeditationController());
    Get.lazyPut<MeditationProvider>(() => MeditationProvider());
  }
}