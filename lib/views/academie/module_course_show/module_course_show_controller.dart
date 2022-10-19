import 'package:get/get.dart';
import '../../../models/student_data.dart';
import 'module_course_show_provider.dart';

class ModuleCoursShowController extends GetxController {
  static ModuleCoursShowController get to => Get.find();

  ModuleCoursShowRepository _repository = ModuleCoursShowRepository();
  StudentData? student;

  ModuleCoursController() {
    _repository = Get.find<ModuleCoursShowRepository>();
  }

  @override
  void onInit() {
    //getSchoolFromStudent(id);
    super.onInit();
  }

  RxBool isLoading = false.obs;

  var getbyschoolfromstudent;

  getSchoolFromStudent(int id) async {
    showLoading();
    var result = await _repository.getSchoolFromStudent(id);
    hideLoading();
    if (result != null) {
       getbyschoolfromstudent = result;
    } else {
      print("No data recieved getSchoolFromStudent");
      getbyschoolfromstudent = result;
    }
    update();
  }

  getStudentData() async {
    isLoading.toggle();
    final result = await _repository.getStudentData();
    isLoading.toggle();
    if (result != null) {
      student = _repository.student;
      update();
    } else {
      print("No data recieved");
    }
    update();
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
