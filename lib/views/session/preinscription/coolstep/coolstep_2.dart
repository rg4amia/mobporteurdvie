// import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
//import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '/widgets/components/select_drop_list.dart';
import '/constants/data/form/choices.dart' as choices;
import '/models/drop_list_model.dart';
import '/widgets/components/InputDateTextField.dart';
import '/widgets/components/InputTextField.dart';
import 'controller/coolstep_controller.dart';

// ignore: must_be_immutable
class InformationPersonnelles extends StatelessWidget {
  InformationPersonnelles({
    Key? key,
  }) : super(key: key);

  final TextEditingController ctrlnumber = TextEditingController();
  String initialCountry = 'CI';
  //PhoneNumber number = PhoneNumber(isoCode: 'CI');


  OptionItem optionItemSelected =
  OptionItem(id: null, title: "Selectionner Sexe");

  OptionItem optionItemSituationMSelected =
  OptionItem(id: null, title: "Selectionner Situation Matrimoniale");

  OptionItem optionItemTshirtSelected =
  OptionItem(id: null, title: "Selectionner Taille T-shirt");

  OptionItem optionItemCampusSelected =
  OptionItem(id: null, title: "Selectionner Campus");

  OptionItem optionItemSituationProfessionelleSelected =
  OptionItem(id: null, title: "Selectionné Situation professionnelle");

  OptionItem optionItemAcademieHonneurSelected =
  OptionItem(id: null, title: "Selectionné Niveau academie d'honneur");

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoolStepController>(builder: (controller) {
      return Container(
          child: Column(children: [
        InputTextField(
            labelText: "Nom *",
            icon: Icons.person,
            textInputType: TextInputType.name,
            initialValue: controller.registerStudent.name,
            onValidate: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez saisir votre nom';
              }
            },
            onSaved: (onSavedVal) {
              controller.registerStudent.name = onSavedVal;
              print(controller.registerStudent.name);
            },
            onChange: (text) {
              controller.registerStudent.name = text;
              controller.resp.addAll({'name': text});
              print(controller.registerStudent.name);
            }),
        InputTextField(
            labelText: "Prénoms *",
            textInputType: TextInputType.name,
            initialValue: controller.registerStudent.lname,
            onValidate: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez saisir votre Prénoms';
              }
            },
            onChange: (text) {
              controller.registerStudent.lname = text;
              controller.resp.addAll({'lname': text});
              print(controller.registerStudent.lname);
            },
            onSaved: (onSavedVal) {
              controller.registerStudent.lname = onSavedVal;
              print(controller.registerStudent.lname);
            },
            icon: Icons.person_add_outlined),
        DateTextField(
            labelText: 'Date de Naissance',
            controller: controller.getdatenaissance,
            onValidate: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez renseigner votre date de naissance';
              }
            },
            selectDate: controller.selectDatedatenaissance),
        const Divider(indent: 20),
        Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child:  Align(
                  alignment: Alignment.centerLeft,
                  child:  Column(
                    children: [
                      SelectDropList(
                        this.optionItemSelected,
                        choices.ListGenreModel,
                        Icons.bookmark,
                            (optionItem) {
                          optionItemSelected = optionItem;
                          if (optionItemSelected.id == '1') {
                            controller.resp.addAll({'gender':  "H"});
                          } else {
                            controller.resp.addAll({'gender':  "F"});
                          }
                        },
                      ),
                    ],
                  )
                )),
        Divider(indent: 20),
        InputTextField(
          labelText: "Ville *",
          icon: Icons.business,
          initialValue: controller.registerStudent.ville,
          textInputType: TextInputType.text,
          onChange: (text) {
            controller.registerStudent.ville = text;
            print(controller.registerStudent.ville);
            controller.resp.addAll({'ville': text});
          },
          onValidate: (value) {
            if (value == null || value.isEmpty) {
              return 'Veuillez renseigner une ville';
            }
          },
        ),
        InputTextField(
          labelText: "Quartier *",
          icon: Icons.business_sharp,
          textInputType: TextInputType.text,
          initialValue: controller.registerStudent.ktier,
          onValidate: (value) {
            if (value == null || value.isEmpty) {
              return 'Veuillez renseigner votre Quartier';
            }
          },
          onChange: (text) {
            controller.registerStudent.ktier = text;
            controller.resp.addAll({'ktier': text});
          },
        ),
        InputTextField(
          labelText: "Lieu d'habitation *",
          icon: Icons.location_city,
          textInputType: TextInputType.text,
          iconcolor: Colors.cyan,
          initialValue: controller.registerStudent.location,
          onChange: (text) {
            controller.registerStudent.location = text;
            controller.resp.addAll({'location': text});
            print(controller.registerStudent.location);
          },
          onValidate: (value) {
            if (value == null || value.isEmpty) {
              return 'Veuillez renseigner un Lieu d\'habitation';
            }
          },
        ),
        Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
                padding: const EdgeInsets.only(bottom: 5.0, left: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: IntlPhoneField(
                  decoration: const InputDecoration(
                    counter: Offstage(),
                    labelText: 'Téléphone',
                  ),
                  initialCountryCode: 'CIV',
                  showDropdownIcon: true,
                  dropdownIconPosition:IconPosition.trailing,
                  onChanged: (phone) {
                    print(phone.completeNumber);
                    controller.registerStudent.callingcode = phone.countryCode;
                    controller.registerStudent.phone1 = phone.completeNumber;
                    controller.resp.addAll({'calling_code': phone.countryCode});
                    controller.resp.addAll({'phone1': phone.completeNumber});
                  },
                ),
              /*InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    controller.registerStudent.callingcode = number.dialCode;
                    controller.registerStudent.phone1 = number.phoneNumber;
                    controller.resp.addAll({'calling_code': number.dialCode!});
                    controller.resp.addAll({'phone1': number.phoneNumber!});
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: TextStyle(color: Colors.black),
                 // initialValue: number,
                  //initialValue: ,
                  // textFieldController: telephone1,
                  formatInput: false,
                  hintText: 'Téléphone 1',
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputBorder: InputBorder.none,
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                )*/)),
        InputTextField(
            labelText: "Téléphone 2",
            textInputType: TextInputType.phone,
            initialValue: controller.registerStudent.phone2,
            icon: Icons.phone_iphone,
            onChange: (text) {
              controller.registerStudent.phone2 = text;
              controller.resp.addAll({'phone2': text});
            },
            onValidate: (value) {
              return null;
              /* if (value == null || value.isEmpty) {
                return 'Veuillez renseigner un Lieu d\'habitation';
              } */
            }),
            InputTextField(
                labelText: "Email",
                textInputType: TextInputType.text,
                icon: FontAwesomeIcons.mailBulk,
                initialValue: controller.registerStudent.email,
                onChange: (text) {
                  controller.registerStudent.email = text;
                  controller.resp.addAll({'email': text});
                  print(controller.registerStudent.facebook);
                },
                onValidate: (value) {
                  return null;
                  /* if (value == null || value.isEmpty) {
                return 'Veuillez renseigner un Lieu d\'habitation';
              } */
                },
                iconcolor: Colors.blue),
        Divider(),
        InputTextField(
            labelText: "Compte Facebook",
            textInputType: TextInputType.text,
            icon: FontAwesomeIcons.facebook,
            initialValue: controller.registerStudent.facebook,
            onChange: (text) {
              controller.registerStudent.facebook = text;
              controller.resp.addAll({'facebook': text});
            },
            onValidate: (value) {
              return null;
              /* if (value == null || value.isEmpty) {
                return 'Veuillez renseigner un Lieu d\'habitation';
              } */
            },
            iconcolor: Colors.blue),
        InputTextField(
            labelText: "WhatsApp",
            textInputType: TextInputType.phone,
            icon: FontAwesomeIcons.whatsapp,
            initialValue: controller.registerStudent.whatsapp,
            onChange: (text) {
              controller.registerStudent.whatsapp = text;
              controller.resp.addAll({'whatsapp': text});
            },
            onValidate: (value) {
              return null;
              /* if (value == null || value.isEmpty) {
                return 'Veuillez renseigner un Lieu d\'habitation';
              } */
            },
            iconcolor: Colors.green),
        InputTextField(
            labelText: "Skype",
            textInputType: TextInputType.text,
            icon: FontAwesomeIcons.skype,
            initialValue: controller.registerStudent.skype,
            onChange: (text) {
              controller.registerStudent.skype = text;
              controller.resp.addAll({'skype': text});
            },
            onValidate: (value) {
              return null;
              /* if (value == null || value.isEmpty) {
                return 'Veuillez renseigner un Lieu d\'habitation';
              } */
            },
            iconcolor: Colors.lightBlueAccent),
        const Divider(indent: 20),
            SizedBox(
              height: 7,
            ),
            SelectDropList(
              this.optionItemSituationMSelected,
              choices.ListSituationMatrimonialModel,
              Icons.bookmark,
                  (optionItem) {
                optionItemSituationMSelected = optionItem;
                controller.stateValueInput(optionItem.title!);
                controller.registerStudent.marital = optionItem.title!;
                controller.resp.addAll({'marital': optionItem.title!});
              },
            ),
        Divider(indent: 20),
        InputTextField(
            labelText: "Nom et Prénoms du conjoint",
            textInputType: TextInputType.name,
            initialValue: controller.registerStudent.partenairename,
            onChange: (val) {
              controller.registerStudent.partenairename = val;
              controller.resp.addAll({'partenaire_name': val});
              //print(controller.registerStudent.toJson());
            },
            onValidate: (value) {
              return null;
              /* if (value == null || value.isEmpty) {
                return 'Veuillez renseigner un Lieu d\'habitation';
              } */
            }),
        InputTextField(
            labelText: "Nombre d'enfants *",
            textInputType: TextInputType.number,
            initialValue: controller.registerStudent.children,
            onChange: (val) {
              controller.registerStudent.children = val;
              controller.resp.addAll({'children': val});
              //print(controller.registerStudent.toJson());
            },
            onValidate: (value) {
              return null;
              /* if (value == null || value.isEmpty) {
                return 'Veuillez renseigner un Lieu d\'habitation';
              } */
            }),
        Divider(indent: 20),
        Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child:Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    SizedBox(
                      height: 7,
                    ),
                    SelectDropList(
                      this.optionItemTshirtSelected,
                      choices.ListTshirtModel,
                      Icons.bookmark, (optionItem) {
                      optionItemTshirtSelected = optionItem;
                      controller.stateValueInput(optionItem.title!);
                      controller.registerStudent.taille = optionItem.title!;
                      controller.resp.addAll({'taille': optionItem.title!});
                    },
                    ),
                  ],
                )
            )),
        Divider(indent: 20),
        Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    SelectDropList(
                      this.optionItemCampusSelected,
                      choices.ListCampus,
                      Icons.bookmark, (optionItem) {
                      optionItemCampusSelected = optionItem;
                      controller.stateValueInput(optionItem.title!);
                      controller.registerStudent.campus = optionItem.title!;
                      controller.resp.addAll({'campus': optionItem.title!});
                    },
                    ),
                  ],
                )
            ),),
        Divider(indent: 20),
        Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    SelectDropList(
                      this.optionItemSituationProfessionelleSelected,
                      choices.ListSituationProfessionnelle,
                      Icons.bookmark, (optionItem) {
                      optionItemSituationProfessionelleSelected = optionItem;
                      controller.stateValueInput(optionItem.title!);
                      controller.registerStudent.situationpro = optionItem.title!;
                      controller.resp.addAll({'situation_pro': optionItem.title!});
                    },
                    ),
                  ],
                )
            )),
        const Divider(indent: 20),
        InputTextField(
            labelText: "Profession actuelle",
            textInputType: TextInputType.text,
            initialValue: controller.registerStudent.profession,
            onChange: (val) {
              controller.registerStudent.profession = val;
              controller.resp.addAll({'profession': val});
              //print(controller.registerStudent.toJson());
            },
            onValidate: (value) {
              return null;
              /* if (value == null || value.isEmpty) {
                return 'Veuillez renseigner un Lieu d\'habitation';
              } */
            }),
        Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    SelectDropList(
                      this.optionItemAcademieHonneurSelected,
                      choices.ListNiveauHonneur,
                      Icons.bookmark, (optionItem) {
                      optionItemAcademieHonneurSelected = optionItem;
                      controller.stateValueInput(optionItem.title!);
                      controller.registerStudent.niveauacademi = optionItem.title!;
                      controller.resp.addAll({'niveau_academi': optionItem.title!});
                    },
                    ),
                  ],
                )
            )),
        Divider(indent: 20),
        SizedBox(
          height: 20,
        )
      ]));
    });
  }
}
