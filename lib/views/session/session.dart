import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:get/get.dart';
import '../../../constants/Assets.dart';
import '../../constants/color_constants.dart';

class SessionPage extends StatefulWidget {
  SessionPage({Key? key}) : super(key: key);

  @override
  _SessionPageState createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isApiCallProcess = false;
  final key = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ProgressHUD(
        key: key,
        //valueColor: new AlwaysStoppedAnimation<Color>(Colors.lightGreen),
        inAsyncCall: isApiCallProcess,
        child: Form(
          key: globalFormKey,
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  child: Image.asset(
                Assets.LogoMinPng,
                height: 100,
              )),
              Align(
                alignment: Alignment.center,
                child: Text('Préinscription et Réinscription',
                    style:
                        TextStyle(fontSize: 17, color: hexToColor("#828282"))),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Text('Prochaine Session',
                    style:
                        TextStyle(fontSize: 28, color: hexToColor("#24bbf2"))),
              ),
              SizedBox(
                height: 10,
              ),
              sessionWidget(context,
                  image: "assets/images/preinscription_image.png",
                  btntitle: "Démarrer la préinscription",
                  description:
                      "Je voudrais m'inscrire à l'école Porteurs de vie.",
                  btnColor: hexToColor("#24bbf2"),
                  pushBtn: () => Get.toNamed('/session/preinscription/formulaire'),
                  pushRoute: () =>
                      Get.toNamed('/session/preinscription/formulaire')),
              SizedBox(
                height: 30,
              ),
              sessionWidget(context,
                  image: "assets/images/reinscription_image_1.png",
                  btntitle: "Démarrer la réinscription",
                  description:
                      "Je voudrais me réinscrire à l'école Porteurs de vie.",
                  btnColor: hexToColor("#d74548"),
                  pushBtn: () => Get.toNamed('/session/reinscription'),
                  pushRoute: () =>
                      Get.toNamed('/session/reinscription')),
              SizedBox(
                height: 12,
              ),
              FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 13.5),
                onPressed: () => Get.back(),
                child: Text(
                  'Retour à l\'accueil',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          )),
        ),
      ),
    ));
  }

  Widget sessionWidget(BuildContext context,
      {String? image,
      String? btntitle,
      String? description,
      Color? btnColor,
      Function? pushRoute,
      Function? pushBtn,
      }) {
    return GestureDetector(
      onTap: () {
        pushRoute!();
      },
      child: Container(
        margin: EdgeInsets.only(right: 14, left: 14),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                image!,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black26),
                      child: Text(
                        description!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: () => {
                      pushBtn!(),
                    },
                    padding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 13.5),
                    child: Text(
                      btntitle!,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                    color: btnColor,
                    textColor: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
