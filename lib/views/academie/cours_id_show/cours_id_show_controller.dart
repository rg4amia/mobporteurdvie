import 'package:get/get.dart';
import '../../../models/data_add_response.dart';
import '../../../models/response_add_update_resume.dart';
import '../../../models/student_data.dart';
import '../../../models/studentcoursshowdata.dart';
import 'cours_id_show_provider.dart';

class CoursIdShowController extends GetxController {
  static CoursIdShowController get to => Get.find();

  late CoursIdShowRepository _repository;
  StudentData? student;
  CoursIdShowController() {
    _repository = Get.find<CoursIdShowRepository>();
  }

  RxBool isLoading = false.obs;
  RxBool isLoading_1 = false.obs;
  RxBool isLoadadd = false.obs;
  RxBool isLoadAddResponse = false.obs;

  Studentcoursshowdata? studentcoursshowdata;
  ResponseAddUpdateResume? responseAddUpdateResume;
  DataAddResponse? dataAddResponse;

  List<Response>? Listresponse = [];

  getStudentData() async {
    isLoading.toggle();
    final result = await _repository.getStudentData();
    isLoading.toggle();
    update();
    if (result != null) {
      student = _repository.student;
      update();
    } else {
      student = result;
      print("No data recieved getStudentData");
    }
    update();
  }

  getCourseByIDFromStudent(int id) async {
    showLoading();
    final result = await _repository.getCourseByID(id);
    hideLoading();
    update();
    if (result != null) {
      studentcoursshowdata = result;
    } else {
      student = null;
      print("No data recieved getCourseByIDFromStudent");
    }
    update();
  }

  bool enableMActifs = false;
  int? selectedIndex;

  void changeRadioIndex(int index) {
    selectedIndex = index;
    if (index == 0) {
      enableMActifs = true;
    } else {
      enableMActifs = false;
    }
    print(index);
    update();
  }

  Future<List<Response>> getResponseByQuestion(int id) async {
    isLoading_1.toggle();
    final result = await _repository.getResponseByQuestion(id);
    isLoading_1.toggle();
    if (result != null) {
      Listresponse = result;
    } else {
      print("No data recieved");
    }
    return Listresponse!;
  }

  addAndUpdateResume(String resume, int cour_id) async {
    isLoadadd.toggle();
    final result = await _repository.addAndUpdateResume(resume, cour_id);
    isLoadadd.toggle();
    if (result != null) {
      responseAddUpdateResume = result;
    } else {
      print("No data recieved");
    }
  }

  addResponse(Map<String, dynamic> resp, int exo_id) async {
    isLoadAddResponse.toggle();
    final result = await _repository.addResponse(resp, exo_id);
    isLoadAddResponse.toggle();
    if (result != null) {
      dataAddResponse = result;
    } else {
      print("No data recieved");
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}