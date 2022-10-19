import 'package:get/get.dart';
import '../../../models/logsmeditation.dart';
import '../../../models/meditation.dart';
import 'meditation_provider.dart';

class MeditationController extends GetxController {
  MeditationProvider _repository = MeditationProvider();

  MeditationController() {
    _repository = Get.find<MeditationProvider>();
  }

  @override
  void onInit() {
    getMeditation();
    getLogsMeditation();
    super.onInit();
  }

  Map<String, dynamic> resp = {};
  MeditationAddResponse? meditationAddResponse;
  RxBool isLoading = false.obs;
  RxBool isLoadingLogs = false.obs;
  Meditation? meditation;
  LogsMeditations? logsMeditation;

  Future<MeditationAddResponse?> addMeditation() async {
    showLoading();
    meditationAddResponse = await _repository.addMeditation(resp);
    if (meditationAddResponse != null) {
      hideLoading();
      update();
      await getMeditation();
      return meditationAddResponse;
    } else {
      print("No data recieved");
    }
    update();
  }

  Future<Meditation?> getMeditation() async {
    showLoading();
    meditation = await _repository.getDataMeditation();
    if(meditation != null){
      hideLoading();
      print(meditation!.textToMeditate);
      update();
      return meditation;
    }else{
      hideLoading();
      update();
      print('No data recieved getMeditation');
    }
    update();
  }

  Future<LogsMeditations?> getLogsMeditation() async {
    showLoadingLogs();
    logsMeditation = await _repository.getLogsMeditation();
    hideLoadingLogs();
    update();
    if (logsMeditation != null) {
      return logsMeditation;
    } else {
      print("No data recieved logs meditation");
    }
  }

  showLoadingLogs() {
    isLoadingLogs.toggle();
  }
  hideLoadingLogs() {
    isLoadingLogs.toggle();
  }

  showLoading() {
    isLoading.toggle();
  }
  hideLoading() {
    isLoading.toggle();
  }

}