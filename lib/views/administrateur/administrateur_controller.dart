import 'package:get/get.dart';
import 'administrateur_provider.dart';
import 'package:flutter/material.dart';
import '../../models/student_data.dart';
import '../../models/UserResponse.dart';
import '../../models/paiement_send.dart';
import '../../models/detailStudent.dart';
import '../../models/updateinfoperso.dart';
import '../../models/updateinfospirituel.dart';

class AdministrateurDetailController extends GetxController {

  AdministrateurDetailProvider _repository = AdministrateurDetailProvider();

  AdministrateurDetailController() {
    _repository = Get.find<AdministrateurDetailProvider>();
  }

  RxBool isLoading = false.obs;
  RxBool isLoadUpdate = false.obs;
  RxBool isLoadUpdateSpi = false.obs;
  UserResponse? user;
  StudentData? student;
  DetailStudent? detailStudent;
  StartBillingResponse? startBillingResponse;
  UpdateInfoPersonResponse? updateInfoPersonResponse;
  UpdateInfoSpirituelResponse? updateInfoSpirituelResponse;

  String? reglementTotal = "";
  String? reste = "";

  @override
  void onInit() {
    getStudentDetailData();
    super.onInit();
  }

  setReglementTotalReste(String regltotal,String rst){
    reglementTotal = regltotal;
    reste = rst;
  }

  DateTime selectedDate = DateTime.now();

  Future<StartBillingResponse?> cinetpayToBd(Map<String, dynamic> pay) async {
    startBillingResponse = await _repository.startBillingCinetPay(pay);
    if(startBillingResponse != null){
      print(startBillingResponse!.toJson());
      return startBillingResponse;
    } else {
      print("No data recieved : cinetpayToBd");
      startBillingResponse = null;
      return startBillingResponse;
    }
  }

  Future<UpdateInfoPersonResponse?> UpdateInfoPerson(Map<String, dynamic> resp) async {
    isLoadUpdate.toggle();
    updateInfoPersonResponse = await _repository.UpdateInfoPerson(resp);
    if (updateInfoPersonResponse != null) {
      await getStudentDetailData();
      isLoadUpdate.toggle();
      update();
    } else {
      print("No data recieved UpdateInfoPerson");
      isLoadUpdate.toggle();
      update();
    }
    return updateInfoPersonResponse;
  }

  Future<UpdateInfoSpirituelResponse?> UpdateInfoSpirituel(Map<String, dynamic> resp) async {
    isLoadUpdateSpi.toggle();
    updateInfoSpirituelResponse = await _repository.UpdateInfoSpirituel(resp);
    isLoadUpdateSpi.toggle();
    if (updateInfoSpirituelResponse != null) {
      await getStudentDetailData();
      return updateInfoSpirituelResponse;
    } else {
      print("No data recieved");
    }
    update();
  }

  Future<DetailStudent?> getStudentDetailData() async {
      showLoading();
      final result = await _repository.getStudentDetailData();
      hideLoading();
      update();
      if (result != null) {
        detailStudent = _repository.detailStudent;
        update();
        return detailStudent;
      } else {
        detailStudent = null;
        update();
        print("No data recieved getStudentDetailData");
      }
  }

  showLoading() {
    isLoading.toggle();
    update();
  }
  hideLoading() {
    isLoading.toggle();
    update();
  }

  String dateBaptemeImmersion = "";

  void selectDatebaptemeimmersion(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        locale: const Locale("fr", "FR"),
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime(2025),
        initialDate: selectedDate,
        helpText: 'Date de Naissance',
        cancelText: 'Sortie',
        confirmText: 'Ok');

    if (picked != null && picked != selectedDate) {
      DateTime currentTime = new DateTime(picked.year, picked.month, picked.day);
      dateBaptemeImmersion = currentTime.toString().substring(0, 10);
     update();
    }
    update();
  }

  bool enableYearPL = false;
  bool modeEditParlerLangues = false;
  int? selectedParlerLanguesIndex;

  void changeParlerLanguesIndex(int index) {
    modeEditParlerLangues = true;
    selectedParlerLanguesIndex = index;
    update();
    if (index == 0) {
      enableYearPL = true;
     // resp.addAll({'in_lang' : '1'});
      update();
    } else {
      enableYearPL = false;
     // resp.addAll({'in_lang' : '0'});
      //registerStudent.inlangdate = "";
      update();
    }
    //registerStudent.inlang = index;

  }

  bool enableMActifs = false;
  bool modeEditMActifs= false;
  int? selectedMembreActifsIndex;

  void changeMembreActifsIndex(int index) {
    selectedMembreActifsIndex = index;
    modeEditMActifs = true;
    if (index == 0) {
      enableMActifs = true;
      //resp.addAll({'actif' : '1'});
    } else {
      enableMActifs = false;
      //registerStudent.actifdepartement = "";
     // resp.addAll({'actif' : '0'});
    }
    //registerStudent.actif = index;
    update();
  }

  bool enablePersChrist = false;
  bool modeEditiPersChrist = false;

  int? selectedPersonneChristIndex;
  void changePersonneChristIndex(int index) {
    modeEditiPersChrist = true;
    selectedPersonneChristIndex = index;
    if (index == 0) {
      enablePersChrist = true;
      //resp.addAll({'convertis' : '1'});
    } else {
      enablePersChrist = false;
      //resp.addAll({'convertis' : '0'});
    }
    //registerStudent.convertis = index;
    update();
  }

  bool enableDonsTalents = false;
  bool modeEditDonsTalents = false;

  int? selectedDonsTalentsIndex;
  void changeDonsTalentsIndex(int index) {
    modeEditDonsTalents = true;
    selectedDonsTalentsIndex = index;
    if (index == 0) {
      enableDonsTalents = true;
      //resp.addAll({'don':'1'});
      update();
    } else {
      enableDonsTalents = false;
      //registerStudent.donv = "";
      //resp.addAll({'don':'0'});
      update();
    }
    //registerStudent.don = index;
    update();
  }

}