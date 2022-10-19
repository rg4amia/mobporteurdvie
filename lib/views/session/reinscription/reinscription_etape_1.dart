import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import '/views/session/reinscription/reinscription%20_etape_2.dart';
import '/constants/color_constants.dart';
import '/models/post_reinscription.dart';
import '/models/drop_list_model.dart';
import '/models/response_reinscription.dart';
import '/widgets/components/InputTextField.dart';
import '/widgets/components/select_drop_list.dart';
import '/constants/data/form/choices.dart' as choices;
import 'reinscription_bindinng.dart';
import 'reinscription_controller.dart';

class ReinscriptionEtape1 extends StatefulWidget {
  const ReinscriptionEtape1({Key? key}) : super(key: key);

  @override
  State<ReinscriptionEtape1> createState() => _ReinscriptionEtape1State();
}

class _ReinscriptionEtape1State extends State<ReinscriptionEtape1> {
  ResponseReinscription? responseReinscription = Get.arguments;

  PostReinscription? request = PostReinscription();

  final _formKey = GlobalKey<FormState>();

  final controller = Get.put(ReinscriptionController());

  OptionItem optionItemSelected =
      OptionItem(id: null, title: "Selectionner Sexe");

  OptionItem optionCampusSelected =
      OptionItem(id: null, title: "Selectionner Campus");

  OptionItem optionItemSituationMSelected =
      OptionItem(id: null, title: "Selectionner Situation Ma.");

  OptionItem optionItemCiviliteSelected =
      OptionItem(id: null, title: "Selectionner Civilité");

  OptionItem optionItemTshirtSelected =
      OptionItem(id: null, title: "Selectionner Taille T-shirt");

  OptionItem optionItemBaptiseEspritSelected =
      OptionItem(id: null, title: "Selectionner Baptisé(e) du Saint Esprit");

  OptionItem optionItemFrequencePriereSelected =
      OptionItem(id: null, title: "Selectionner Baptisé(e) du Saint Esprit");

  OptionItem optionSituationProfessionnelleSelected =
      OptionItem(id: null, title: "Selectionner Situation Professionnelle");

  OptionItem optionListNiveauHonneurSelected =
      OptionItem(id: null, title: "Selectionner Niveau academie d'honneur");

  @override
  void initState() {
    print(responseReinscription!.toJson());
    super.initState();
  }

  var height, width, size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    // String token = responseReinscription!.token!;

    request!.nextS = responseReinscription!.nextS.toString();
    request!.habitation = responseReinscription!.student!.location;
    request!.facebook = responseReinscription!.student!.facebook;
    request!.contact1 = responseReinscription!.student!.primaryPhoneV;
    request!.contact2 = responseReinscription!.student!.secondaryPhoneV;
    request!.matrimoniale =
        responseReinscription!.student!.matrimoniale.toString();
    request!.conjoint = responseReinscription!.student!.partenaireName;
    request!.enfant = responseReinscription!.student!.nombreEnfant.toString();
    request!.taille = responseReinscription!.student!.tailleV;
    request!.campus = responseReinscription!.student!.preferedCampus.toString();
    request!.situationPro =
        responseReinscription!.student!.situationPro.toString();
    request!.profession = responseReinscription!.student!.professionV;
    request!.niveauAcademi =
        responseReinscription!.student!.levelAcademy.toString();

    TextEditingController conjoint = TextEditingController();
    conjoint.text = responseReinscription!.student!.partenaireName!;

    if (responseReinscription!.student!.sexeV == "H") {
      //updateInfoPerson.sexe = "1";
      optionItemSelected = OptionItem(id: null, title: "Homme");
    } else if (responseReinscription!.student!.sexeV == "F") {
      // updateInfoPerson.sexe = "2";
      optionItemSelected = OptionItem(id: null, title: "Femme");
    }

//updateInfoPerson.matrimoniale =
    // c.detailStudent!.students!.matrimoniale.toString();

    switch (responseReinscription!.student!.matrimoniale.toString()) {
      case '1':
        optionItemSituationMSelected = OptionItem(id: null, title: 'Marié(e)');
        break;
      case '2':
        optionItemSituationMSelected =
            OptionItem(id: null, title: 'Célibataire');
        break;
      case '3':
        optionItemSituationMSelected = OptionItem(id: null, title: 'Veuf (ve)');
        break;
      case '4':
        optionItemSituationMSelected =
            OptionItem(id: null, title: 'Divorcé (e)');
        break;
      case '5':
        optionItemSituationMSelected =
            OptionItem(id: null, title: 'Fiancé (e)');
        break;
      case '6':
        optionItemSituationMSelected =
            OptionItem(id: null, title: 'En concubinage');
        break;
    }

    //updateInfoPerson.civilite = c.detailStudent!.students!.citizenV;

    switch (responseReinscription!.student!.citizenV) {
      case '1':
        optionItemCiviliteSelected = OptionItem(id: null, title: 'Dr');
        break;
      case '2':
        optionItemCiviliteSelected = OptionItem(id: null, title: 'Réverand');
        break;
      case '3':
        optionItemCiviliteSelected = OptionItem(id: null, title: 'Pasteur');
        break;
      case '4':
        optionItemCiviliteSelected = OptionItem(id: null, title: 'M.');
        break;
      case '5':
        optionItemCiviliteSelected = OptionItem(id: null, title: 'Mme');
        break;
      case '6':
        optionItemCiviliteSelected = OptionItem(id: null, title: 'Mlle');
        break;
    }

    switch (responseReinscription!.student!.preferedCampus.toString()) {
      case '2':
        optionCampusSelected = OptionItem(
            id: null, title: 'Jour ( PRESENTIEL: Samedi 8H-12H GMT )');
        break;
      case '7':
        optionCampusSelected =
            OptionItem(id: null, title: 'Canada ( EN LIGNE )');
        break;
      case '5':
        optionCampusSelected =
            OptionItem(id: null, title: 'Jour ( EN LIGNE: Samedi 8H-12H )');
        break;
      case '3':
        optionCampusSelected = OptionItem(
            id: null, title: 'Soir ( EN LIGNE: Lundi,Mardi 19H-21H GMT )');
        break;
    }

    switch (responseReinscription!.student!.situationPro.toString()) {
      case '1':
        optionSituationProfessionnelleSelected =
            OptionItem(id: null, title: 'Sans Emploi');
        break;
      case '2':
        optionSituationProfessionnelleSelected =
            OptionItem(id: null, title: 'Salarié(e)');
        break;
      case '3':
        optionSituationProfessionnelleSelected =
            OptionItem(id: null, title: 'Indépendant(e)');
        break;
      case '4':
        optionSituationProfessionnelleSelected =
            OptionItem(id: null, title: 'Autre');
        break;
    }

    switch (responseReinscription!.student!.levelAcademy.toString()) {
      case '0':
        optionListNiveauHonneurSelected = OptionItem(id: null, title: 'Aucun');
        break;
      case '1':
        optionListNiveauHonneurSelected = OptionItem(id: null, title: '1');
        break;
      case '2':
        optionListNiveauHonneurSelected = OptionItem(id: null, title: '2');
        break;
      case '3':
        optionListNiveauHonneurSelected = OptionItem(id: null, title: '3');
        break;
      case '4':
        optionListNiveauHonneurSelected = OptionItem(id: null, title: '4');
        break;
    }

    optionItemTshirtSelected =
        OptionItem(id: null, title: responseReinscription!.student!.tailleV);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Reinscription : Etape 1"),
        backgroundColor: hexToColor("#008bb2"),
        actions: const  [
          /*  IconButton(
            icon: const Icon(FontAwesomeIcons.alignCenter),
            tooltip: 'Actualiser',
            onPressed: () {
            },
          ), */
        ],
      ),
      body: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(20),
          child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              responseReinscription!.user!.fname! +
                                  ' ' +
                                  responseReinscription!.user!.lname!,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              responseReinscription!.user!.numero!,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              Jiffy(responseReinscription!
                                      .student!.dateNaissance!
                                      .toString())
                                  .format("dd-MM-yyyy"),
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              responseReinscription!.user!.email!,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue),
                              textAlign: TextAlign.center,
                            ),
                            TextButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            ListTile(
                                              leading: new Icon(Icons.photo),
                                              title: new Text('Camera'),
                                              onTap: () {
                                                controller.getImage('camera');
                                                Navigator.pop(context);
                                              },
                                            ),
                                            ListTile(
                                              leading:
                                                  new Icon(Icons.file_upload),
                                              title: new Text('Galerie'),
                                              onTap: () {
                                                controller.getImage('galerie');
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.edit,
                                      color: Colors.orangeAccent,
                                      size: 15,
                                    ),
                                    Text(
                                      'Modifier la photo',
                                      style: TextStyle(
                                          color: Colors.orangeAccent,
                                          fontSize: 14),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    responseReinscription!
                                        .gradue!.gradue!.text!,
                                    style: TextStyle(
                                        color: hexToColor(responseReinscription!
                                            .gradue!.gradue!.color!),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                Icon(
                                  FontAwesomeIcons.thumbsUp,
                                  color: hexToColor(responseReinscription!
                                      .gradue!.gradue!.color!),
                                  size: 15,
                                ),
                              ],
                            ),
                            const Divider(),
                            responseReinscription!.gradue!.gradue1 != null
                                ? Text(
                                    responseReinscription!
                                        .gradue!.gradue1!.text!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: hexToColor(responseReinscription!
                                            .gradue!.gradue1!.color!),
                                        fontSize: 16))
                                : const Divider(),
                           const
                            SizedBox(
                              height: 5,
                            ),
                            responseReinscription!.gradue!.gradue2 != null
                                ? Text(
                                    responseReinscription!
                                        .gradue!.gradue2!.text!,
                                    style: TextStyle(
                                        color: hexToColor(responseReinscription!
                                            .gradue!.gradue2!.color!),
                                        fontSize: 12),
                                    maxLines: 10,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.justify,
                                  )
                                : Divider(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  InputTextField(
                    initialValue:
                        responseReinscription!.student!.location ?? "",
                    labelText: "Lieu d'habitation",
                    textInputType: TextInputType.text,
                    onChange: (text) {
                      request!.habitation = text;
                    },
                    onValidate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez renseigner un lieu habitation';
                      }
                    },
                  ),
                  InputTextField(
                    initialValue:
                        responseReinscription!.student!.facebook ?? "",
                    labelText: "Compte Facebook",
                    textInputType: TextInputType.text,
                    icon: FontAwesomeIcons.facebook,
                    onChange: (text) {
                      request!.facebook = text;
                      // updateInfoPerson.vs = text;
                    },
                    onValidate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez renseigner compte facebook';
                      }
                    },
                  ),
                  InputTextField(
                    initialValue:
                        responseReinscription!.student!.primaryPhoneV ?? "",
                    labelText: "Téléphone 1",
                    icon: Icons.phone_iphone,
                    textInputType: TextInputType.phone,
                    onChange: (text) {
                      request!.contact1 = text;
                      // updateInfoPerson.vs = text;
                    },
                    onValidate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez renseigner compte facebook';
                      }
                    },
                  ),
                  InputTextField(
                    initialValue:
                        responseReinscription!.student!.secondaryPhoneV ?? "",
                    labelText: "Téléphone 2",
                    textInputType: TextInputType.phone,
                    icon: Icons.phone_iphone,
                    onChange: (text) {
                      // updateInfoPerson.vs = text;
                      request!.contact2 = text;
                    },
                    onValidate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez renseigner compte facebook';
                      }
                    },
                  ),
                  const Text(
                    'Situation Matrimoniale',
                    style: TextStyle(fontSize: 17),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  SelectDropList(
                    optionItemSituationMSelected,
                    choices.ListSituationMatrimonialModel,
                    Icons.bookmark,
                    (optionItem) {
                      setState(() {
                        request!.matrimoniale = optionItem.id;
                        //optionItemSituationMSelected = optionItem;
                        //updateInfoPerson.matrimoniale = optionItem.id;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputTextField(
                      labelText: "Nom et Prénoms du conjoint",
                      // initialValue: responseReinscription!.student!.partenaireName ?? "",
                      textInputType: TextInputType.text,
                      icon: FontAwesomeIcons.egg,
                      controller: conjoint,
                      //initialValue: controller.registerStudent.email,
                      onChange: (text) {
                        //updateInfoPerson.email = text;
                        request!.conjoint = conjoint.text;
                      },
                      /* onValidate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez renseigner Nom et Prénoms du conjoint';
                        }
                      }, */
                      iconcolor: Colors.blue),
                  InputTextField(
                      labelText: "Nombre d'enfants",
                      textInputType: TextInputType.number,
                      initialValue: responseReinscription!.student!.nombreEnfant
                          .toString(),
                      onChange: (val) {
                        request!.enfant = val;
                        // updateInfoPerson.enfant = val;
                        //controller.registerStudent.children = val;
                        //controller.resp.addAll({'children': val});
                        //print(controller.registerStudent.toJson());
                      },
                      /* onValidate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez renseigner Nombre d\' enfant';
                        }
                      } */),
                  const Text(
                    'Taille T-SHIRT',
                    style: TextStyle(fontSize: 17),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  SelectDropList(
                    optionItemTshirtSelected,
                    choices.ListTshirtModel,
                    Icons.bookmark,
                    (optionItem) {
                      setState(() {
                        optionItemTshirtSelected = optionItem;
                        request!.taille = optionItem.id;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                 const Text(
                    'Campus',
                    style: TextStyle(fontSize: 17),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  SelectDropList(
                    optionCampusSelected,
                    choices.ListCampus,
                    Icons.bookmark,
                    (optionItem) {
                      setState(() {
                        optionCampusSelected = optionItem;
                        request!.campus = optionItem.id;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  InputTextField(
                      labelText: "Votre département dans votre communauté",
                      textInputType: TextInputType.text,
                      icon: FontAwesomeIcons.building,
                      onChange: (text) {
                        request!.departement = text;
                      },
                      /* onValidate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez renseigner département';
                        }
                      }, */
                      iconcolor: Colors.blue),
                 const Divider(indent: 20),
                 const Text(
                    'Situation professionnelle',
                    style: TextStyle(fontSize: 17),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  SelectDropList(
                    optionSituationProfessionnelleSelected,
                    choices.ListSituationProfessionnelle,
                    Icons.bookmark,
                    (optionItem) {
                      setState(() {
                        optionSituationProfessionnelleSelected = optionItem;
                        request!.situationPro = optionItem.id;
                      });
                    },
                  ),
                  const Divider(indent: 20),
                 const SizedBox(
                    height: 15,
                  ),
                  InputTextField(
                      labelText: "Profession actuelle",
                      textInputType: TextInputType.text,
                      icon: FontAwesomeIcons.addressBook,
                      initialValue: responseReinscription!.student!.professionV,
                      onChange: (text) {
                        request!.profession = text;
                      },
                     /*  onValidate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez renseigner profession actuelle';
                        }
                      }, */
                      iconcolor: Colors.blue),
                 const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Niveau academie d\'honneur',
                    style: TextStyle(fontSize: 17),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  SelectDropList(
                    optionListNiveauHonneurSelected,
                    choices.ListNiveauHonneur,
                    Icons.bookmark,
                    (optionItem) {
                      setState(() {
                        optionListNiveauHonneurSelected = optionItem;
                        request!.niveauAcademi = optionItem.id;
                      });
                    },
                  ),
                  const Divider(
                    indent: 20,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Divider(indent: 20),
                  MaterialButton(
                      minWidth: 60.0,
                      height: 50,
                      color: const Color(0xff008bb2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.white38)),
                      child:const Text('Suivant',
                          style:  TextStyle(
                              fontSize: 16.0, color: Colors.white)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print(request!.toJson());
                          Get.to(() => ReinscriptionEtape2(),
                              routeName: '/reinscription/etape/2',
                              binding: ReinscriptionBinding(),
                              arguments: [
                                request,
                                responseReinscription!.token
                              ]);
                        }
                      }),
                const SizedBox(
                    height: 10,
                  )
                ],
              ))),
    ));
  }
}
