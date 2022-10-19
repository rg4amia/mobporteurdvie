import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/color_constants.dart';
import '../../../widgets/components/password.dart';
import 'reinscription_controller.dart';
import 'package:get/get.dart';

class Reinscription extends StatelessWidget {
  Reinscription({Key? key}) : super(key: key);

  String? _password;
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  TextEditingController numeroetudiant = new TextEditingController();
  TextEditingController motdepasse = new TextEditingController();

  final controller = Get.put(ReinscriptionController());

  var height, width, size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SafeArea(
        child: Scaffold(
            backgroundColor: hexToColor("#008bb2"),
            body: Obx(() {
              return Center(
                  child: Container(
                      padding: EdgeInsets.only(top: 20),
                      margin: EdgeInsets.only(right: 5, left: 5),
                      height: size.height - 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/water.png"),
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.6), BlendMode.dstATop),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.only(bottom: 20),
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Icon(
                                FontAwesomeIcons.graduationCap,
                                size: 140,
                                color: hexToColor("#008bb2"),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(15),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 25),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]!))),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: "Numéro étudiant *",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                          suffixIcon: Icon(
                                            FontAwesomeIcons.graduationCap,
                                            color: hexToColor("#008bb2"),
                                          )),
                                      controller: numeroetudiant,
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(left: 25),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]!))),
                                      child: PasswordField(
                                        fieldKey: _passwordFieldKey,
                                        colorIcon: hexToColor("#008bb2"),
                                        labelText: 'Mot de passe *',
                                        controller: motdepasse,
                                        onFieldSubmitted: (String value) {
                                          this._password = value;
                                        },
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(right: 10, left: 6, top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  MaterialButton(
                                    minWidth: 150.0,
                                    height: 45,
                                    color: Colors.red,
                                    child: Text(
                                      "Retour",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  MaterialButton(
                                    minWidth: 150.0,
                                    height: 45,
                                    color: Colors.green,
                                    child: controller.isLoading.isTrue
                                        ? CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : Text(
                                            "Connexion",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                    onPressed: () {
                                      controller.reinscriptionLogin(
                                          numeroetudiant.text, motdepasse.text);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            controller.responseReinscription != null
                                ? controller.responseReinscription!.status ==
                                        "failed"
                                    ? Container(
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.all(10),
                                        //color: hexToColor("#F3C7C8"),
                                        decoration: BoxDecoration(
                                          color: hexToColor("#F3C7C8"),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          controller
                                              .responseReinscription!.message!,
                                          style: TextStyle(
                                              fontSize: 13.6,
                                              color: Colors.red),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    : SizedBox()
                                : SizedBox()
                          ],
                        ),
                      )));
            })));
  }
}
