import 'package:get/get.dart';
import '../../../helpers/shared_service.dart';
import '../../../models/UserResponse.dart';
import '../../../models/campus.dart';
import '../../../models/school.dart';
import '../../../models/student_data.dart';
import '../../../models/studentcoursshowdata.dart';
import 'dashboard_provider.dart';

class DashboardController extends GetxController {
  DashboardProvider _repository = DashboardProvider();

  DashboardController() {
    _repository = Get.find<DashboardProvider>();
  }

  List<Cours>? coursList = [];
  StudentData? student;
  String? token;
  UserResponse? user;
  Campus? campus;
  School? school;
  RxBool? isLoading = false.obs;

  @override
  void onInit() {
    getStudentData();
    super.onInit();
  }

  getStudentData() async {
    isLoading!.toggle();
    bool _result = await SharedService.isLoggeIn();
    if (_result) {
      user = await SharedService.getDataUser();
      update();
    }
    final result = await _repository.getStudentData();
    if (result != null) {
      student = _repository.student!;
      isLoading!.toggle();
      update();
    } else {
      print("No data recieved getStudentData");
      student = null;
      isLoading!.toggle();
      update();
    }
    update();
  }
}
