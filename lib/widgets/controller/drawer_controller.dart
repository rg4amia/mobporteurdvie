import 'package:get/get.dart';
import '../../../models/student_data.dart';
import 'drawer_provider.dart';

class DrawerProfileController extends GetxController {
static DrawerProfileController get to => Get.find();
DrawerProfileApiClient repository = DrawerProfileApiClient();

  DrawerProfileController() {
    repository = Get.find<DrawerProfileApiClient>();
  }

  String? token;
  RxBool? isLoading = false.obs;
  StudentData? student;
  
  @override
  void onInit() {
    getStudentData();
    super.onInit();
  }

getStudentData() async {
    isLoading!.toggle();
    final result = await repository.getStudentData();
    if (result != null) {
      student = repository.student;
      isLoading!.toggle();
      update();
    } else {
      student = null;
      print("No data recieved");
    }
    update();
  }
}