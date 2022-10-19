import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'administrateur_controller.dart';
import '../../views/cinetPay/CinetPaymentScreen.dart';
import '../../constants/color_constants.dart';
import '../../../constants/Assets.dart';
import '../../../constants/Enums.dart';
import '../../models/detailStudent.dart';
import '../../models/updateinfoperso.dart';
import '../../widgets/components/InputDateTextField.dart';
import '../../widgets/components/InputTextField.dart';
import '../../widgets/components/customRadio.dart';
import '../../widgets/components/navigation_drawer_widget.dart';
import '../../models/updateinfospirituel.dart';
import '../../constants/data/form/choices.dart' as choices;
import '../../constants/data/form/yes_no.dart';
import '../../models/paiement_send.dart';
import '../../../widgets/components/select_drop_list.dart';
import '../../models/drop_list_model.dart';
import '../../../views/administrateur/detail_paiement.dart';

class AdministrateurDetail extends StatefulWidget {
  const AdministrateurDetail({Key? key}) : super(key: key);
  @override
  _AdministrateurDetailState createState() => _AdministrateurDetailState();
}

class _AdministrateurDetailState extends State<AdministrateurDetail> {
  int navIndex = 1;
  bool _loading = true;

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

  String selectedValue = "Homme";

  TextEditingController getbaptemeimmersion = TextEditingController();
  AdministrateurDetailController c = Get.find();
  UpdateInfoPerson updateInfoPerson = UpdateInfoPerson();
  UpdateInfoSpirituel updateInfoSpirituel = UpdateInfoSpirituel();
  PaiementSend paiementSend = PaiementSend();
  UpdateInfoPersonResponse? updateInfoPersonResponse;

  String? evenement = "----   Choisir  Motif   ---";

  TextEditingController paiementSendMotif = TextEditingController();
  TextEditingController paiementSendMontantChiffre = TextEditingController();
  TextEditingController paiementSendFrais = TextEditingController();
  TextEditingController paiementSendNetPayer = TextEditingController();
  TextEditingController paiementSendMontantLettre = TextEditingController();
  TextEditingController paiementSendReglementTotal = TextEditingController();
  TextEditingController paiementSendRestePayer = TextEditingController();

  OptionItem optionItemAnneeConvers =
  OptionItem(id: null, title: 'Selectionné année');

  OptionItem optionItemSelected =
      OptionItem(id: null, title: "Selectionner Sexe");

  OptionItem optionItemSituationMSelected =
      OptionItem(id: null, title: "Selectionner Situation Ma.");

  OptionItem optionItemCiviliteSelected =
      OptionItem(id: null, title: "Selectionner Civilité");

  OptionItem optionItemTshirtSelected =
      OptionItem(id: null, title: "Selectionner Taille T-shirt");

  OptionItem optionItemBaptiseEspritSelected =
      OptionItem(id: null, title: "Selectionner Baptisé(e) du Saint Esprit");

      OptionItem optionItemFrequencePriereSelected =
      OptionItem(id: null, title: "Selectionner Frequence de Priere");

  var montant_chiffre;
  var frais;
  var net_payer;

  var old_sold;
  var scolarite;

  var reste_tr;
  var totale_tr;
  var reste;

  Map<String, dynamic> values = {};

  var uuid = Uuid();

  Future<void> _goToPay(double amount, PaiementSend paiement) async {
    String apiKey = "6440994495c066a6b5c3118.48292011";
    int siteId = 725853;
    String notifyUrl = "https://zoe.porteursdevie.org/p/notif";
    String currency = "XOF";
    String designation = "CinetPay Paiement Porteur de Vie";
    String transId = uuid.v1(); //"CGYFFT8Y8J9U2"; // Mettre en place un endpoint pour générer un ID de transaction unique dans votre base de données
    String custom = uuid.v1(); //"CGYFFT8Y8J9U2";
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CinetPaymentScreen(apiKey, siteId, notifyUrl,
                amount, transId, currency, designation, custom, paiement)));
  }

  Future<void> _infosPerso() async {
    if (c.updateInfoPersonResponse!.status == 1) {
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => AlertDialog(
              contextIn: context,
              icon: Icons.check,
              color: Colors.lightGreenAccent,
              title: "Succès",
              description: c.updateInfoPersonResponse!.flash));
    } else {
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => AlertDialog(
              contextIn: context,
              icon: Icons.clear,
              color: Colors.redAccent,
              title: 'Erreur',
              description: c.updateInfoPersonResponse!.flash));
    }
  }

  var hauteur;
  var largeur;

  late double screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    hauteur = MediaQuery.of(context).size.height;
    largeur = MediaQuery.of(context).size.width;
     var size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            drawer: NavigationDrawerWidget(navIndex, (int index) {
              setState(() {
                navIndex = index;
              });
            }),
            appBar: AppBar(
              elevation: 0.0,
              actions: [
                IconButton(
                  icon: const Icon(Icons.refresh_outlined),
                  tooltip: 'Actualiser',
                  onPressed: () {
                    c.getStudentDetailData();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Actualiser avec success')));
                  },
                ),
              ],
              bottom: const TabBar(
                indicatorColor: Colors.white,
                indicatorWeight: 2.5,
                isScrollable: true,
                tabs:  [
                  Tab(
                    icon: Icon(Icons.home_filled),
                    text: "Infos personelles",
                  ),
                  Tab(
                    icon: Icon(Icons.person),
                    text: "Infos spirituelles",
                  ),
                  Tab(
                    icon: Icon(Icons.sticky_note_2),
                    text: "Nouveau Paiement",
                  ),
                  Tab(
                    icon: Icon(Icons.check_circle),
                    text: "Les Paiement",
                  ),
                ],
              ),
              centerTitle: true,
              title: Text("Scolarité et Profil"),
              backgroundColor: hexToColor("#008bb2"),
            ),
            body: TabBarView(children: [
              Obx(() {
                if (c.isLoading.isFalse) {
                  if (c.detailStudent != null) {
                    updateInfoPerson.vs = c.detailStudent!.school!.vs;
                    updateInfoPerson.nom = c.detailStudent!.students!.fname;
                    updateInfoPerson.pnom = c.detailStudent!.students!.lname;
                    updateInfoPerson.naissance = Jiffy(
                            c.detailStudent!.students!.dateNaissance.toString())
                        .format("yyyy-MM-dd");
                    updateInfoPerson.habitation =
                        c.detailStudent!.students!.location;
                    updateInfoPerson.contact1 =
                        c.detailStudent!.students!.primaryPhoneV;
                    updateInfoPerson.contact2 =
                        c.detailStudent!.students!.secondaryPhoneV;
                    updateInfoPerson.email = c.detailStudent!.students!.email;
                    updateInfoPerson.facebook =
                        c.detailStudent!.students!.facebook;

                    if (c.detailStudent!.students!.sexeV == "H") {
                      updateInfoPerson.sexe = "1";
                      optionItemSelected = OptionItem(id: null, title: "Homme");
                      // print(c.detailStudent!.students!.sexeV);
                    } else if (c.detailStudent!.students!.sexeV == "F") {
                      updateInfoPerson.sexe = "2";
                      optionItemSelected = OptionItem(id: null, title: "Femme");
                    }

                    updateInfoPerson.matrimoniale =
                        c.detailStudent!.students!.matrimoniale.toString();

                    switch (
                        c.detailStudent!.students!.matrimoniale.toString()) {
                      case '1':
                        optionItemSituationMSelected =
                            OptionItem(id: null, title: 'Marié(e)');
                        break;
                      case '2':
                        optionItemSituationMSelected =
                            OptionItem(id: null, title: 'Célibataire');
                        break;
                      case '3':
                        optionItemSituationMSelected =
                            OptionItem(id: null, title: 'Veuf (ve)');
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

                    updateInfoPerson.civilite =
                        c.detailStudent!.students!.citizenV;

                    switch (c.detailStudent!.students!.citizenV) {
                      case '1':
                        optionItemCiviliteSelected =
                            OptionItem(id: null, title: 'Dr');
                        break;
                      case '2':
                        optionItemCiviliteSelected =
                            OptionItem(id: null, title: 'Réverand');
                        break;
                      case '3':
                        optionItemCiviliteSelected =
                            OptionItem(id: null, title: 'Pasteur');
                        break;
                      case '4':
                        optionItemCiviliteSelected =
                            OptionItem(id: null, title: 'M.');
                        break;
                      case '5':
                        optionItemCiviliteSelected =
                            OptionItem(id: null, title: 'Mme');
                        break;
                      case '6':
                        optionItemCiviliteSelected =
                            OptionItem(id: null, title: 'Mlle');
                        break;
                    }

                    updateInfoPerson.enfant =
                        c.detailStudent!.students!.nombreEnfant.toString();

                    updateInfoPerson.taille =
                        c.detailStudent!.students!.tailleV;

                    optionItemTshirtSelected = OptionItem(
                        id: null, title: c.detailStudent!.students!.tailleV);
                  }
                }
                return c.isLoading.isTrue
                    ? Container(
                          height: largeur,
                        width: hauteur,
                          child: Card(
                           // color: Colors.white38,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircularProgressIndicator(strokeWidth: 2,),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Chargement en cour ...',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        )
                    : c.detailStudent != null
                        ? Container(
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.all(20),
                            height: double.infinity,
                            child: Form(
                                key: _formKey,
                                child: ListView(
                                  children: [
                                    InputTextField(
                                      initialValue: c.detailStudent!.school!.vs,
                                      labelText: "Mon verset de l'année :",
                                      textInputType: TextInputType.text,
                                      onChange: (text) {
                                        updateInfoPerson.vs = text;
                                      },
                                      onValidate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Veuillez renseigner une mon verset de l\'année';
                                        }
                                      },
                                    ),
                                    InputTextField(
                                      initialValue: c
                                          .detailStudent!.students!.numero
                                          .toString(),
                                      labelText: "Matricule :",
                                      textInputType: TextInputType.text,
                                      editable: false,
                                    ),
                                    InputTextField(
                                      //controller: motif,
                                      initialValue:
                                          c.detailStudent!.students!.fname,
                                      labelText: "Nom :",
                                      textInputType: TextInputType.text,
                                      onChange: (text) {
                                        updateInfoPerson.nom = text;
                                      },
                                      onValidate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Veuillez renseigner une nom';
                                        }
                                      },
                                    ),
                                    InputTextField(
                                      //controller: motif,
                                      initialValue:
                                          c.detailStudent!.students!.lname,
                                      labelText: "Prénoms :",
                                      textInputType: TextInputType.text,
                                      onChange: (text) {
                                        updateInfoPerson.pnom = text;
                                      },
                                      onValidate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Veuillez renseigner une Prénoms';
                                        }
                                      },
                                    ),
                                    InputTextField(
                                      //controller: motif,
                                      initialValue: Jiffy(c.detailStudent!
                                              .students!.dateNaissance
                                              .toString())
                                          .format("yyyy-MM-dd"),
                                      textInputType: TextInputType.text,
                                      labelText: "Date de naissance :",
                                      //editable: false,
                                      onChange: (text) {
                                        updateInfoPerson.naissance = text;
                                      },
                                      onValidate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Veuillez renseigner une Date de naissance';
                                        }
                                      },
                                    ),
                                    InputTextField(
                                      //controller: motif,
                                      initialValue:
                                          c.detailStudent!.students!.location,
                                      labelText: "Lieu d'habitation :",
                                      textInputType: TextInputType.text,
                                      onChange: (text) {
                                        updateInfoPerson.habitation = text;
                                      },
                                      onValidate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Veuillez renseigner une Prénoms';
                                        }
                                      },
                                    ),
                                    InputTextField(
                                        initialValue: c.detailStudent!.students!
                                            .primaryPhoneV,
                                        labelText: "Téléphone 1 :",
                                        textInputType: TextInputType.phone,
                                        icon: Icons.phone_iphone,
                                        onChange: (text) {
                                          updateInfoPerson.contact1 = text;
                                          //controller.registerStudent.phone2 = text;
                                          //controller.resp.addAll({'phone2': text});
                                        },
                                        onValidate: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Veuillez renseigner Téléphone 1';
                                          }
                                        }),
                                    InputTextField(
                                        initialValue: c.detailStudent!.students!
                                            .secondaryPhoneV,
                                        labelText: "Téléphone 2 :",
                                        textInputType: TextInputType.phone,
                                        icon: Icons.phone_iphone,
                                        onChange: (text) {
                                          updateInfoPerson.contact2 = text;
                                          //controller.registerStudent.phone2 = text;
                                          //controller.resp.addAll({'phone2': text});// },
                                        },
                                        onValidate: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Veuillez renseigner Téléphone 2';
                                          }
                                        }),
                                    InputTextField(
                                        labelText: "Email :",
                                        initialValue:
                                            c.detailStudent!.students!.email,
                                        textInputType: TextInputType.text,
                                        icon: FontAwesomeIcons.mailBulk,
                                        //initialValue: controller.registerStudent.email,
                                        onChange: (text) {
                                          updateInfoPerson.email = text;
                                        },
                                        onValidate: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Veuillez renseigner Email';
                                          }
                                        },
                                        iconcolor: Colors.blue),
                                    InputTextField(
                                        labelText: "Facebook :",
                                        textInputType: TextInputType.text,
                                        icon: FontAwesomeIcons.facebook,
                                        initialValue:
                                            c.detailStudent!.students!.facebook,
                                        //initialValue: controller.registerStudent.facebook,
                                        onChange: (text) {
                                          updateInfoPerson.facebook = text;
                                          //controller.registerStudent.facebook = text;
                                          //controller.resp.addAll({'facebook': text});
                                        },
                                        onValidate: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Veuillez renseigner Facebook';
                                          }
                                        },
                                        iconcolor: Colors.blue),
                                    Divider(indent: 20),
                                    const Text(
                                      'Sexe',
                                      style: TextStyle(fontSize: 17),
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    SelectDropList(
                                      optionItemSelected,
                                      choices.ListGenreModel,
                                      Icons.bookmark,
                                      (optionItem) {
                                        setState(() {
                                          optionItemSelected = optionItem;
                                          if (optionItemSelected.id == '1') {
                                            updateInfoPerson.sexe = "H";
                                          } else {
                                            updateInfoPerson.sexe = "F";
                                          }
                                        });
                                      },
                                    ),
                                    Divider(indent: 20),
                                    SizedBox(
                                      height: 15,
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
                                          optionItemSituationMSelected =
                                              optionItem;
                                          updateInfoPerson.matrimoniale =
                                              optionItem.id;
                                        });
                                      },
                                    ),
                                    /* Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 2.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                new BorderRadius.circular(10.0),
                                          ),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: SmartSelect<String?>.single(
                                              selectedValue: c.detailStudent!
                                                  .students!.matrimoniale
                                                  .toString(),
                                              placeholder: 'Selectionné',
                                              title: 'Situation matrimoniale *',
                                              choiceItems:
                                                  choices.situationmatrimonial,
                                              onChange: (selected) {
                                                updateInfoPerson.matrimoniale =
                                                    selected.value!;
                                                //controller.stateValueInput(selected.value!);
                                                //controller.registerStudent.marital = selected.value;
                                                //controller.resp.addAll({'marital': selected.value!});
                                              },
                                              modalType:
                                                  S2ModalType.bottomSheet,
                                              choiceType: S2ChoiceType.radios,
                                              choiceStyle: S2ChoiceStyle(
                                                color: Colors.blueGrey,
                                              ),
                                              tileBuilder: (context, state) =>
                                                  S2Tile.fromState(
                                                state,
                                                isTwoLine: true,
                                              ),
                                            ),
                                          ),
                                        )), */
                                   const Divider(
                                      indent: 20,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                      'Civilité',
                                      style: TextStyle(fontSize: 17),
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    SelectDropList(
                                      optionItemCiviliteSelected,
                                      choices.ListCiviliteModel,
                                      Icons.bookmark,
                                      (optionItem) {
                                        setState(() {
                                          optionItemCiviliteSelected =
                                              optionItem;
                                          updateInfoPerson.civilite =
                                              optionItem.id;
                                        });
                                      },
                                    ),
                                    /* Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 2.0),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                new BorderRadius.circular(10.0),
                                          ),
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child:
                                                  SmartSelect<String?>.single(
                                                selectedValue: c.detailStudent!
                                                    .students!.citizenV,
                                                placeholder:
                                                    'Selectionné Civilité',
                                                title: "Civilité",
                                                choiceItems: choices.civilite,
                                                onChange: (selected) {
                                                  updateInfoPerson.civilite =
                                                      selected.value!;
                                                  // _mycontroller.stateValueInput(selected.value!);
                                                  // controller.registerStudent.civility = selected.value;
                                                  // controller.resp.addAll({'civility': selected.value!});
                                                },
                                                modalType:
                                                    S2ModalType.bottomSheet,
                                                choiceType: S2ChoiceType.radios,
                                                choiceStyle: S2ChoiceStyle(
                                                  color: Colors.blueGrey,
                                                ),
                                                tileBuilder: (context, state) =>
                                                    S2Tile.fromState(state,
                                                        isTwoLine: true),
                                              ))),
                                    ) */
                                    const Divider(
                                      indent: 20,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    InputTextField(
                                        labelText: "Nombre d'enfants",
                                        textInputType: TextInputType.number,
                                        initialValue: c.detailStudent!.students!
                                            .nombreEnfant
                                            .toString(),
                                        onChange: (val) {
                                          updateInfoPerson.enfant = val;
                                          //controller.registerStudent.children = val;
                                          //controller.resp.addAll({'children': val});
                                          //print(controller.registerStudent.toJson());
                                        },
                                        onValidate: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Veuillez renseigner Nombre d\' enfant';
                                          }
                                        }),
                                    const Divider(indent: 20),
                                    const Text(
                                      'Taille T-shirt',
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
                                          updateInfoPerson.taille =
                                              optionItem.id;
                                        });
                                      },
                                    ),
                                    /* Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 2.0),
                                        child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      10.0),
                                            ),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child:
                                                  SmartSelect<String?>.single(
                                                placeholder: 'Taille T-shirt',
                                                selectedValue: c.detailStudent!
                                                    .students!.tailleV,
                                                title: 'T-shirt',
                                                choiceItems: choices.tshirt,
                                                onChange: (selected) {
                                                  updateInfoPerson.taille =
                                                      selected.value!;
                                                  //controller.stateValueInput(selected.value!);
                                                  //controller.registerStudent.taille = selected.value;
                                                  //controller.resp.addAll({'taille': selected.toString()});
                                                },
                                                modalType:
                                                    S2ModalType.bottomSheet,
                                                choiceType: S2ChoiceType.radios,
                                                choiceStyle: S2ChoiceStyle(
                                                  color: Colors.blueGrey,
                                                ),
                                                tileBuilder: (context, state) =>
                                                    S2Tile.fromState(
                                                  state,
                                                  isTwoLine: true,
                                                ),
                                              ),
                                            ))), */
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    const Divider(indent: 20),
                                    MaterialButton(
                                        minWidth: 60.0,
                                        height: 50,
                                        color: Color(0xff008bb2),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            side: BorderSide(
                                                color: Colors.white38)),
                                        child: c.isLoadUpdate.isTrue
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              )
                                            : Text('Mettre à jour',
                                                style: new TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.white)),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            updateInfoPerson.uid = c
                                                .detailStudent!.students!.userId
                                                .toString();
                                            updateInfoPerson.sid = c
                                                .detailStudent!.students!.sid
                                                .toString();
                                            print(updateInfoPerson.toJson());
                                            c.UpdateInfoPerson(
                                                updateInfoPerson.toJson());
                                          }
                                        }),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                )))
                        : Container(
                            padding:
                                EdgeInsets.only(top: 100, left: 20, right: 20),
                            alignment: Alignment.center,
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image(
                                  image: AssetImage(Assets.no_internet),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Verifier votre connexion internet",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                MaterialButton(
                                  minWidth: 200.0,
                                  height: 50,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(color: Colors.blue)),
                                  child: Text(
                                    "Actualiser",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  onPressed: () {
                                    c.getStudentDetailData();
                                  },
                                )
                              ],
                            ),
                          );
              }),
              GetBuilder<AdministrateurDetailController>(builder: (c) {
                if (c.isLoading.isFalse) {
                  if (c.detailStudent != null) {
                    updateInfoSpirituel.spid = c
                        .detailStudent!.students!.detailsSpirituelsId
                        .toString();
                    updateInfoSpirituel.conversionDate =
                        c.detailStudent!.students!.conversionDateD;
                    updateInfoSpirituel.pageBiblique =
                        c.detailStudent!.students!.pageBiblique;
                    updateInfoSpirituel.dateBaptemeImmersion =
                        getbaptemeimmersion.text = c.dateBaptemeImmersion == ''
                            ? Jiffy(c.detailStudent!.students!.baptemeDateD!
                                    .toString())
                                .format("yyyy-MM-dd")
                            : c.dateBaptemeImmersion;

                    updateInfoSpirituel.baptemeEsprit =
                        c.detailStudent!.students!.spiritBaptN.toString();

                    switch (c.detailStudent!.students!.spiritBaptN.toString()) {
                      case '1':
                        optionItemBaptiseEspritSelected =
                            OptionItem(id: null, title: "Oui");
                        break;
                      case '0':
                        optionItemBaptiseEspritSelected =
                            OptionItem(id: null, title: "Non");
                        break;
                      case '2':
                      optionItemBaptiseEspritSelected =
                            OptionItem(id: null, title: "Je ne sais pas");
                        break;
                        case '3':
                      optionItemBaptiseEspritSelected =
                            OptionItem(id: null, title: "Autre");
                        break;
                    }

                    optionItemAnneeConvers.title = updateInfoSpirituel.inLangDate;
                    optionItemAnneeConvers.id = null;

                    updateInfoSpirituel.fardeau =
                        c.detailStudent!.students!.fardeau;
                    updateInfoSpirituel.inLang =
                        c.detailStudent!.students!.langueN.toString();

                    updateInfoSpirituel.inLangDate =
                        c.detailStudent!.students!.dlangueDateD;
                    updateInfoSpirituel.actif =
                        c.detailStudent!.students!.aAssemblee.toString();
                    updateInfoSpirituel.actifEglise =
                        c.detailStudent!.students!.eglise;
                    updateInfoSpirituel.actifDepartement =
                        c.detailStudent!.students!.departementV;
                    updateInfoSpirituel.convertis =
                        c.detailStudent!.students!.convPersN.toString();

                    updateInfoSpirituel.frequencePriere =
                        c.detailStudent!.students!.frequencePrayN;

                      switch (c.detailStudent!.students!.frequencePrayN) {
                        case '1':
                          optionItemFrequencePriereSelected =
                              OptionItem(id: null, title: "Quotidien");
                          break;
                        case '2':
                          optionItemFrequencePriereSelected =
                              OptionItem(id: null, title: "Quelques fois dans la semaine");
                          break;
                        case '3':
                          optionItemFrequencePriereSelected =
                              OptionItem(id: null, title: "Pas très souvent");
                          break;
                    }

                    updateInfoSpirituel.premierSujet =
                        c.detailStudent!.students!.dernierSujetV;

                    updateInfoSpirituel.aimeFaire =
                        c.detailStudent!.students!.aimeFaire;

                    updateInfoSpirituel.don = c.detailStudent!.students!.donV;

                    updateInfoSpirituel.donV =
                        c.detailStudent!.students!.detailDonV;
                  }
                }
                return c.isLoading.isTrue
                    ? 
                      Container(
                           height: 120.0,
                        width: 200.0,
                          child: Card(
                           // color: Colors.white38,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircularProgressIndicator(strokeWidth: 2,),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Chargement en cour ...',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        )
                    : c.detailStudent != null
                        ? Container(
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.all(20),
                            height: double.infinity,
                            child: Form(
                                key: _formKey2,
                                child: ListView(children: [
                                  InputTextField(
                                      //controller: yearofconversion,
                                      labelText: "Année de conversion :",
                                      textInputType: TextInputType.number,
                                      initialValue:
                                          updateInfoSpirituel.conversionDate,
                                      onChange: (val) {
                                        updateInfoSpirituel.conversionDate =
                                            val;
                                      },
                                      onValidate: (value) {
                                        return null;
                                      }),
                                  InputTextField(
                                      //controller: pagebiblique,
                                      labelText:
                                          "Passage Biblique de votre conversion",
                                      textInputType: TextInputType.text,
                                      initialValue:
                                          updateInfoSpirituel.pageBiblique,
                                      onChange: (val) {
                                        updateInfoSpirituel.pageBiblique = val;
                                      },
                                      onValidate: (value) {
                                        return null;
                                      }),
                                  DateTextField(
                                      labelText:
                                          'Date de Baptême par immersion :',
                                      controller: getbaptemeimmersion,
                                      onValidate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Veuillez renseigner votre date de immersion';
                                        }
                                      },
                                      selectDate: c.selectDatebaptemeimmersion),
                                  const Text(
                                    'Baptisé(e) du Saint Esprit',
                                    style: TextStyle(fontSize: 17),
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  SelectDropList(
                                    optionItemBaptiseEspritSelected,
                                    choices.ListBaptisEspModel,
                                    Icons.bookmark,
                                    (optionItem) {
                                      setState(() {
                                        optionItemBaptiseEspritSelected = optionItem;
                                        updateInfoSpirituel.baptemeEsprit =
                                            optionItem.id;
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
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
                                          initialValue:
                                              updateInfoSpirituel.fardeau,
                                          onChanged: (val) {
                                            updateInfoSpirituel.fardeau = val;
                                          },
                                          validator: (value) {
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                              hintText: "Champ de saisir",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          new Radius.circular(
                                                              15.0))),
                                              labelStyle: TextStyle(
                                                  color: Colors.white)),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
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
                                            c.modeEditParlerLangues == false
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      CustomRadioIndex(
                                                          txt: lstparlerlangues[
                                                              0],
                                                          index: 0,
                                                          selectedIndex:
                                                              updateInfoSpirituel
                                                                          .inLang ==
                                                                      "0"
                                                                  ? 0
                                                                  : c.selectedParlerLanguesIndex,
                                                          changeCustomIndex: () {
                                                            c.changeParlerLanguesIndex(
                                                                0);
                                                          }),
                                                      SizedBox(
                                                        width: 30,
                                                      ),
                                                      CustomRadioIndex(
                                                          txt: lstparlerlangues[
                                                              1],
                                                          index: 1,
                                                          selectedIndex:
                                                              updateInfoSpirituel
                                                                          .inLang ==
                                                                      "1"
                                                                  ? 1
                                                                  : c.selectedParlerLanguesIndex,
                                                          changeCustomIndex: () {
                                                            c.changeParlerLanguesIndex(
                                                                1);
                                                          }),
                                                    ],
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      CustomRadioIndex(
                                                          txt: lstparlerlangues[
                                                              0],
                                                          index: 0,
                                                          selectedIndex: c
                                                              .selectedParlerLanguesIndex,
                                                          changeCustomIndex:
                                                              () {
                                                            c.changeParlerLanguesIndex(
                                                                0);
                                                            updateInfoSpirituel
                                                                .inLang = "0";
                                                          }),
                                                      SizedBox(
                                                        width: 25,
                                                      ),
                                                      CustomRadioIndex(
                                                          txt: lstparlerlangues[
                                                              1],
                                                          index: 1,
                                                          selectedIndex: c
                                                              .selectedParlerLanguesIndex,
                                                          changeCustomIndex:
                                                              () {
                                                            c.changeParlerLanguesIndex(
                                                                1);
                                                            updateInfoSpirituel
                                                                .inLang = "1";
                                                          }),
                                                    ],
                                                  ),
                                          ])),
                                  c.enableYearPL
                                      ? GetBuilder<
                                              AdministrateurDetailController>(
                                          builder: (controller) {
                                          return SelectDropList(
                                            this.optionItemAnneeConvers,
                                            choices.ListAnneeModel,
                                            Icons.bookmark,
                                                (optionItem) {
                                              setState(() {
                                                optionItemAnneeConvers = optionItem;
                                                updateInfoSpirituel.inLangDate = optionItem.title;
                                                /*optionItemSelected = optionItem;
                                                if (optionItemSelected.id == '1') {
                                                  updateInfoPerson.sexe = "H";
                                                } else {
                                                  updateInfoPerson.sexe = "F";
                                                }*/
                                              });
                                            },
                                          );

                                            /*SmartSelect<String?>.single(
                                            selectedValue:
                                                updateInfoSpirituel.inLangDate,
                                            placeholder: 'Selectionné année',
                                            title: 'Depuis quelle année?',
                                            choiceItems: choices.annee,
                                            onChange: (selected) {
                                              updateInfoSpirituel.inLangDate =
                                                  selected.value!;
                                            },
                                            //onChange: (selected) => setState(() => _genre = selected.value),
                                            modalType: S2ModalType.bottomSheet,
                                            choiceType: S2ChoiceType.radios,
                                            choiceStyle: S2ChoiceStyle(
                                              color: Colors.blueGrey,
                                            ),
                                            tileBuilder: (context, state) =>
                                                S2Tile.fromState(
                                              state,
                                              isTwoLine: true,
                                            ),
                                          );*/
                                        })
                                      : Text(''),
                                  Padding(
                                      padding: EdgeInsets.all(7),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
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
                                            c.modeEditMActifs == false
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      CustomRadioIndex(
                                                        txt: lstmembreactifs[0],
                                                        index: 0,
                                                        selectedIndex:
                                                            updateInfoSpirituel
                                                                        .actif ==
                                                                    "0"
                                                                ? 0
                                                                : c.selectedMembreActifsIndex,
                                                        changeCustomIndex: () =>
                                                            c.changeMembreActifsIndex(
                                                                0),
                                                      ),
                                                      SizedBox(width: 50.0),
                                                      CustomRadioIndex(
                                                        txt: lstmembreactifs[1],
                                                        index: 1,
                                                        selectedIndex:
                                                            updateInfoSpirituel
                                                                        .actif ==
                                                                    "1"
                                                                ? 1
                                                                : c.selectedMembreActifsIndex,
                                                        changeCustomIndex: () =>
                                                            c.changeMembreActifsIndex(
                                                                1),
                                                      ),
                                                    ],
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      CustomRadioIndex(
                                                        txt: lstmembreactifs[0],
                                                        index: 0,
                                                        selectedIndex: c
                                                            .selectedMembreActifsIndex,
                                                        changeCustomIndex: () =>
                                                            {
                                                          c.changeMembreActifsIndex(
                                                              0),
                                                          updateInfoSpirituel
                                                              .actif = "0"
                                                        },
                                                      ),
                                                      SizedBox(width: 50.0),
                                                      CustomRadioIndex(
                                                        txt: lstmembreactifs[1],
                                                        index: 1,
                                                        selectedIndex: c
                                                            .selectedMembreActifsIndex,
                                                        changeCustomIndex: () =>
                                                            {
                                                          c.changeMembreActifsIndex(
                                                              1),
                                                          updateInfoSpirituel
                                                              .actif = "0"
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            c.enableMActifs
                                                ? Column(
                                                    children: [
                                                      InputTextField(
                                                          //controller: actifeglise,
                                                          labelText:
                                                              "Dans quelle église?",
                                                          textInputType:
                                                              TextInputType
                                                                  .text,
                                                          initialValue:
                                                              updateInfoSpirituel
                                                                  .actifEglise,
                                                          onChange: (val) {
                                                            updateInfoSpirituel
                                                                    .actifEglise =
                                                                val;
                                                          },
                                                          onValidate: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Veuillez renseigner un l\'église';
                                                            }
                                                          }),
                                                      InputTextField(
                                                          labelText:
                                                              "Dans quel departement?",
                                                          textInputType:
                                                              TextInputType
                                                                  .text,
                                                          initialValue:
                                                              updateInfoSpirituel
                                                                  .actifDepartement,
                                                          onChange: (val) {
                                                            updateInfoSpirituel
                                                                    .actifDepartement =
                                                                val;
                                                          },
                                                          onValidate: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Veuillez renseigner le Departement';
                                                            }
                                                          }),
                                                    ],
                                                  )
                                                : Text(''),
                                            Padding(
                                                padding: EdgeInsets.all(7),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        'Avez-vous déjà amené une personne à Christ?',
                                                        style: TextStyle(
                                                            fontSize: 17),
                                                        maxLines: 3,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.justify,
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      c.modeEditiPersChrist ==
                                                              false
                                                          ? Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: <
                                                                  Widget>[
                                                                CustomRadioIndex(
                                                                  txt:
                                                                      lstpersonnechrist[
                                                                          0],
                                                                  index: 0,
                                                                  selectedIndex:
                                                                      updateInfoSpirituel.convertis ==
                                                                              "0"
                                                                          ? 0
                                                                          : c.selectedPersonneChristIndex,
                                                                  changeCustomIndex:
                                                                      () => c
                                                                          .changePersonneChristIndex(
                                                                              0),
                                                                ),
                                                                //customRadioPersonneChrist(lstpersonnechrist[0], 0),
                                                                SizedBox(
                                                                    width:
                                                                        50.0),
                                                                CustomRadioIndex(
                                                                  txt:
                                                                      lstpersonnechrist[
                                                                          1],
                                                                  index: 1,
                                                                  selectedIndex:
                                                                      updateInfoSpirituel.convertis ==
                                                                              "1"
                                                                          ? 1
                                                                          : c.selectedPersonneChristIndex,
                                                                  changeCustomIndex:
                                                                      () => c
                                                                          .changePersonneChristIndex(
                                                                              1),
                                                                ),
                                                                //customRadioPersonneChrist(lstpersonnechrist[1], 1),
                                                              ],
                                                            )
                                                          : Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: <
                                                                  Widget>[
                                                                CustomRadioIndex(
                                                                  txt:
                                                                      lstpersonnechrist[
                                                                          0],
                                                                  index: 0,
                                                                  selectedIndex:
                                                                      c.selectedPersonneChristIndex,
                                                                  changeCustomIndex:
                                                                      () => {
                                                                    c.changePersonneChristIndex(
                                                                        0),
                                                                    updateInfoSpirituel
                                                                        .convertis = "0"
                                                                  },
                                                                ),
                                                                //customRadioPersonneChrist(lstpersonnechrist[0], 0),
                                                                SizedBox(
                                                                    width:
                                                                        50.0),
                                                                CustomRadioIndex(
                                                                  txt:
                                                                      lstpersonnechrist[
                                                                          1],
                                                                  index: 1,
                                                                  selectedIndex:
                                                                      c.selectedPersonneChristIndex,
                                                                  changeCustomIndex:
                                                                      () => {
                                                                    c.changePersonneChristIndex(
                                                                        1),
                                                                    updateInfoSpirituel
                                                                        .convertis = "1"
                                                                  },
                                                                ),
                                                                //customRadioPersonneChrist(lstpersonnechrist[1], 1),
                                                              ],
                                                            )
                                                    ])),
                                            Divider(indent: 20),
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
                                                setState(() {
                                                  optionItemFrequencePriereSelected =
                                                      optionItem;
                                                 updateInfoSpirituel
                                                          .frequencePriere =
                                                      optionItem.id;
                                                });
                                              },
                                            ),
                                            /* Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 2.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(10.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: SmartSelect<
                                                        String?>.single(
                                                      selectedValue:
                                                          updateInfoSpirituel
                                                              .frequencePriere,
                                                      placeholder:
                                                          'Selectionné fréquence de prière',
                                                      title:
                                                          'Fréquence de prière et de méditation de la Parole de Dieu',
                                                      choiceItems: choices
                                                          .frequencepriere,
                                                      onChange: (selected) {
                                                        //controller.stateValueInput(selected.value!);
                                                        // controller.registerStudent.frequencepriere = selected.value;
                                                        //controller.resp
                                                        //  .addAll({'frequence_priere': selected.value!});
                                                      },
                                                      modalType: S2ModalType
                                                          .bottomSheet,
                                                      choiceType:
                                                          S2ChoiceType.radios,
                                                      choiceStyle:
                                                          S2ChoiceStyle(
                                                        color: Colors.blueGrey,
                                                      ),
                                                      tileBuilder:
                                                          (context, state) =>
                                                              S2Tile.fromState(
                                                        state,
                                                        isTwoLine: true,
                                                      ),
                                                    ),
                                                  ),
                                                )), */
                                            Padding(
                                              padding: EdgeInsets.all(7),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Quel est le dernier sujet pour lequel vous avez cherché l\'exaucement? Precisez le sujet en une phrase',
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign:
                                                        TextAlign.justify,
                                                    style:
                                                        TextStyle(fontSize: 17),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextFormField(
                                                    keyboardType:
                                                        TextInputType.multiline,
                                                    maxLines: 4,
                                                    maxLength: 500,
                                                    initialValue: c
                                                        .detailStudent!
                                                        .students!
                                                        .dernierSujetV,
                                                    onChanged: (val) {
                                                      updateInfoSpirituel
                                                          .premierSujet = val;
                                                    },
                                                    validator: (value) {
                                                      return null;
                                                    },
                                                    //controller: derniersujet,
                                                    decoration: InputDecoration(
                                                        /* prefixIcon: Padding(
                                                  padding: EdgeInsets.all(0.0),
                                                  child: Icon(Icons.person,
                                                      size: 40.0, color: Colors.orange),
                                                ),*/
                                                        hintText:
                                                            "Champ de saisir",
                                                        hintStyle: TextStyle(
                                                            color: Colors.grey),
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    new Radius
                                                                            .circular(
                                                                        15.0))),
                                                        labelStyle: TextStyle(
                                                            color:
                                                                Colors.white)),
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
                                                    'qu\'aimez-vous faire avec joie et sans peine dans le Seigneur?',
                                                    style:
                                                        TextStyle(fontSize: 17),
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextFormField(
                                                    keyboardType:
                                                        TextInputType.multiline,
                                                    maxLines: 4,
                                                    maxLength: 500,
                                                    //controller: aimefaire,
                                                    initialValue:
                                                        updateInfoSpirituel
                                                            .aimeFaire,
                                                    onChanged: (val) {
                                                      updateInfoSpirituel
                                                          .aimeFaire = val;
                                                    },
                                                    validator: (value) {
                                                      return null;
                                                    },
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            "Champ de saisir",
                                                        hintStyle: TextStyle(
                                                            color: Colors.grey),
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    new Radius
                                                                            .circular(
                                                                        15.0))),
                                                        labelStyle: TextStyle(
                                                            color:
                                                                Colors.white)),
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
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        'Connaissez-vous vos dons et talents?',
                                                        style: TextStyle(
                                                            fontSize: 17),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      c.modeEditDonsTalents ==
                                                              false
                                                          ? Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: <
                                                                  Widget>[
                                                                CustomRadioIndex(
                                                                    txt:
                                                                        lstdonstalents[
                                                                            0],
                                                                    index: 0,
                                                                    selectedIndex:
                                                                        updateInfoSpirituel.don ==
                                                                                "0"
                                                                            ? 0
                                                                            : c
                                                                                .selectedDonsTalentsIndex,
                                                                    changeCustomIndex:
                                                                        () => c.changeDonsTalentsIndex(
                                                                            0)),
                                                                SizedBox(
                                                                  width: 50,
                                                                ),
                                                                CustomRadioIndex(
                                                                    txt:
                                                                        lstdonstalents[
                                                                            1],
                                                                    index: 1,
                                                                    selectedIndex:
                                                                        updateInfoSpirituel.don ==
                                                                                "1"
                                                                            ? 1
                                                                            : c
                                                                                .selectedDonsTalentsIndex,
                                                                    changeCustomIndex:
                                                                        () => c.changeDonsTalentsIndex(
                                                                            1)),
                                                                // customRadioDonsTalents(lstdonstalents[1], 1)
                                                              ],
                                                            )
                                                          : Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: <
                                                                  Widget>[
                                                                CustomRadioIndex(
                                                                    txt:
                                                                        lstdonstalents[
                                                                            0],
                                                                    index: 0,
                                                                    selectedIndex: c
                                                                        .selectedDonsTalentsIndex,
                                                                    changeCustomIndex:
                                                                        () => {
                                                                              updateInfoSpirituel.don = "0",
                                                                              c.changeDonsTalentsIndex(0)
                                                                            }),
                                                                SizedBox(
                                                                  width: 50,
                                                                ),
                                                                CustomRadioIndex(
                                                                    txt:
                                                                        lstdonstalents[
                                                                            1],
                                                                    index: 1,
                                                                    selectedIndex: c
                                                                        .selectedDonsTalentsIndex,
                                                                    changeCustomIndex:
                                                                        () => {
                                                                              updateInfoSpirituel.don = "1",
                                                                              c.changeDonsTalentsIndex(1)
                                                                            }),
                                                              ],
                                                            ),
                                                    ])),
                                            c.enableDonsTalents
                                                ? InputTextField(
                                                    // controller: donvaleur,
                                                    labelText:
                                                        "Précisez vos dons",
                                                    textInputType:
                                                        TextInputType.text,
                                                    initialValue:
                                                        updateInfoSpirituel
                                                            .donV,
                                                    onChange: (val) {
                                                      updateInfoSpirituel.donV =
                                                          val;
                                                    },
                                                    onValidate: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Veuillez renseigner un Lieu d\'habitation';
                                                      }
                                                    })
                                                : Text(''),
                                          ])),
                                  Divider(
                                    color: Colors.grey,
                                  ),
                                  MaterialButton(
                                      minWidth: 60.0,
                                      height: 50,
                                      color: Color(0xff008bb2),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          side: BorderSide(
                                              color: Colors.white38)),
                                      child: c.isLoadUpdateSpi.isTrue
                                          ? Center(
                                              child: CircularProgressIndicator(
                                                  color: Colors.white),
                                            )
                                          : Text('Mettre à jour',
                                              style: new TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.white)),
                                      onPressed: () => {
                                            //print(updateInfoSpirituel.toJson())
                                            if (_formKey2.currentState!
                                                .validate())
                                              {
                                                print(updateInfoSpirituel
                                                    .toJson()),
                                                c.UpdateInfoSpirituel(
                                                    updateInfoSpirituel
                                                        .toJson()),
                                              },
                                          }),
                                  SizedBox(
                                    height: 10,
                                  )
                                ])))
                        : Container(
                            padding:
                                EdgeInsets.only(top: 100, left: 20, right: 20),
                            alignment: Alignment.center,
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image(
                                  image: AssetImage(Assets.no_internet),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Verifier votre connexion internet",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                MaterialButton(
                                  minWidth: 200.0,
                                  height: 50,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(color: Colors.blue)),
                                  child: Text(
                                    "Actualiser",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  onPressed: () {
                                    c.getStudentDetailData();
                                  },
                                )
                              ],
                            ),
                          );
              }),
              Obx(() {
                if (c.detailStudent != null) {
                  paiementSend.campus =
                      c.detailStudent!.school!.campusId.toString();
                  paiementSend.uid =
                      c.detailStudent!.students!.userId.toString();
                  scolarite = paiementSend.scolarite =
                      c.detailStudent!.getEcoleScolarite.toString();
                  paiementSend.mode = "2";
                  old_sold = paiementSendReglementTotal.text =
                      c.detailStudent!.solde.toString();
                  reste = c.detailStudent!.getEcoleScolarite! -
                      c.detailStudent!.solde!.toInt();

                  paiementSend.reglementTotal = old_sold.toString();
                  paiementSend.reste = reste.toString();
                  paiementSend.sid = c.detailStudent!.students!.sid.toString();

                  switch (c.detailStudent!.getVersement) {
                    case 0:
                      values.addAll({
                        'Inscription': 1,
                      });
                      break;
                    case 1:
                      values.addAll({
                        '1er versement': 2,
                      });
                      break;
                    case 2:
                      values.addAll({
                        '2e versement': 3,
                      });
                      break;
                    case 3:
                      values.addAll({
                        '3e versement': 4,
                      });
                      break;
                    case 4:
                      values.addAll({
                        '4e versement': 5,
                      });
                      break;
                  }
                }
                return c.isLoading.isTrue
                    ? 
                  Container(
                        height: screenHeight,
                        width: screenWidth,
                        child: Card(
                          // color: Colors.white38,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Chargement en cour ...',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      )
                    : c.detailStudent != null
                        ? Container(
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.all(15),
                            height: double.infinity,
                            child: Form(
                                key: _formKey3,
                                child: ListView(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Ecole:  ${c.detailStudent!.getEcole}",
                                        style: TextStyle(
                                            color: Colors.orangeAccent,
                                            fontSize: 20),
                                      ),
                                      Text(
                                          "Scolarité: ${c.detailStudent!.getEcoleScolarite}",
                                          style: TextStyle(
                                              color: Colors.orangeAccent,
                                              fontSize: 20))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius:
                                              new BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, right: 15, top: 5),
                                          child: new DropdownButton<String>(
                                            hint: Text(evenement!),
                                            items:
                                                values.keys.map((String key) {
                                              return new DropdownMenuItem<
                                                  String>(
                                                value: key,
                                                child: new Text(key),
                                              );
                                            }).toList(),
                                            onChanged: (_) {
                                              setState(() {
                                                evenement = _;
                                                switch (_!) {
                                                  case 'Inscription':
                                                    paiementSend.motif = "1";
                                                    break;
                                                  case '1er versement':
                                                    paiementSend.motif = "2";
                                                    break;
                                                  case '2e versement':
                                                    paiementSend.motif = "3";
                                                    break;
                                                  case '3e versement':
                                                    paiementSend.motif = "4";
                                                    break;
                                                  case '4e versement':
                                                    paiementSend.motif = "5";
                                                    break;
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                      )),
                                  InputTextField(
                                    //initialValue: paiementSend.montantChiffre,
                                    controller: paiementSendMontantChiffre,
                                    labelText: "Montant en chiffre",
                                    textInputType: TextInputType.number,
                                    onChange: (text) {
                                      setState(() {
                                        paiementSend.montantChiffre = text;

                                        if (paiementSendMontantChiffre
                                                .text.length !=
                                            0) {
                                          montant_chiffre = int.parse(
                                              paiementSendMontantChiffre.text);
                                          frais =
                                              ((montant_chiffre! * 5) / 100);
                                          net_payer = frais + montant_chiffre;
                                          reste_tr = int.parse(scolarite) -
                                              (int.parse(old_sold) +
                                                  montant_chiffre);
                                          totale_tr = int.parse(old_sold) +
                                              montant_chiffre;

                                          paiementSend.frais = paiementSendFrais
                                              .text = frais.toString();
                                          paiementSend.netPayer =
                                              paiementSendNetPayer.text =
                                                  net_payer.toString();
                                          reste = reste_tr;
                                          paiementSendReglementTotal.text =
                                              totale_tr.toString();
                                          paiementSend.reglementTotal =
                                              totale_tr.toString();
                                          paiementSend.reste = reste.toString();

                                          c.setReglementTotalReste(
                                              paiementSend.reglementTotal
                                                  .toString(),
                                              paiementSend.reste.toString());
                                        } else {
                                          paiementSendMontantChiffre.text = "";
                                          frais = 0;
                                          net_payer = 0;
                                          paiementSendFrais.text =
                                              frais.toString();
                                          paiementSendNetPayer.text =
                                              net_payer.toString();
                                          c.reste = "";
                                          c.reglementTotal = "";
                                        }

                                        if (int.parse(c.reste!) < 0) {
                                          //Veuillez saisir une valeur correct, celle que vous avez saisir est supérieur au reste à payer
                                          paiementSendMontantChiffre.text = "";
                                          frais = 0;
                                          net_payer = 0;
                                          paiementSendFrais.text =
                                              frais.toString();
                                          paiementSendNetPayer.text =
                                              net_payer.toString();
                                          c.reste = "";
                                          c.reglementTotal = "";
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content: Text(
                                              "La valeur renseigner est supérieur au reste à payer",
                                            ),
                                            backgroundColor: Colors.redAccent,
                                          ));
                                        }
                                      });
                                    },
                                    onValidate: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Veuillez renseigner le montant en chiffre';
                                      }
                                    },
                                  ),
                                  InputTextField(
                                      // initialValue: paiementSend.frais,
                                      controller: paiementSendFrais,
                                      labelText: "Frais (5%):",
                                      editable: false,
                                      textInputType: TextInputType.number,
                                      onChange: (text) {
                                        //updateInfoPerson.vs = text;
                                      }),
                                  InputTextField(
                                    //initialValue: paiementSend.netPayer,
                                    controller: paiementSendNetPayer,
                                    labelText: "Total à payer:",
                                    editable: false,
                                    textInputType: TextInputType.number,
                                    onChange: (text) {
                                      //paiementSend.netPayer = text;
                                    },
                                  ),
                                  InputTextField(
                                    controller: paiementSendMontantLettre,
                                    //initialValue: paiementSend.montantLettre,
                                    labelText: "Montant en lettre:",
                                    textInputType: TextInputType.text,
                                    onChange: (text) {
                                      setState(() {
                                        paiementSend.montantLettre = text;
                                      });
                                    },
                                    onValidate: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Veuillez renseigner un montant en lettre:';
                                      }
                                    },
                                  ),
                                  c.reglementTotal!.length != 0
                                      ? InputTextField(
                                          initialValue: c.reglementTotal,
                                          labelText: "Total réglement",
                                          editable: false,
                                          textInputType: TextInputType.number,
                                          onChange: (text) {},
                                        )
                                      : InputTextField(
                                          initialValue:
                                              paiementSend.reglementTotal,
                                          labelText: "Total réglement",
                                          editable: false,
                                          textInputType: TextInputType.number,
                                          onChange: (text) {},
                                        ),
                                  c.reste!.length != 0
                                      ? InputTextField(
                                          initialValue: c.reste,
                                          labelText: "Reste à payer",
                                          editable: false,
                                          textInputType: TextInputType.number,
                                          onChange: (text) {},
                                        )
                                      : InputTextField(
                                          initialValue: reste.toString(),
                                          labelText: "Reste à payer",
                                          editable: false,
                                          textInputType: TextInputType.number,
                                          onChange: (text) {},
                                        ),
                                  MaterialButton(
                                      minWidth: 60.0,
                                      height: 50,
                                      color: Color(0xff008bb2),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          side: BorderSide(
                                              color: Colors.white38)),
                                      child: new Text('Valider le paiement',
                                          style: new TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.white)),
                                      onPressed: () async {
                                        if (paiementSend.motif == null ||
                                            paiementSend.montantChiffre ==
                                                null ||
                                            paiementSend.montantLettre ==
                                                null) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content: Text(
                                              'Veuillez renseigner les champs important',
                                            ),
                                            backgroundColor: Colors.redAccent,
                                          ));
                                        } else {
                                          String amount =
                                              paiementSendNetPayer.text;

                                          if (amount.isEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content: Text(
                                                "Le montant est obligatoire",
                                              ),
                                              backgroundColor: Colors.redAccent,
                                            ));
                                            return;
                                          }
                                          paiementSendNetPayer.clear();
                                          Navigator.of(context).pop();

                                          if (mounted) {
                                            setState(() {
                                              _loading = false;
                                            });
                                          }
                                          //print(paiementSend.toJson())
                                          //await c.cinetpayToBd(paiementSend.toJson());
                                          return await _goToPay(
                                              double.parse(amount),
                                              paiementSend);
                                        }
                                      }),
                                  Offstage(
                                    offstage: _loading,
                                    child: progressWidget(),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ])))
                        : Container(
                            padding:
                                EdgeInsets.only(top: 100, left: 20, right: 20),
                            alignment: Alignment.center,
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image(
                                  image: AssetImage(Assets.no_internet),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Verifier votre connexion internet",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                MaterialButton(
                                  minWidth: 200.0,
                                  height: 50,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(color: Colors.blue)),
                                  child: Text(
                                    "Actualiser",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  onPressed: () {
                                    c.getStudentDetailData();
                                  },
                                )
                              ],
                            ),
                          );
              }),
              Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(2),
                  height: double.infinity,
                  child: Obx(() => c.isLoading.isTrue
                      ? CircularProgressIndicator(strokeWidth: 2,)
                      : c.detailStudent != null
                          ? ListView(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              children: <Widget>[
                                  DataTable(
                                    headingRowColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => Colors.green),
                                    dataRowHeight: 50,
                                    headingRowHeight: 50,
                                    showCheckboxColumn: false,
                                    columns: <DataColumn>[
                                      DataColumn(
                                        label: Text('Date'),
                                      ),
                                      DataColumn(
                                        label: Text('Montant'),
                                      ),
                                      DataColumn(
                                        label: Text('Status'),
                                      ),
                                    ],
                                    rows: c.detailStudent!.versements!
                                        .map(
                                          ((Versement _versement) => DataRow(
                                                onSelectChanged: (isSelected) =>
                                                    {
                                                  setState(() {
                                                    Get.to(detailPaiment(
                                                        urlPdfPaiment:
                                                            _versement.url));
                                                  })
                                                },
                                                color: MaterialStateColor
                                                    .resolveWith((states) =>
                                                        Colors.white30),
                                                cells: <DataCell>[
                                                  DataCell(
                                                      Text(Jiffy(_versement
                                                              .createdAt
                                                              .toString())
                                                          .format(
                                                              "yyyy-MM-dd")),
                                                      onTap: () =>
                                                          print(_versement.id)),
                                                  DataCell(Text(_versement
                                                      .montant
                                                      .toString())), //Extracting from Map element the value
                                                  _versement.status == 0
                                                      ? DataCell(Container(
                                                          height: 30,
                                                          width: 60,
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Color(
                                                                    0x07000000),
                                                                blurRadius: 40,
                                                                offset: Offset(
                                                                    0, 10),
                                                              ),
                                                            ],
                                                            color: Colors
                                                                .orangeAccent,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    1),
                                                            child: Text(
                                                              "Echoué",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ))
                                                      : DataCell(Container(
                                                          height: 30,
                                                          width: 60,
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Color(
                                                                    0x07000000),
                                                                blurRadius: 40,
                                                                offset: Offset(
                                                                    0, 10),
                                                              ),
                                                            ],
                                                            color: hexToColor(
                                                                "#39b689"),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    1),
                                                            child: Text(
                                                              "Validé",
                                                              style: TextStyle(
                                                                fontSize: 12.0,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                ],
                                              )),
                                        )
                                        .toList(),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      margin: EdgeInsets.all(30),
                                      child: Text(
                                          "(*) Veuillez cliquer sur la ligne de paiement pour voir le reçu ...",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.teal,
                                              fontSize:
                                                  18)) /*Text(
                                        "(*) Pour imprimer le reçu, veuillez vous connecter à la version web.",
                                        textAlign: TextAlign.center)*/
                                      )
                                ])
                          : Container(
                              padding: EdgeInsets.only(
                                  top: 100, left: 20, right: 20),
                              alignment: Alignment.center,
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image(
                                    image: AssetImage(Assets.no_internet),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Verifier votre connexion internet",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  MaterialButton(
                                    minWidth: 200.0,
                                    height: 50,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(color: Colors.blue)),
                                    child: Text(
                                      "Actualiser",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    onPressed: () {
                                      c.getStudentDetailData();
                                    },
                                  )
                                ],
                              ),
                            )))
            ])));
  }

  Widget progressWidget() {
    return new Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("Veuillez patienter, initialisation du paiement",
                    textAlign: TextAlign.center),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class AlertDialog extends StatelessWidget {
  String? title, description;
  IconData? icon;
  Color? color;
  BuildContext? contextIn;

  AlertDialog(
      {@required this.contextIn,
      @required this.icon,
      @required this.color,
      @required this.title,
      @required this.description});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 100, bottom: 20, right: 20, left: 20),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title!,
                  style:
                      TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700)),
              SizedBox(height: 20.0),
              Text(
                description!,
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text("OK"),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: color,
            radius: 50,
            child: Icon(icon, color: Colors.white, size: 80),
          ),
        )
      ],
    );
  }
}
