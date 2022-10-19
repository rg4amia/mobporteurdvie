import 'package:get/get.dart';

class changeRadioIndexController extends GetxController {
  bool checked = false;
  String valueInput = "";
  void stateCheckbox(bool val) {
    checked = val;
    update();
  }
}
