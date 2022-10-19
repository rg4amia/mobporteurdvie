import 'package:get/get.dart';
import '../../../models/logsvertumetre.dart';
import '../../../constants/Enums.dart';
import '../../../models/vertumetre_data.dart';
import 'vertumetre_provider.dart';

class VertumetreController extends GetxController {

  VertumetreProvider _repository = VertumetreProvider();
  RxBool isLoading = false.obs;
  RxBool isLoadingHisto = false.obs;
  Map<String, dynamic> resp = {};
  VertumetreData? vertumetreData;
  VertumetreAddResponse? vertumetreAddResponse;
  LogsVertumetre? histoVertumetre;


  VertumetreController() {
    _repository = Get.find<VertumetreProvider>();
  }

  @override
  void onInit() {
    getDataVertumetre();
    logsVertumetre();
    super.onInit();
  }

  Future<VertumetreData?> getDataVertumetre() async {
    showLoading();
    vertumetreData = await _repository.getDataVertumetre();
    if (vertumetreData != null) {
      hideLoading();
      update();
      return vertumetreData;
    } else {
      print("No data recieved");
      hideLoading();
      update();
    }
    update();
  }

  Future<VertumetreAddResponse?> addVertumetre() async {
    showLoading();
    vertumetreAddResponse = await _repository.addVertumetre(resp);
    if (vertumetreAddResponse != null) {
      hideLoading();
      update();
      return vertumetreAddResponse;
    } else {
      print("No data recieved");
    }
    update();
  }

  Future<LogsVertumetre?> logsVertumetre() async {
      showLoadingHisto();
      histoVertumetre = await _repository.logsVertumetre();
      hideLoadingHisto();
      update();
    if (histoVertumetre != null) {
      return histoVertumetre;
    } else {
      print("No data recieved logs vertumetre");
    }
  }

  Future<Map<String, dynamic>> onSelectVp2(Vp2Character _vp2) async {
    //String vp2 = "{"vp_2": 1}";
    switch (_vp2) {
      case Vp2Character.un:
        resp.addAll({"vp_2": 1});
        break;
      case Vp2Character.deux:
        resp.addAll({"vp_2": 2});
        break;
      case Vp2Character.trois:
        resp.addAll({"vp_2": 3});
        break;
      case Vp2Character.quatre:
        resp.addAll({"vp_2": 4});
        break;
    }
    return resp;
  }

  Future<Map<String, dynamic>> onSelectVp1(Vp1Character _vp1) async {
    //String vp2 = "{"vp_2": 1}";
    switch (_vp1) {
      case Vp1Character.un:
        resp.addAll({"vp_1": 1});
        break;
      case Vp1Character.deux:
        resp.addAll({"vp_1": 2});
        break;
      case Vp1Character.trois:
        resp.addAll({"vp_1": 3});
        break;
      case Vp1Character.quatre:
        resp.addAll({"vp_1": 4});
        break;
    }
    return resp;
  }

  Future<Map<String, dynamic>> onSelectVp4(Vp4Character _vp) async {
    //String vp2 = "{"vp_2": 1}";
    switch (_vp) {
      case Vp4Character.un:
        resp.addAll({"vp_4": 1});
        break;
      case Vp4Character.deux:
        resp.addAll({"vp_4": 2});
        break;
      case Vp4Character.trois:
        resp.addAll({"vp_4": 3});
        break;
      case Vp4Character.quatre:
        resp.addAll({"vp_4": 4});
        break;
    }
    return resp;
  }
  Future<Map<String, dynamic>> onSelectM2(M2Character _m) async {
    //String vp2 = "{"vp_2": 1}";
    switch (_m) {
      case M2Character.un:
        resp.addAll({"m_2": 1});
        break;
      case M2Character.deux:
        resp.addAll({"m_2": 2});
        break;
      case M2Character.trois:
        resp.addAll({"m_2": 3});
        break;
      case M2Character.quatre:
        resp.addAll({"m_2": 4});
        break;
    }
    return resp;
  }

  Future<Map<String, dynamic>> onSelectM1(M1Character _m) async {
    switch (_m) {
      case M1Character.un:
        resp.addAll({"m_1": 1});
        break;
      case M1Character.deux:
        resp.addAll({"m_1": 2});
        break;
      case M1Character.trois:
        resp.addAll({"m_1": 3});
        break;
      case M1Character.quatre:
        resp.addAll({"m_1": 4});
        break;
    }
    return resp;
  }

  Future<Map<String, dynamic>> onSelectM3(M3Character _m) async {
    switch (_m) {
      case M3Character.un:
        resp.addAll({"m_3": 1});
        break;
      case M3Character.deux:
        resp.addAll({"m_3": 2});
        break;
      case M3Character.trois:
        resp.addAll({"m_3": 3});
        break;
      case M3Character.quatre:
        resp.addAll({"m_3": 4});
        break;
    }
    return resp;
  }

  Future<Map<String, dynamic>> onSelectPl(PlanCharacter _pl) async {
    switch (_pl) {
      case PlanCharacter.un:
        resp.addAll({"plan": 1});
        break;
      case PlanCharacter.deux:
        resp.addAll({"plan": 2});
        break;
      case PlanCharacter.trois:
        resp.addAll({"plan": 3});
        break;
    }
    return resp;
  }

  Future<Map<String, dynamic>> onSelectT3(Temoin3Character _t3) async {
    switch (_t3) {
      case Temoin3Character.un:
        resp.addAll({"temoin_3": 1});
        break;
      case Temoin3Character.deux:
        resp.addAll({"temoin_3": 2});
        break;
      case Temoin3Character.trois:
        resp.addAll({"temoin_3": 3});
        break;
      case Temoin3Character.quatre:
        resp.addAll({"temoin_3": 4});
        break;
      case Temoin3Character.cinq:
        resp.addAll({"temoin_3": 5});
        break;
      case Temoin3Character.six:
        resp.addAll({"temoin_3": 6});
        break;
      case Temoin3Character.sept:
        resp.addAll({"temoin_3": 7});
        break;
      case Temoin3Character.huit:
        resp.addAll({"temoin_3": 8});
        break;
      case Temoin3Character.neuf:
        resp.addAll({"temoin_3": 9});
        break;
    }
    return resp;
  }

  Future<Map<String, dynamic>> onSelectExo1(Exo1Character _exo1) async {
    switch (_exo1) {
      case Exo1Character.un:
        resp.addAll({"ex_1": 1});
        break;
      case Exo1Character.deux:
        resp.addAll({"ex_1": 2});
        break;
      case Exo1Character.trois:
        resp.addAll({"ex_1": 3});
        break;
      case Exo1Character.quatre:
        resp.addAll({"ex_1": 4});
        break;
    }
    return resp;
  }

  Future<Map<String, dynamic>> onSelectExo2(Exo2Character _exo2) async {
    switch (_exo2) {
      case Exo2Character.un:
        resp.addAll({"ex_2": 1});
        break;
      case Exo2Character.deux:
        resp.addAll({"ex_2": 2});
        break;
      case Exo2Character.trois:
        resp.addAll({"ex_2": 3});
        break;
      case Exo2Character.quatre:
        resp.addAll({"ex_2": 4});
        break;
    }
    return resp;
  }


  Future<Map<String, dynamic>> onSelectExo3(Exo3Character _exo3) async {
    switch (_exo3) {
      case Exo3Character.un:
        resp.addAll({"ex_3": 1});
        break;
      case Exo3Character.deux:
        resp.addAll({"ex_3": 2});
        break;
      case Exo3Character.trois:
        resp.addAll({"ex_3": 3});
        break;
      case Exo3Character.quatre:
        resp.addAll({"ex_3": 4});
        break;
    }
    return resp;
  }

  Future<Map<String, dynamic>> onSelectExo4(Exo4Character _exo4) async {
    switch (_exo4) {
      case Exo4Character.un:
        resp.addAll({"ex_4": 1});
        break;
      case Exo4Character.deux:
        resp.addAll({"ex_4": 2});
        break;
      case Exo4Character.trois:
        resp.addAll({"ex_4": 3});
        break;
      case Exo4Character.quatre:
        resp.addAll({"ex_4": 4});
        break;
    }
    return resp;
  }

  Future<Map<String, dynamic>> onSelectExo5(Exo5Character _exo5) async {
    switch (_exo5) {
      case Exo5Character.un:
        resp.addAll({"ex_5": 1});
        break;
      case Exo5Character.deux:
        resp.addAll({"ex_5": 2});
        break;
      case Exo5Character.trois:
        resp.addAll({"ex_5": 3});
        break;
      case Exo5Character.quatre:
        resp.addAll({"ex_5": 4});
        break;
    }
    return resp;
  }

  Future<Map<String, dynamic>> onSelectExo6(Exo6Character _exo6) async {
    switch (_exo6) {
      case Exo6Character.un:
        resp.addAll({"ex_6": 1});
        break;
      case Exo6Character.deux:
        resp.addAll({"ex_6": 2});
        break;
      case Exo6Character.trois:
        resp.addAll({"ex_6": 3});
        break;
      case Exo6Character.quatre:
        resp.addAll({"ex_6": 4});
        break;
    }
    return resp;
  }

  showLoading() {
    isLoading.toggle();
  }
  hideLoading() {
    isLoading.toggle();
  }

  showLoadingHisto() {
    isLoadingHisto.toggle();
  }
  hideLoadingHisto() {
    isLoadingHisto.toggle();
  }
}