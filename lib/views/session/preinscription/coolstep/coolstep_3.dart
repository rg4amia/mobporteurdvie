import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/constants/data/form/choices.dart' as choices;
import '/constants/data/form/yes_no.dart';
import '/models/drop_list_model.dart';
import '/widgets/components/InputDateTextField.dart';
import '/widgets/components/InputTextField.dart';
import '/widgets/components/select_drop_list.dart';
import '/widgets/components/customRadio.dart';
import 'controller/coolstep_controller.dart';



class InformationsSpirituelles extends StatelessWidget {
  InformationsSpirituelles({Key? key}) : super(key: key);

  CoolStepController _mycontroller = Get.put(CoolStepController());

  OptionItem optionItemCiviliteSelected =
      OptionItem(id: null, title: "Selectionné Civilité");

  OptionItem optionItemBaptSaintEspritSelected =
      OptionItem(id: null, title: "Selectionné");

  OptionItem optionItemAnneeSelected =
      OptionItem(id: null, title: "Selectionné année");

  OptionItem optionItemAssembleeSelected =
      OptionItem(id: null, title: "Selectionné assemblée");

  OptionItem optionItemFrequencePriereSelected =
      OptionItem(id: null, title: "Selectionné fréquence de prière");

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoolStepController>(builder: (controller) {
      return Container(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  SizedBox(
                    height: 7,
                  ),
                  SelectDropList(
                    this.optionItemCiviliteSelected,
                    choices.ListCiviliteModel,
                    Icons.bookmark,
                        (optionItem) {
                      optionItemCiviliteSelected = optionItem;
                      controller.stateValueInput(optionItem.title!);
                      controller.registerStudent.civility =
                      optionItem.title!;
                      controller.resp
                          .addAll({'civility': optionItem.title!});
                    },
                  ),
                ],
              )),
        ),
        SizedBox(
          height: 10,
        ),
        const Divider(indent: 20),
        InputTextField(
            //controller: yearofconversion,
            labelText: "Année de conversion",
            textInputType: TextInputType.number,
            initialValue: controller.registerStudent.yearofconversion,
            onChange: (val) {
              controller.registerStudent.yearofconversion = val;
              controller.resp.addAll({'year_of_conversion': val});
            },
            onValidate: (value) {
              return null;
              /* if (value == null || value.isEmpty) {
                return 'Veuillez renseigner un Lieu d\'habitation';
              } */
            }),
        InputTextField(
            //controller: pagebiblique,
            labelText: "Passage Biblique de votre conversion",
            textInputType: TextInputType.text,
            initialValue: controller.registerStudent.pagebiblique,
            onChange: (val) {
              controller.registerStudent.pagebiblique = val;
              controller.resp.addAll({'page_biblique': val});
              //print(controller.registerStudent.toJson());
            },
            onValidate: (value) {
              return null;
              /* if (value == null || value.isEmpty) {
                return 'Veuillez renseigner un Lieu d\'habitation';
              } */
            }),
        Divider(color: Colors.grey),
        DateTextField(
            labelText: 'Date de Baptême par immersion',
            controller: _mycontroller.getbaptemeimmersion,
            onValidate: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez renseigner votre date de immersion';
              }
            },
            selectDate: controller.selectDatebaptemeimmersion),
        SizedBox(
          height: 5,
        ),
        Divider(
          color: Colors.grey,
        ),
        SizedBox(
          height: 5,
        ),
        Divider(indent: 20),
        Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    SizedBox(
                      height: 7,
                    ),
                    SelectDropList(
                      this.optionItemBaptSaintEspritSelected,
                      choices.ListBaptisEspModel,
                      Icons.bookmark,
                          (optionItem) {
                        optionItemBaptSaintEspritSelected = optionItem;
                        controller.stateValueInput(optionItem.title!);
                        controller.registerStudent.baptizedwiththeholyspirit =
                        optionItem.title!;
                        controller.resp.addAll({
                          'Baptized_with_the_holy_spirit': optionItem.title!
                        });
                      },
                    ),
                  ],
                ))),
        SizedBox(
          height: 5,
        ),
        Divider(indent: 20),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: EdgeInsets.all(7),
          child: Column(
            children: [
              Text(
                'Quelle est la chose à laquelle vous pensez le plus et pour '
                'laquelle vous vous deployez et fournissez plus d\'effort ?',
                style: TextStyle(fontSize: 17),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                maxLength: 500,
                initialValue: controller.registerStudent.thingyouthinkmost,
                onChanged: (val) {
                  controller.registerStudent.thingyouthinkmost = val;
                  controller.resp.addAll({'thing_you_think_most': val});
                },
                validator: (value) {
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Champ de saisir",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(new Radius.circular(15.0))),
                    labelStyle: TextStyle(color: Colors.white)),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey,
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
            padding: EdgeInsets.all(7),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Avez-vous fait l\'experience du parler en langues?',
                    style: TextStyle(fontSize: 17),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomRadioIndex(
                          txt: lstparlerlangues[0],
                          index: 0,
                          selectedIndex:
                              _mycontroller.selectedParlerLanguesIndex,
                          changeCustomIndex: () {
                            _mycontroller.changeParlerLanguesIndex(0);
                          }),
                      SizedBox(
                        width: 30,
                      ),
                      CustomRadioIndex(
                          txt: lstparlerlangues[1],
                          index: 1,
                          selectedIndex:
                              _mycontroller.selectedParlerLanguesIndex,
                          changeCustomIndex: () {
                            _mycontroller.changeParlerLanguesIndex(1);
                          }),
                    ],
                  ),
                ])),
        SizedBox(
          height: 10,
        ),
        _mycontroller.enableYearPL
            ? GetBuilder<CoolStepController>(builder: (controller) {
                return Column(
                  children: [
                    Text(
                      'Baptisé(e) du Saint Esprit',
                      style: TextStyle(fontSize: 17),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    SelectDropList(
                      this.optionItemBaptSaintEspritSelected,
                      choices.ListAnneeModel,
                      Icons.bookmark,
                      (optionItem) {
                        optionItemBaptSaintEspritSelected = optionItem;
                        controller.stateValueInput(optionItem.title!);
                        controller.registerStudent.inlangdate = optionItem.title!;
                        controller.resp.addAll({'in_lang_date': optionItem.title!});
                      },
                    ),
                  ],
                );
              })
            : Text(''),
        Divider(
          color: Colors.grey,
        ),
        Text(
          'Votre Assemblée?',
          style: TextStyle(fontSize: 17),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
        ),
        SizedBox(
          height: 7,
        ),
        SelectDropList(
          this.optionItemAssembleeSelected,
          _mycontroller.ListChurchs!,
          Icons.bookmark,
          (optionItem) {
            optionItemAssembleeSelected = optionItem;
            controller.stateValueInput(optionItem.title!);
            controller.registerStudent.egliseactuel = optionItem.title!;
            controller.resp.addAll({'eglise_actuel': optionItem.title!});
          },
        ),
        SizedBox(
          height: 10,
        ),
        InputTextField(
            labelText: "Autre Assemblée?",
            textInputType: TextInputType.text,
            initialValue: controller.registerStudent.actifeglise,
            onChange: (val) {
              controller.registerStudent.actifeglise = val;
              controller.resp.addAll({'actif_eglise': val});
            },
            onValidate: (value) {
              return null;
              /* if (value == null || value.isEmpty) {
                return 'Veuillez renseigner un Lieu d\'habitation';
              } */
            }),
        SizedBox(
          height: 10,
        ),
        Padding(
            padding: EdgeInsets.all(7),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Etes-vous membre actif dans votre assemblée?',
                    style: TextStyle(fontSize: 17),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomRadioIndex(
                        txt: lstmembreactifs[0],
                        index: 0,
                        selectedIndex: _mycontroller.selectedMembreActifsIndex,
                        changeCustomIndex: () =>
                            _mycontroller.changeMembreActifsIndex(0),
                      ),
                      SizedBox(width: 50.0),
                      CustomRadioIndex(
                        txt: lstmembreactifs[1],
                        index: 1,
                        selectedIndex: _mycontroller.selectedMembreActifsIndex,
                        changeCustomIndex: () =>
                            _mycontroller.changeMembreActifsIndex(1),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _mycontroller.enableMActifs
                      ? InputTextField(
                          // controller: actifdepartement,
                          labelText: "Dans quel departement?",
                          textInputType: TextInputType.text,
                          initialValue:
                              controller.registerStudent.actifdepartement,
                          onChange: (val) {
                            controller.registerStudent.actifdepartement = val;
                            controller.resp.addAll({'actif_departement': val});
                            //print(controller.registerStudent.toJson());
                          },
                          onValidate: (value) {
                            return null;
                          })
                      : Text(''),
                ])),
        SizedBox(
          height: 5,
        ),
        Padding(
            padding: EdgeInsets.all(7),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Avez-vous déjà amené une personne à Christ?',
                    style: TextStyle(fontSize: 17),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomRadioIndex(
                        txt: lstpersonnechrist[0],
                        index: 0,
                        selectedIndex:
                            _mycontroller.selectedPersonneChristIndex,
                        changeCustomIndex: () =>
                            _mycontroller.changePersonneChristIndex(0),
                      ),
                      //customRadioPersonneChrist(lstpersonnechrist[0], 0),
                      SizedBox(width: 50.0),
                      CustomRadioIndex(
                        txt: lstpersonnechrist[1],
                        index: 1,
                        selectedIndex:
                            _mycontroller.selectedPersonneChristIndex,
                        changeCustomIndex: () =>
                            _mycontroller.changePersonneChristIndex(1),
                      ),
                      //customRadioPersonneChrist(lstpersonnechrist[1], 1),
                    ],
                  ),
                ])),
        SizedBox(
          height: 10,
        ),
        const Divider(indent: 20),
        Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Text(
                      'Fréquence de prière et de méditation de la Parole de Dieu',
                      style: TextStyle(fontSize: 17),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    SelectDropList(
                      this.optionItemFrequencePriereSelected,
                      choices.ListFrequencePriereModel,
                      Icons.bookmark,
                          (optionItem) {
                        optionItemFrequencePriereSelected = optionItem;
                        controller.stateValueInput(optionItem.title!);
                        controller.registerStudent.frequencepriere = optionItem.title!;
                        controller.resp.addAll({'frequence_priere': optionItem.title!});
                      },
                    ),
                  ],
                ))),
        SizedBox(
          height: 10,
        ),
        const Divider(indent: 20),
        Padding(
          padding: EdgeInsets.all(7),
          child: Column(
            children: [
              Text(
                'Quel est le dernier sujet pour lequel vous avez cherché l\'exaucement? Precisez le sujet en une phrase',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                maxLength: 500,
                initialValue: controller.registerStudent.derniersujet,
                onChanged: (val) {
                  controller.registerStudent.derniersujet = val;
                  controller.resp.addAll({'dernier_sujet': val});
                },
                validator: (value) {
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Champ de saisir",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(new Radius.circular(15.0))),
                    labelStyle: TextStyle(color: Colors.white)),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(7),
          child: Column(
            children: [
              Text(
                'Qu\'aimez-vous faire avec joie et sans peine dans le Seigneur?',
                style: TextStyle(fontSize: 17),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                maxLength: 500,
                initialValue: controller.registerStudent.aimefaire,
                onChanged: (val) {
                  controller.registerStudent.aimefaire = val;
                  controller.resp.addAll({'aime_faire': val});
                },
                validator: (value) {
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Champ de saisir",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(new Radius.circular(15.0))),
                    labelStyle: TextStyle(color: Colors.white)),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.all(7),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Connaissez-vous vos dons et talents?',
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomRadioIndex(
                          txt: lstdonstalents[0],
                          index: 0,
                          selectedIndex: _mycontroller.selectedDonsTalentsIndex,
                          changeCustomIndex: () =>
                              _mycontroller.changeDonsTalentsIndex(0)),
                      SizedBox(
                        width: 50,
                      ),
                      CustomRadioIndex(
                          txt: lstdonstalents[1],
                          index: 1,
                          selectedIndex: _mycontroller.selectedDonsTalentsIndex,
                          changeCustomIndex: () =>
                              _mycontroller.changeDonsTalentsIndex(1)),
                    ],
                  ),
                ])),
        _mycontroller.enableDonsTalents
            ? InputTextField(
                // controller: donvaleur,
                labelText: "Précisez vos dons",
                textInputType: TextInputType.text,
                initialValue: controller.registerStudent.donv,
                onChange: (val) {
                  controller.registerStudent.donv = val;
                  controller.resp.addAll({'don_v': val});
                },
                onValidate: (value) {
                  return null;
                })
            : Text(''),
      ]));
    });
  }
}
