import 'package:flutter/material.dart';
import '../../../constants/color_constants.dart';
import '../../../models/logsmeditation.dart';

class LogsMeditation extends StatelessWidget {
  LogsMeditation({Key? key, this.meditation,this.txt}) : super(key: key);
  ReponseMeditations? meditation;
  String? txt;
  final _formKey = GlobalKey<FormState>();

  TextEditingController textToMeditate = TextEditingController();
  TextEditingController meditation_text = TextEditingController();
  TextEditingController revelation = TextEditingController();
  TextEditingController action = TextEditingController();
  TextEditingController priere = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ///print('test'+ meditation!.textToMeditate!);
    textToMeditate.text   =   (meditation == null) ? "": meditation!.textToMeditate!;
    meditation_text.text  =   (meditation == null) ? "":  meditation!.meditation!;
    revelation.text =    (meditation == null) ? "": meditation!.revelation!;
    action.text = (meditation == null) ? "": meditation!.action!;
    priere.text = (meditation == null) ? "":   meditation!.priere!;
    return Scaffold(
        appBar: AppBar(
          title: Text(txt!),
          backgroundColor: hexToColor("#008bb2"),
        ),
        body: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(20),
            height: double.infinity,
            child: Form(
                key: _formKey,
                child: ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: <Widget>[
                      Text(
                        "Méditation de la Parole de Dieu",
                        style:
                            TextStyle(color: Colors.deepOrange, fontSize: 18),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Verset à Mediter (Ecrire le ou les versets en entier):",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 9,
                        maxLength: 2000,
                        readOnly: true,
                        controller: textToMeditate,
                        onChanged: (val) {},
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez saisir un texte';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Verset à Mediter (Ecrire le ou les versets en entier):",
                            hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    new Radius.circular(15.0))),
                            labelStyle: TextStyle(color: Colors.white)),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Observation Interpretation et commentaires :",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 9,
                        controller: meditation_text,
                        readOnly: true,
                        maxLength: 2000,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez saisir un texte';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText:
                                "Observation Interpretation et commentaires :",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    new Radius.circular(15.0))),
                            labelStyle: TextStyle(color: Colors.white)),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Rhéma reçu :",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 9,
                        maxLength: 2000,
                        controller: revelation,
                        readOnly: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez saisir un texte';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Rhéma reçu :",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    new Radius.circular(15.0))),
                            labelStyle: TextStyle(color: Colors.white)),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Action du jour à mener :",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 9,
                        maxLength: 2000,
                        controller: action,
                        readOnly: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez saisir un texte';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Action du jour à mener :",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    new Radius.circular(15.0))),
                            labelStyle: TextStyle(color: Colors.white)),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Ma prière :",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 9,
                        maxLength: 2000,
                        controller: priere,
                        readOnly: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez saisir un texte';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Action du jour à mener :",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    new Radius.circular(15.0))),
                            labelStyle: TextStyle(color: Colors.white)),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      Divider(),
                    ]
                )
            )
        )
    );
  }
}
