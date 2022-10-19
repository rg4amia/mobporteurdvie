import 'package:get/get.dart';

class CustomRadioController extends GetxController {
  bool enableCheck = true;
  int? selectedIndex;
  void changeIndex(int index) {
    selectedIndex = index;
    if (index == 0) {
      enableCheck = true;
    } else {
      enableCheck = false;
    }
    update();
  }
}
