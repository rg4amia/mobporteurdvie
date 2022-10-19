import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '/models/response_reinscription_add_payment.dart';
import '/views/session/reinscription/reinscription_etape_1.dart';
import '/models/response_reinscription.dart';
import '/views/session/reinscription/reinscription_provider.dart';

class ReinscriptionController extends GetxController {
  ReinscriptionProvider _repository = ReinscriptionProvider();

  ReinscriptionController() {
    _repository = Get.find<ReinscriptionProvider>();
  }

  RxBool isLoading = false.obs;
  ResponseReinscription? responseReinscription;
  ResponseReinscriptionAddPayment? responsereinscriptionAddPayment;

  File? image;
  String? imagePath;
  var imgPath;
  final _picker = ImagePicker();

  Future<void> getImage(String source) async {
    var imageSource;

    if (source == 'camera') {
      imageSource = ImageSource.camera;
    } else {
      imageSource = ImageSource.gallery;
    }

    final pickedFile = await _picker.getImage(source: imageSource);

    if (pickedFile != null) {
      imgPath = pickedFile.path;
      image = File(pickedFile.path);
      File imagePath = File(pickedFile.path);
      update();
    } else {
      print('No image selected.');
    }
  }

  Future<ResponseReinscription?> reinscriptionLogin(
      numeroetudiant, motdepass) async {
    Map<String, dynamic> data = {
      'number': numeroetudiant,
      'password': motdepass,
    };

    showLoading();
    responseReinscription = await _repository.reinscriptionLogin(data);
    hideLoading();

    if (responseReinscription != null){
         if (responseReinscription!.status == 'success') {
        Get.offAll(() => ReinscriptionEtape1(),
            routeName: '/reinscription/etape/1',
            arguments: responseReinscription);
      } else {
        print("No data recieved");
      }
    }
    update();
  }

  Future<ResponseReinscriptionAddPayment?> reinscriptionAddPaiement(
      Map<String, dynamic> resp, String token) async {
    showLoading();
    responsereinscriptionAddPayment = await _repository.reinscriptionAddPaiement(resp, token);
    if(responsereinscriptionAddPayment != null){
      hideLoading();
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
