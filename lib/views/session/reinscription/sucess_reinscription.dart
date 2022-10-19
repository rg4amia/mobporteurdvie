import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/Assets.dart';
import '../../../constants/color_constants.dart';
import 'package:url_launcher/url_launcher.dart';


class SuccessReinscription extends StatefulWidget {
  SuccessReinscription({Key? key}) : super(key: key);
  @override
  _SuccessReinscriptionState createState() => _SuccessReinscriptionState();
}

class _SuccessReinscriptionState extends State<SuccessReinscription> {
 

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isApiCallProcess = false;
  final key = GlobalKey();
  String _url = "https://chat.whatsapp.com/Gw3rCuBDl7pAPxSWrCU7pH";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: Text("Test"),),
        body: 
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
              "Bravo, votre réinscription en ligne a été enregistrée avec succès.",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              "Merci de bien vouloir prendre attache avec les services de l’administration afin de procéder à votre paiement.",
              style: TextStyle(
                  fontSize: 17,
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
      ) );
  }
}
