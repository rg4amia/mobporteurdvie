import 'package:get/get.dart';
import '../../../models/data_add_response.dart';
import '../../../models/getbyschoolfromstudent.dart';
import '../../../models/modules.dart';
import '../../../models/response_add_update_resume.dart';
import '../../../models/responses.dart';
import '../../../models/studentcoursshowdata.dart';
import 'module_cours_provider.dart';

class ModuleCoursController extends GetxController {

  static ModuleCoursController get to => Get.find();

  late CoursModulesProvider _modulesApiClient;

  ModuleCoursController() {
    _modulesApiClient = Get.find<CoursModulesProvider>();
  }

  RxBool isLoading = false.obs;
  RxBool isLoading_1 = false.obs;
  RxBool isLoadadd = false.obs;
  RxBool isLoadAddResponse = false.obs;

  Studentcoursshowdata? studentcoursshowdata;
  ResponseAddUpdateResume? responseAddUpdateResume;
  DataAddResponse? dataAddResponse;
  List<Responses>? Listresponse = [];
  List<Modules> modules = [];
  Getbyschoolfromstudent? getbyschoolfromstuden;

  @override
  void onInit() {
    chargeRenvoiTousModules();
    super.onInit();
  }

  chargeRenvoiTousModules() async {
    showLoading();
    final result = await _modulesApiClient.renvoiTousModules();
    hideLoading();
    update();
    if (result != null) {
      modules = result;
    } else {
      modules = result;
      print("No data recieved");
    }
  }

  getCourseByIDFromStudent(int id) async {
    showLoading();
    final result = await _modulesApiClient.getCourseByID(id);
    hideLoading();
    if (result != null) {
      studentcoursshowdata = result;
    } else {
      studentcoursshowdata = result;
      print("No data recieved");
    }
  }

  Future<List<Responses>> getResponseByQuestion(int id) async {
    isLoading_1.toggle();
    final result = await _modulesApiClient.getResponseByQuestion(id);
    isLoading_1.toggle();
    if (result != null) {
      Listresponse = result;
    } else {
      Listresponse = result;
      print("No data recieved");
    }
    return Listresponse!;
  }

  addAndUpdateResume(String resume, int cour_id) async {
    isLoadadd.toggle();
    final result = await _modulesApiClient.addAndUpdateResume(resume, cour_id);
    isLoadadd.toggle();
    if (result != null) {
      responseAddUpdateResume = result;
    } else {
      responseAddUpdateResume = result;
      print("No data recieved");
    }
  }

  addResponse(Map<String, dynamic> resp, int exo_id) async {
    isLoadAddResponse.toggle();
    final result = await _modulesApiClient.addResponse(resp, exo_id);
    isLoadAddResponse.toggle();
    if (result != null) {
      dataAddResponse = result;
    } else {
      print("No data recieved");
    }
  }

  getSchoolFromStudent(int id) async {
    showLoading();
    final result = await _modulesApiClient.getSchoolFromStudent(id);
    hideLoading();
    if (result != null) {
      getbyschoolfromstuden = result;
    } else {
      getbyschoolfromstuden = result;
      print("No data recieved getSchoolFromStudent");
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