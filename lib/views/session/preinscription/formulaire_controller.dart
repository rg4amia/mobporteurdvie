import 'package:get/get.dart';
import '../../../models/inscription_response.dart';
import 'coolstep/controller/coolstep_controller.dart';
import 'formulaire_provider.dart';

class FormulaireController extends GetxController {

  FormulaireProvider _repository = FormulaireProvider();

  FormulaireController() {
    _repository = Get.find<FormulaireProvider>();
  }

  @override
  void onInit() async { // called immediately after the widget is allocated memory
    //await reinscription(c.resp,c.image!.path);
    super.onInit();
  }

  InscriptionResponse? inscriptionResponse;
  CoolStepController c = Get.put(CoolStepController());

  bool? posted;
  Map<String, dynamic> resp = {};
  RxBool isLoading = false.obs;

  Future<InscriptionResponse?> reinscription() async {
    showLoading();
    c.resp.remove("id_photo");
    inscriptionResponse = await _repository.reinscription(c.resp, c.image!.path);
    update();
    if (inscriptionResponse != null) {
      hideLoading();
      update();
    } else {
      hideLoading();
      update();
     // print("No data recieved");
    }
  }

  showLoading() {
    isLoading.toggle();
  }
  hideLoading() {
    isLoading.toggle();
  }

}