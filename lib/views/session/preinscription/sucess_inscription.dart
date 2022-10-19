import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/Assets.dart';
import '../../../constants/color_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'coolstep/controller/coolstep_controller.dart';
import 'formulaire_controller.dart';

class SuccessInscription extends StatefulWidget {
  SuccessInscription({Key? key}) : super(key: key);
  @override
  _SuccessInscriptionState createState() => _SuccessInscriptionState();
}

class _SuccessInscriptionState extends State<SuccessInscription> {
  FormulaireController controller = Get.find();
  CoolStepController c = Get.put(CoolStepController());

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isApiCallProcess = false;
  final key = GlobalKey();
  String _url = "https://chat.whatsapp.com/Gw3rCuBDl7pAPxSWrCU7pH";

  @override
  void initState() {
    controller.reinscription();
    Get.reset();
    super.initState();
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: Text("Test"),),
        body: Obx(() {
      return controller.isLoading.isTrue
          ? Center(
        child: CircularProgressIndicator(),
      ) :
      controller.inscriptionResponse!.status == 1 ?
      Container(
        padding: EdgeInsets.only(top: 100, left: 20, right: 20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage(Assets.Completed),
            ),
            Text(
              "Bravo, votre demande a été enregistrée avec succès ...",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              "Vous serez contactée bientôt (sms, mail, appels) pour la programmation, et le déroulement de votre entretien.",
              style: TextStyle(
                  fontSize: 16,
                  color: hexToColor("#7f7f7f"),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            TextButton(
                onPressed: () => {launchURL(_url)},
                child: Text(
                  "Cliquez pour intégrer le groupe whatsapp",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
            Text(
              "Si vous n'arrivez pas à intégrer le groupe whatsapp contactez-nous au (+225) 07 490 896 78 (whattsapp)",
              style: TextStyle(
                  fontSize: 16,
                  color: hexToColor("#7f7f7f"),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Porteurs de vie vous remercie",
              style: TextStyle(
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            TextButton(
                onPressed: () => { Get.toNamed('/')},
                child: Text(
                  "Accueil",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      ) : Container(
        padding: EdgeInsets.only(top: 100, left: 20, right: 20),
        alignment: Alignment.center,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage(Assets.Error),
            ),
            SizedBox(height: 20,),
            Text(
              controller.inscriptionResponse!.flash!,
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      )
      ;}));


 /*
        GetBuilder<FormulaireController>(
            // specify type as Controller
            init: FormulaireController(),
            builder: (controller) {
              return LoadingOverlay(
                  isLoading: controller.isLoading.isTrue,
                  child: Container(
                    padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: AssetImage(Assets.Completed),
                        ),
                        Text(
                          "Bravo, votre demande a été enregistrée avec succès ...",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Vous serez contactée bientôt (sms, mail, appels) pour la programmation, et le déroulement de votre entretien.",
                          style: TextStyle(
                              fontSize: 16,
                              color: hexToColor("#7f7f7f"),
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        TextButton(
                            onPressed: () => {launchURL(_url)},
                            child: Text(
                              "Cliquez pour intégrer le groupe whatsapp",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )),
                        Text(
                          "Si vous n'arrivez pas à intégrer le groupe whatsapp contactez-nous au (+225) 07 490 896 78 (whattsapp)",
                          style: TextStyle(
                              fontSize: 16,
                              color: hexToColor("#7f7f7f"),
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Porteurs de vie vous remercie",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ));
            }));*/
  }
}
