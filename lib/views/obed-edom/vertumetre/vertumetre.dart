import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import '../../../constants/Assets.dart';
import '../../../constants/Enums.dart';
import '../../../views/obed-edom/vertumetre/vertumetre_logs.dart';
import '../../../widgets/components/loading_overlay.dart';
import '../../../constants/color_constants.dart';
import 'vertumetre_controller.dart';
import '../../../widgets/components/InputTextField.dart';
import '../../../widgets/components/navigation_drawer_widget.dart';

class VertumetrePage extends StatefulWidget {
  VertumetrePage({Key? key}) : super(key: key);

  @override
  _VertumetrePageState createState() => _VertumetrePageState();
}

enum SingingCharacter { lafayette, jefferson }

class _VertumetrePageState extends State<VertumetrePage> {
  VertumetreController controller = Get.find();
  int navIndex = 5;
  Map<String, dynamic> values = {
    'Fruit de l’Esprit': false,
    'Caractère': false,
    'Mariage, Foyer': false,
    'Famille': false,
    'Salut des Âmes': false,
    'Professionnel': false,
    'Santé': false,
    'Ministère': false,
    'Eglise, Pasteurs': false
  };

  List vp_3 = [];

  SingingCharacter? _character = SingingCharacter.lafayette;
  Exo1Character _exo1character = Exo1Character.un;
  Exo2Character _exo2character = Exo2Character.un;
  Exo3Character _exo3character = Exo3Character.un;
  Exo4Character _exo4character = Exo4Character.un;
  Exo5Character _exo5character = Exo5Character.un;
  Exo6Character _exo6character = Exo6Character.un;
  M1Character _m1character = M1Character.un;
  M2Character _m2character = M2Character.un;
  M3Character _m3character = M3Character.un;
  PlanCharacter _plancharacter = PlanCharacter.un;
  Temoin3Character _temoin3character = Temoin3Character.un;
  Vp1Character? _vp1character = Vp1Character.un;
  Vp2Character? _vp2character = Vp2Character.un;
  Vp4Character? _vp4character = Vp4Character.un;

  TextEditingController soutienSujet = TextEditingController();
  TextEditingController precision = TextEditingController();
  TextEditingController enseiEcoute = TextEditingController();
  TextEditingController sujetPriereAutre = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: NavigationDrawerWidget(navIndex, (int index) {
              setState(() {
                navIndex = index;
              });
            }),
            appBar: AppBar(
              actions: [
                IconButton(
                  splashColor: Colors.black54,
                  icon: const Icon(Icons.refresh),
                  tooltip: 'Actualiser',
                  onPressed: () {
                    controller.getDataVertumetre();
                    controller.logsVertumetre();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Actualiser avec success')));
                  },
                ),
              ],
              bottom: const TabBar(
                indicatorColor: Colors.white,
                indicatorWeight: 2.5,
                tabs: [
                  Tab(
                    icon: Icon(Icons.home_filled),
                    text: "Renseigner Fiche",
                  ),
                  Tab(
                    icon: Icon(Icons.add),
                    text: "Mon Historique",
                  ),
                ],
              ),
              centerTitle: true,
              title: Text("Vertumètre"),
              backgroundColor: hexToColor("#008bb2"),
            ),
            body: TabBarView(
              children: [
                Obx(() {
                  if (controller.vertumetreData != null) {
                    if (controller.vertumetreData!.nombre != 0) {
                      soutienSujet.text =
                          controller.vertumetreData!.soutienSujet!;
                      precision.text =
                          controller.vertumetreData!.mediParolePprecisez!;
                      enseiEcoute.text =
                          controller.vertumetreData!.enseiEcoute!;
                      sujetPriereAutre.text =
                          (controller.vertumetreData!.nombre != 0
                              ? controller.vertumetreData!.sujetPriereAutre
                              : "")!;
                    }
                  }
                  return controller.isLoading.isTrue
                      ? Container(
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
                      : controller.vertumetreData != null
                          ? Container(
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.all(20),
                              height: double.infinity,
                              child: ListView(
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  children: <Widget>[
                                    controller.vertumetreData == null
                                        ? SizedBox(
                                            height: 0,
                                          )
                                        : controller.vertumetreData!.nombre! > 0
                                            ? Container(
                                                child: Text(
                                                    "Votre vertumètre de la semaine à bien été enregistré, aucune modification n'est possible."),
                                                padding: EdgeInsets.all(5),
                                                margin:
                                                    EdgeInsets.only(bottom: 10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0x07000000),
                                                      blurRadius: 40,
                                                      offset: Offset(0, 10),
                                                    ),
                                                  ],
                                                  color: hexToColor("#a5daed"),
                                                ),
                                              )
                                            : SizedBox(
                                                height: 0,
                                              ),
                                    Text(
                                      "I - VIE DE PRIERE ET DE JEÛNE",
                                      style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    //1)
                                    Text(
                                      "1 - Combien de fois vous priez chaque jour?",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Radio<Vp2Character>(
                                          value: Vp2Character.un,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .viePriere1! ==
                                                      true
                                                  ? _vp2character
                                                  : Vp2Character.deux
                                              : _vp2character,
                                          onChanged: (Vp2Character? value) {
                                            setState(() {
                                              _vp2character = value;
                                              controller
                                                  .onSelectVp2(_vp2character!);
                                            });
                                          },
                                        ),
                                        const Text(
                                            'Pas du tout (cette semaine)'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Vp2Character>(
                                          value: Vp2Character.deux,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .viePriere2! ==
                                                      true
                                                  ? _vp2character =
                                                      Vp2Character.deux
                                                  : _vp2character
                                              : _vp2character,
                                          onChanged: (Vp2Character? value) {
                                            setState(() {
                                              _vp2character = value;
                                              controller
                                                  .onSelectVp2(_vp2character!);
                                            });
                                          },
                                        ),
                                        const Text('1 fois'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Vp2Character>(
                                          value: Vp2Character.trois,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .viePriere3! ==
                                                      true
                                                  ? _vp2character =
                                                      Vp2Character.trois
                                                  : _vp2character
                                              : _vp2character,
                                          onChanged: (Vp2Character? value) {
                                            setState(() {
                                              _vp2character = value;
                                              controller
                                                  .onSelectVp2(_vp2character!);
                                            });
                                          },
                                        ),
                                        const Text('2 fois'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Vp2Character>(
                                          value: Vp2Character.quatre,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .viePriere4! ==
                                                      true
                                                  ? _vp2character =
                                                      Vp2Character.quatre
                                                  : _vp2character
                                              : _vp2character,
                                          onChanged: (Vp2Character? value) {
                                            setState(() {
                                              _vp2character = value;
                                              controller
                                                  .onSelectVp2(_vp2character!);
                                            });
                                          },
                                        ),
                                        const Text('3 fois et plus'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    //2)
                                    Text(
                                      "2 - Combien de temps durent vos temps de prière (moyenne par temps de prière) ?",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Radio<Vp1Character>(
                                          value: Vp1Character.un,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .tempsPriere1! ==
                                                      true
                                                  ? _vp1character
                                                  : Vp1Character.deux
                                              : _vp1character,
                                          onChanged: (Vp1Character? value) {
                                            setState(() {
                                              _vp1character = value;
                                              controller
                                                  .onSelectVp1(_vp1character!);
                                            });
                                          },
                                        ),
                                        const Text('00 - 15mn'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Vp1Character>(
                                          value: Vp1Character.deux,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .tempsPriere2! ==
                                                      true
                                                  ? _vp1character =
                                                      Vp1Character.deux
                                                  : _vp1character
                                              : _vp1character,
                                          onChanged: (Vp1Character? value) {
                                            setState(() {
                                              _vp1character = value;
                                              controller
                                                  .onSelectVp1(_vp1character!);
                                            });
                                          },
                                        ),
                                        const Text('15mn - 30mn'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Vp1Character>(
                                          value: Vp1Character.trois,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .tempsPriere3! ==
                                                      true
                                                  ? _vp1character =
                                                      Vp1Character.trois
                                                  : _vp1character
                                              : _vp1character,
                                          onChanged: (Vp1Character? value) {
                                            setState(() {
                                              _vp1character = value;
                                              controller
                                                  .onSelectVp1(_vp1character!);
                                            });
                                          },
                                        ),
                                        const Text('30mn - 1h'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Vp1Character>(
                                          value: Vp1Character.quatre,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .tempsPriere4! ==
                                                      true
                                                  ? _vp1character =
                                                      Vp1Character.quatre
                                                  : _vp1character
                                              : _vp1character,
                                          onChanged: (Vp1Character? value) {
                                            setState(() {
                                              _vp1character = value;
                                              controller
                                                  .onSelectVp1(_vp1character!);
                                            });
                                          },
                                        ),
                                        const Text('1h et plus'),
                                      ],
                                    ),
                                    //3
                                    Text(
                                      "3 - Combien de fois avez-vous jeûné cette semaine?",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Radio<Vp4Character>(
                                          value: Vp4Character.un,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .jeunePriere1 ==
                                                      true
                                                  ? _vp4character
                                                  : Vp4Character.deux
                                              : _vp4character,
                                          onChanged: (Vp4Character? value) {
                                            setState(() {
                                              _vp4character = value;
                                              controller
                                                  .onSelectVp4(_vp4character!);
                                            });
                                          },
                                        ),
                                        const Text(
                                            'Pas du tout (cette semaine)'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Vp4Character>(
                                          value: Vp4Character.deux,
                                          groupValue:
                                              controller.vertumetreData != null
                                                  ? controller.vertumetreData!
                                                              .jeunePriere2 ==
                                                          true
                                                      ? _vp4character =
                                                          Vp4Character.deux
                                                      : _vp4character
                                                  : _vp4character,
                                          onChanged: (Vp4Character? value) {
                                            setState(() {
                                              _vp4character = value;
                                              controller
                                                  .onSelectVp4(_vp4character!);
                                            });
                                          },
                                        ),
                                        const Text('1 fois'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Vp4Character>(
                                          value: Vp4Character.trois,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .jeunePriere3 ==
                                                      true
                                                  ? _vp4character =
                                                      Vp4Character.trois
                                                  : _vp4character
                                              : _vp4character,
                                          onChanged: (Vp4Character? value) {
                                            setState(() {
                                              _vp4character = value;
                                              controller
                                                  .onSelectVp4(_vp4character!);
                                            });
                                          },
                                        ),
                                        const Text('2 fois'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Vp4Character>(
                                          value: Vp4Character.quatre,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .jeunePriere4 ==
                                                      true
                                                  ? _vp4character =
                                                      Vp4Character.quatre
                                                  : _vp4character
                                              : _vp4character,
                                          onChanged: (Vp4Character? value) {
                                            setState(() {
                                              _vp4character = value;
                                              controller
                                                  .onSelectVp4(_vp4character!);
                                            });
                                          },
                                        ),
                                        const Text('3 fois et plus'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    //4
                                    Text(
                                      "4 - Sur quoi portent vos sujets de prières?",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    values != null
                                        ? Column(
                                            children: controller.vertumetreData!
                                                        .nombre ==
                                                    0
                                                ? values.keys.map((String key) {
                                                    return new CheckboxListTile(
                                                      title: Text(key),
                                                      value: values[key],
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          values[key] = value!;
                                                          switch (key) {
                                                            case 'Fruit de l’Esprit':
                                                              if (values[key] ==
                                                                  true) {
                                                                if (!vp_3
                                                                    .contains(
                                                                        1)) {
                                                                  vp_3.add(1);
                                                                }
                                                              } else {
                                                                vp_3.remove(1);
                                                              }
                                                              break;
                                                            case 'Caractère':
                                                              if (values[key] ==
                                                                  true) {
                                                                if (!vp_3
                                                                    .contains(
                                                                        2)) {
                                                                  vp_3.add(2);
                                                                }
                                                              } else {
                                                                vp_3.remove(2);
                                                              }
                                                              break;
                                                            case 'Mariage, Foyer':
                                                              if (values[key] ==
                                                                  true) {
                                                                if (!vp_3
                                                                    .contains(
                                                                        3)) {
                                                                  vp_3.add(3);
                                                                }
                                                              } else {
                                                                vp_3.remove(3);
                                                              }
                                                              break;
                                                            case 'Famille':
                                                              if (values[key] ==
                                                                  true) {
                                                                if (!vp_3
                                                                    .contains(
                                                                        4)) {
                                                                  vp_3.add(4);
                                                                }
                                                              } else {
                                                                vp_3.remove(4);
                                                              }
                                                              break;
                                                            case 'Salut des Âmes':
                                                              if (values[key] ==
                                                                  true) {
                                                                if (!vp_3
                                                                    .contains(
                                                                        5)) {
                                                                  vp_3.add(5);
                                                                }
                                                              } else {
                                                                vp_3.remove(5);
                                                              }
                                                              break;
                                                            case 'Professionnel':
                                                              if (values[key] ==
                                                                  true) {
                                                                if (!vp_3
                                                                    .contains(
                                                                        6)) {
                                                                  vp_3.add(6);
                                                                }
                                                              } else {
                                                                vp_3.remove(6);
                                                              }
                                                              break;
                                                            case 'Santé':
                                                              if (values[key] ==
                                                                  true) {
                                                                if (!vp_3
                                                                    .contains(
                                                                        7)) {
                                                                  vp_3.add(7);
                                                                }
                                                              } else {
                                                                vp_3.remove(7);
                                                              }
                                                              break;
                                                            case 'Ministère':
                                                              if (values[key] ==
                                                                  true) {
                                                                if (!vp_3
                                                                    .contains(
                                                                        8)) {
                                                                  vp_3.add(8);
                                                                }
                                                              } else {
                                                                vp_3.remove(8);
                                                              }
                                                              break;
                                                            case 'Eglise, Pasteurs':
                                                              if (values[key] ==
                                                                  true) {
                                                                if (!vp_3
                                                                    .contains(
                                                                        9)) {
                                                                  vp_3.add(9);
                                                                }
                                                              } else {
                                                                vp_3.remove(7);
                                                              }
                                                              break;
                                                          }
                                                        });
                                                      },
                                                    );
                                                  }).toList()
                                                : controller.vertumetreData!
                                                    .sujetPriere!.keys
                                                    .map((String key) {
                                                    return new CheckboxListTile(
                                                      title: Text(key),
                                                      value: controller
                                                          .vertumetreData!
                                                          .sujetPriere![key],
                                                      onChanged:
                                                          (bool? value) {},
                                                    );
                                                  }).toList())
                                        : SizedBox(
                                            height: 1,
                                          ),
                                    InputTextField(
                                      labelText: "Autre (précisez)",
                                      controller: sujetPriereAutre,
                                      //icon: Icons.business,
                                      /* initialValue:
                                          controller.vertumetreData!.nombre != 0
                                              ? controller.vertumetreData!
                                                  .sujetPriereAutre
                                              : "", */
                                      textInputType: TextInputType.text,
                                      onChange: (text) {
                                        controller.resp.addAll({'other': text});
                                      },
                                      /* onValidate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Veuillez renseigner une ville';
                                        }
                                      }, */
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    //5
                                    Text(
                                      "5 - Quel est le sujet pour lequel vous voulez qu'on vous soutienne en prière ?",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 4,
                                      maxLength: 500,
                                      controller: soutienSujet,
                                      /* initialValue:
                                          controller.vertumetreData!.nombre != 0
                                              ? controller
                                                  .vertumetreData!.soutienSujet
                                              : "", */
                                      onChanged: (val) {
                                        controller.resp.addAll({
                                          'soutien_sujet': soutienSujet.text
                                        });
                                      },
                                      validator: (value) {
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Champ de saisir",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  new Radius.circular(15.0))),
                                          labelStyle:
                                              TextStyle(color: Colors.white)),
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "II - MEDITATION DE LA PAROLE DE DIEU ET APPROFONDISSEMENT SPIRITUEL",
                                      style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    //II -1)
                                    Text(
                                      "1- Combien de fois vous méditez chaque jour?",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Radio<M2Character>(
                                          value: M2Character.un,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParoleJour1! ==
                                                      true
                                                  ? _m2character
                                                  : M2Character.deux
                                              : _m2character,
                                          onChanged: (M2Character? value) {
                                            setState(() {
                                              _m2character = value!;
                                              controller
                                                  .onSelectM2(_m2character);
                                            });
                                          },
                                        ),
                                        const Text(
                                            'Pas du tout (cette semaine)'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<M2Character>(
                                          value: M2Character.deux,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParoleJour2 ==
                                                      true
                                                  ? _m2character =
                                                      M2Character.deux
                                                  : _m2character
                                              : _m2character,
                                          onChanged: (M2Character? value) {
                                            setState(() {
                                              _m2character = value!;
                                              controller
                                                  .onSelectM2(_m2character);
                                            });
                                          },
                                        ),
                                        const Text('1 fois'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<M2Character>(
                                          value: M2Character.trois,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParoleJour3 ==
                                                      true
                                                  ? _m2character =
                                                      M2Character.trois
                                                  : _m2character
                                              : _m2character,
                                          onChanged: (M2Character? value) {
                                            setState(() {
                                              _m2character = value!;
                                              controller
                                                  .onSelectM2(_m2character);
                                            });
                                          },
                                        ),
                                        const Text('2 fois'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<M2Character>(
                                          value: M2Character.quatre,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParoleJour4 ==
                                                      true
                                                  ? _m2character =
                                                      M2Character.quatre
                                                  : _m2character
                                              : _m2character,
                                          onChanged: (M2Character? value) {
                                            setState(() {
                                              _m2character = value!;
                                              controller
                                                  .onSelectM2(_m2character);
                                            });
                                          },
                                        ),
                                        const Text('3 fois et plus'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    //II- 2)
                                    Text(
                                      "2 - Combien de temps durent vos méditations de la Parole de Dieu?",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Radio<M1Character>(
                                          value: M1Character.un,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParoleDuree1! ==
                                                      true
                                                  ? _m1character
                                                  : M1Character.deux
                                              : _m1character,
                                          onChanged: (M1Character? value) {
                                            setState(() {
                                              _m1character = value!;
                                              controller
                                                  .onSelectM1(_m1character);
                                            });
                                          },
                                        ),
                                        const Text('00 - 15mn'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<M1Character>(
                                          value: M1Character.deux,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParoleDuree2! ==
                                                      true
                                                  ? _m1character =
                                                      M1Character.deux
                                                  : _m1character
                                              : _m1character,
                                          onChanged: (M1Character? value) {
                                            setState(() {
                                              _m1character = value!;
                                              controller
                                                  .onSelectM1(_m1character);
                                            });
                                          },
                                        ),
                                        const Text('15mn - 30mn'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<M1Character>(
                                          value: M1Character.trois,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParoleDuree3! ==
                                                      true
                                                  ? _m1character =
                                                      M1Character.trois
                                                  : _m1character
                                              : _m1character,
                                          onChanged: (M1Character? value) {
                                            setState(() {
                                              _m1character = value!;
                                              controller
                                                  .onSelectM1(_m1character);
                                            });
                                          },
                                        ),
                                        const Text('30mn - 1h'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<M1Character>(
                                          value: M1Character.quatre,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParoleDuree4! ==
                                                      true
                                                  ? _m1character =
                                                      M1Character.quatre
                                                  : _m1character
                                              : _m1character,
                                          onChanged: (M1Character? value) {
                                            setState(() {
                                              _m1character = value!;
                                              controller
                                                  .onSelectM1(_m1character);
                                            });
                                          },
                                        ),
                                        const Text('1h et plus'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    //II- 3)
                                    Text(
                                      "3 - Volume de lecture de la Bible",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Radio<M3Character>(
                                          value: M3Character.un,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParoleVlecture1 ==
                                                      true
                                                  ? M3Character.un
                                                  : M3Character.deux
                                              : _m3character,
                                          onChanged: (M3Character? value) {
                                            setState(() {
                                              _m3character = value!;
                                              controller
                                                  .onSelectM3(_m3character);
                                            });
                                          },
                                        ),
                                        const Text(
                                            'Pas du tout (cette semaine)'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<M3Character>(
                                          value: M3Character.deux,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParoleVlecture2 ==
                                                      true
                                                  ? _m3character =
                                                      M3Character.deux
                                                  : _m3character
                                              : _m3character,
                                          onChanged: (M3Character? value) {
                                            setState(() {
                                              _m3character = value!;
                                              controller
                                                  .onSelectM3(_m3character);
                                            });
                                          },
                                        ),
                                        const Text('quelques versets'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<M3Character>(
                                          value: M3Character.trois,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParoleVlecture3 ==
                                                      true
                                                  ? _m3character =
                                                      M3Character.trois
                                                  : _m3character
                                              : _m3character,
                                          onChanged: (M3Character? value) {
                                            setState(() {
                                              _m3character = value!;
                                              controller
                                                  .onSelectM3(_m3character);
                                            });
                                          },
                                        ),
                                        const Text('tout un chapitre'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<M3Character>(
                                          value: M3Character.quatre,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParoleVlecture4 ==
                                                      true
                                                  ? _m3character =
                                                      M3Character.quatre
                                                  : _m3character
                                              : _m3character,
                                          onChanged: (M3Character? value) {
                                            setState(() {
                                              _m3character = value!;
                                              controller
                                                  .onSelectM3(_m3character);
                                            });
                                          },
                                        ),
                                        const Text('plus d’un chapitre'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    //II- 4)
                                    Text(
                                      "4 - Suivez-vous un plan de lecture de la Bible?",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Radio<PlanCharacter>(
                                          value: PlanCharacter.un,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParolePlecture1 ==
                                                      true
                                                  ? PlanCharacter.un
                                                  : PlanCharacter.deux
                                              : _plancharacter,
                                          onChanged: (PlanCharacter? value) {
                                            setState(() {
                                              _plancharacter = value!;
                                              controller
                                                  .onSelectPl(_plancharacter);
                                            });
                                          },
                                        ),
                                        const Text('Non'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<PlanCharacter>(
                                          value: PlanCharacter.deux,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParolePlecture2 ==
                                                      true
                                                  ? _plancharacter =
                                                      PlanCharacter.deux
                                                  : _plancharacter
                                              : _plancharacter,
                                          onChanged: (PlanCharacter? value) {
                                            setState(() {
                                              _plancharacter = value!;
                                              controller
                                                  .onSelectPl(_plancharacter);
                                            });
                                          },
                                        ),
                                        const Text('De temps en temps'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<PlanCharacter>(
                                          value: PlanCharacter.trois,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParolePlecture3 ==
                                                      true
                                                  ? _plancharacter =
                                                      PlanCharacter.trois
                                                  : _plancharacter
                                              : _plancharacter,
                                          onChanged: (PlanCharacter? value) {
                                            setState(() {
                                              _plancharacter = value!;
                                              controller
                                                  .onSelectPl(_plancharacter);
                                            });
                                          },
                                        ),
                                        const Text('Sur toute l\'année'),
                                      ],
                                    ),
                                    InputTextField(
                                      labelText: "Précisez",
                                      //icon: Icons.business,
                                      /* initialValue: "", */
                                      controller: precision,
                                      /* initialValue:  c.vertumetreData != null ? c.vertumetreData!.mediParolePprecisez! == "" ?
                                      "": c.vertumetreData!.mediParolePprecisez! : " ", */
                                      textInputType: TextInputType.text,
                                      onChange: (text) {
                                        controller.resp.addAll(
                                            {'precision': precision.text});
                                      },
                                      /* onValidate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Veuillez renseigner une ville';
                                        }
                                      }, */
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    //II- 4)
                                    Text(
                                      "5 - Quel(s) enseignement(s) avez-vous écouté cette semaine ?",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 4,
                                      maxLength: 500,
                                      controller: enseiEcoute,
                                      /* initialValue:
                                          controller.vertumetreData!.nombre != 0
                                              ? controller
                                                  .vertumetreData!.enseiEcoute!
                                              : " ", */
                                      onChanged: (val) {
                                        controller.resp.addAll({
                                          'enseignement_ecoute':
                                              enseiEcoute.text
                                        });
                                      },
                                      validator: (value) {
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Champ de saisir",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  new Radius.circular(15.0))),
                                          labelStyle:
                                              TextStyle(color: Colors.white)),
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    //II- 5)
                                    Text(
                                      "6 - Témoignage portant sur:",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Radio<Temoin3Character>(
                                          value: Temoin3Character.un,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParoleTemoi1 ==
                                                      true
                                                  ? Temoin3Character.un
                                                  : Temoin3Character.deux
                                              : _temoin3character,
                                          onChanged: (Temoin3Character? value) {
                                            setState(() {
                                              _temoin3character = value!;
                                              controller.onSelectT3(
                                                  _temoin3character);
                                            });
                                          },
                                        ),
                                        const Text('Fruit de l’Esprit'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Temoin3Character>(
                                          value: Temoin3Character.deux,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParoleTemoi2 ==
                                                      true
                                                  ? _temoin3character =
                                                      Temoin3Character.deux
                                                  : _temoin3character
                                              : _temoin3character,
                                          onChanged: (Temoin3Character? value) {
                                            setState(() {
                                              _temoin3character = value!;
                                              controller.onSelectT3(
                                                  _temoin3character);
                                            });
                                          },
                                        ),
                                        const Text('Caractère'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Temoin3Character>(
                                          value: Temoin3Character.trois,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParoleTemoi3 ==
                                                      true
                                                  ? _temoin3character =
                                                      Temoin3Character.trois
                                                  : _temoin3character
                                              : _temoin3character,
                                          onChanged: (Temoin3Character? value) {
                                            setState(() {
                                              _temoin3character = value!;
                                              controller.onSelectT3(
                                                  _temoin3character);
                                            });
                                          },
                                        ),
                                        const Text('Mariage, Foyer'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Temoin3Character>(
                                          value: Temoin3Character.quatre,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParoleTemoi4 ==
                                                      true
                                                  ? _temoin3character =
                                                      Temoin3Character.quatre
                                                  : _temoin3character
                                              : _temoin3character,
                                          onChanged: (Temoin3Character? value) {
                                            setState(() {
                                              _temoin3character = value!;
                                              controller.onSelectT3(
                                                  _temoin3character);
                                            });
                                          },
                                        ),
                                        const Text('Famille'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Temoin3Character>(
                                          value: Temoin3Character.cinq,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParoleTemoi5 ==
                                                      true
                                                  ? _temoin3character =
                                                      Temoin3Character.cinq
                                                  : _temoin3character
                                              : _temoin3character,
                                          onChanged: (Temoin3Character? value) {
                                            setState(() {
                                              _temoin3character = value!;
                                              controller.onSelectT3(
                                                  _temoin3character);
                                            });
                                          },
                                        ),
                                        const Text('Salut des Âmes'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Temoin3Character>(
                                          value: Temoin3Character.six,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParoleTemoi6 ==
                                                      true
                                                  ? _temoin3character =
                                                      Temoin3Character.six
                                                  : _temoin3character
                                              : _temoin3character,
                                          onChanged: (Temoin3Character? value) {
                                            setState(() {
                                              _temoin3character = value!;
                                              controller.onSelectT3(
                                                  _temoin3character);
                                            });
                                          },
                                        ),
                                        const Text('Professionnel'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Temoin3Character>(
                                          value: Temoin3Character.sept,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParoleTemoi7 ==
                                                      true
                                                  ? _temoin3character =
                                                      Temoin3Character.sept
                                                  : _temoin3character
                                              : _temoin3character,
                                          onChanged: (Temoin3Character? value) {
                                            setState(() {
                                              _temoin3character = value!;
                                              controller.onSelectT3(
                                                  _temoin3character);
                                            });
                                          },
                                        ),
                                        const Text('Santé'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Temoin3Character>(
                                          value: Temoin3Character.huit,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParoleTemoi8 ==
                                                      true
                                                  ? _temoin3character =
                                                      Temoin3Character.huit
                                                  : _temoin3character
                                              : _temoin3character,
                                          onChanged: (Temoin3Character? value) {
                                            setState(() {
                                              _temoin3character = value!;
                                              controller.onSelectT3(
                                                  _temoin3character);
                                            });
                                          },
                                        ),
                                        const Text('Ministère'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Temoin3Character>(
                                          value: Temoin3Character.neuf,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .mediParoleTemoi9 ==
                                                      true
                                                  ? _temoin3character =
                                                      Temoin3Character.neuf
                                                  : _temoin3character
                                              : _temoin3character,
                                          onChanged: (Temoin3Character? value) {
                                            setState(() {
                                              _temoin3character = value!;
                                              controller.onSelectT3(
                                                  _temoin3character);
                                            });
                                          },
                                        ),
                                        const Text('Eglise, Pasteurs'),
                                      ],
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 4,
                                      maxLength: 500,
                                      initialValue:
                                          controller.vertumetreData!.nombre != 0
                                              ? controller.vertumetreData!
                                                  .mediParoleTexplik
                                              : "",
                                      onChanged: (val) {
                                        controller.resp
                                            .addAll({'temoignage': val});
                                      },
                                      validator: (value) {
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Expliquez ici",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  new Radius.circular(15.0))),
                                          labelStyle:
                                              TextStyle(color: Colors.white)),
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "III - FRUIT DE L'ESPRIT & CARACTERE",
                                      style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Je m'examine à la lumière du Saint Esprit. Cette semaine:",
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    //III- 1)
                                    Text(
                                      "1 - Est-ce que j'ai réussi à toujours respecter les priorités que je me suis fixé(e)?",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo1Character>(
                                          value: Exo1Character.un,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx11 ==
                                                      true
                                                  ? Exo1Character.un
                                                  : Exo1Character.deux
                                              : _exo1character,
                                          onChanged: (Exo1Character? value) {
                                            setState(() {
                                              _exo1character = value!;
                                              controller
                                                  .onSelectExo1(_exo1character);
                                            });
                                          },
                                        ),
                                        Flexible(
                                            child: const Text(
                                                'Cette situation ne s\'est pas appliquée à moi cette semaine')),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo1Character>(
                                          value: Exo1Character.deux,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx12 ==
                                                      true
                                                  ? _exo1character =
                                                      Exo1Character.deux
                                                  : _exo1character
                                              : _exo1character,
                                          onChanged: (Exo1Character? value) {
                                            setState(() {
                                              _exo1character = value!;
                                              controller
                                                  .onSelectExo1(_exo1character);
                                            });
                                          },
                                        ),
                                        const Text(
                                            'Je n\'y arrive pas du tout '),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo1Character>(
                                          value: Exo1Character.trois,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx13 ==
                                                      true
                                                  ? _exo1character =
                                                      Exo1Character.trois
                                                  : _exo1character
                                              : _exo1character,
                                          onChanged: (Exo1Character? value) {
                                            setState(() {
                                              _exo1character = value!;
                                              controller
                                                  .onSelectExo1(_exo1character);
                                            });
                                          },
                                        ),
                                        Flexible(
                                            child: const Text(
                                                'J\'y arrive en partie (ou de temps en temps) ')),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo1Character>(
                                          value: Exo1Character.quatre,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx14 ==
                                                      true
                                                  ? _exo1character =
                                                      Exo1Character.quatre
                                                  : _exo1character
                                              : _exo1character,
                                          onChanged: (Exo1Character? value) {
                                            setState(() {
                                              _exo1character = value!;
                                              controller
                                                  .onSelectExo1(_exo1character);
                                            });
                                          },
                                        ),
                                        const Text(
                                            'J\'y arrive pleinement (ou toujours) '),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    //III- 1)
                                    Text(
                                      "2 - Est-ce que j'ai fait chaque fois ce que j'ai dit et est-ce que j'ai toujours dit ce que j'ai fait?",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo2Character>(
                                          value: Exo2Character.un,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx21 ==
                                                      true
                                                  ? Exo2Character.un
                                                  : Exo2Character.deux
                                              : _exo2character,
                                          onChanged: (Exo2Character? value) {
                                            setState(() {
                                              _exo2character = value!;
                                              controller
                                                  .onSelectExo2(_exo2character);
                                            });
                                          },
                                        ),
                                        Flexible(
                                            child: const Text(
                                                'Cette situation ne s\'est pas appliquée à moi cette semaine')),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo2Character>(
                                          value: Exo2Character.deux,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx22 ==
                                                      true
                                                  ? _exo2character =
                                                      Exo2Character.deux
                                                  : _exo2character
                                              : _exo2character,
                                          onChanged: (Exo2Character? value) {
                                            setState(() {
                                              _exo2character = value!;
                                              controller
                                                  .onSelectExo2(_exo2character);
                                            });
                                          },
                                        ),
                                        const Text(
                                            'Je n\'y arrive pas du tout '),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo2Character>(
                                          value: Exo2Character.trois,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx23 ==
                                                      true
                                                  ? _exo2character =
                                                      Exo2Character.trois
                                                  : _exo2character
                                              : _exo2character,
                                          onChanged: (Exo2Character? value) {
                                            setState(() {
                                              _exo2character = value!;
                                              controller
                                                  .onSelectExo2(_exo2character);
                                            });
                                          },
                                        ),
                                        Flexible(
                                            child: const Text(
                                                'J\'y arrive en partie (ou de temps en temps) ')),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo2Character>(
                                          value: Exo2Character.quatre,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx24 ==
                                                      true
                                                  ? _exo2character =
                                                      Exo2Character.quatre
                                                  : _exo2character
                                              : _exo2character,
                                          onChanged: (Exo2Character? value) {
                                            setState(() {
                                              _exo2character = value!;
                                              controller
                                                  .onSelectExo2(_exo2character);
                                            });
                                          },
                                        ),
                                        const Text(
                                            'J\'y arrive pleinement (ou toujours) '),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    //III- 3)
                                    Text(
                                      "3 - Est-ce que j'ai prié d'abord avant de faire toute chose?",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo3Character>(
                                          value: Exo3Character.un,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx31 ==
                                                      true
                                                  ? Exo3Character.un
                                                  : Exo3Character.deux
                                              : _exo3character,
                                          onChanged: (Exo3Character? value) {
                                            setState(() {
                                              _exo3character = value!;
                                              controller
                                                  .onSelectExo3(_exo3character);
                                            });
                                          },
                                        ),
                                        Flexible(
                                            child: const Text(
                                                'Cette situation ne s\'est pas appliquée à moi cette semaine')),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo3Character>(
                                          value: Exo3Character.deux,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx32 ==
                                                      true
                                                  ? _exo3character =
                                                      Exo3Character.deux
                                                  : _exo3character
                                              : _exo3character,
                                          onChanged: (Exo3Character? value) {
                                            setState(() {
                                              _exo3character = value!;
                                              controller
                                                  .onSelectExo3(_exo3character);
                                            });
                                          },
                                        ),
                                        const Text(
                                            'Je n\'y arrive pas du tout '),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo3Character>(
                                          value: Exo3Character.trois,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx33 ==
                                                      true
                                                  ? _exo3character =
                                                      Exo3Character.trois
                                                  : _exo3character
                                              : _exo3character,
                                          onChanged: (Exo3Character? value) {
                                            setState(() {
                                              _exo3character = value!;
                                              controller
                                                  .onSelectExo3(_exo3character);
                                            });
                                          },
                                        ),
                                        Flexible(
                                            child: const Text(
                                                'J\'y arrive en partie (ou de temps en temps) ')),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo3Character>(
                                          value: Exo3Character.quatre,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx34 ==
                                                      true
                                                  ? _exo3character =
                                                      Exo3Character.quatre
                                                  : _exo3character
                                              : _exo3character,
                                          onChanged: (Exo3Character? value) {
                                            setState(() {
                                              _exo3character = value!;
                                              controller
                                                  .onSelectExo3(_exo3character);
                                            });
                                          },
                                        ),
                                        const Text(
                                            'J\'y arrive pleinement (ou toujours) '),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    //III- 4)
                                    Text(
                                      "4 - Est-ce que j'ai vraiment pris le temps pour reconnaitre mes erreurs et demander pardon?",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo4Character>(
                                          value: Exo4Character.un,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx41 ==
                                                      true
                                                  ? Exo4Character.un
                                                  : Exo4Character.deux
                                              : _exo4character,
                                          onChanged: (Exo4Character? value) {
                                            setState(() {
                                              _exo4character = value!;
                                              controller
                                                  .onSelectExo4(_exo4character);
                                            });
                                          },
                                        ),
                                        Flexible(
                                            child: const Text(
                                                'Cette situation ne s\'est pas appliquée à moi cette semaine')),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo4Character>(
                                          value: Exo4Character.deux,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx42 ==
                                                      true
                                                  ? _exo4character =
                                                      Exo4Character.deux
                                                  : _exo4character
                                              : _exo4character,
                                          onChanged: (Exo4Character? value) {
                                            setState(() {
                                              _exo4character = value!;
                                              controller
                                                  .onSelectExo4(_exo4character);
                                            });
                                          },
                                        ),
                                        const Text(
                                            'Je n\'y arrive pas du tout '),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo4Character>(
                                          value: Exo4Character.trois,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx43 ==
                                                      true
                                                  ? _exo4character =
                                                      Exo4Character.trois
                                                  : _exo4character
                                              : _exo4character,
                                          onChanged: (Exo4Character? value) {
                                            setState(() {
                                              _exo4character = value!;
                                              controller
                                                  .onSelectExo4(_exo4character);
                                            });
                                          },
                                        ),
                                        Flexible(
                                            child: const Text(
                                                'J\'y arrive en partie (ou de temps en temps) ')),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo4Character>(
                                          value: Exo4Character.quatre,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx44 ==
                                                      true
                                                  ? _exo4character =
                                                      Exo4Character.quatre
                                                  : _exo4character
                                              : _exo4character,
                                          onChanged: (Exo4Character? value) {
                                            setState(() {
                                              _exo4character = value!;
                                              controller
                                                  .onSelectExo4(_exo4character);
                                            });
                                          },
                                        ),
                                        const Text(
                                            'J\'y arrive pleinement (ou toujours) '),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    //III- 5)
                                    Text(
                                      "5 - Est-ce que je me suis sentie énervé(e), irrité(e), vexé(e), frustré(e) ou humilié(e) par une situation ou une personne?",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo5Character>(
                                          value: Exo5Character.un,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx51 ==
                                                      true
                                                  ? Exo5Character.un
                                                  : Exo5Character.deux
                                              : _exo5character,
                                          onChanged: (Exo5Character? value) {
                                            setState(() {
                                              _exo5character = value!;
                                              controller
                                                  .onSelectExo5(_exo5character);
                                            });
                                          },
                                        ),
                                        Flexible(
                                            child: const Text(
                                                'Cette situation ne s\'est pas appliquée à moi cette semaine')),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo5Character>(
                                          value: Exo5Character.deux,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx52 ==
                                                      true
                                                  ? _exo5character =
                                                      Exo5Character.deux
                                                  : _exo5character
                                              : _exo5character,
                                          onChanged: (Exo5Character? value) {
                                            setState(() {
                                              _exo5character = value!;
                                              controller
                                                  .onSelectExo5(_exo5character);
                                            });
                                          },
                                        ),
                                        const Text('Très souvent'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo5Character>(
                                          value: Exo5Character.trois,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx53 ==
                                                      true
                                                  ? _exo5character =
                                                      Exo5Character.trois
                                                  : _exo5character
                                              : _exo5character,
                                          onChanged: (Exo5Character? value) {
                                            setState(() {
                                              _exo5character = value!;
                                              controller
                                                  .onSelectExo5(_exo5character);
                                            });
                                          },
                                        ),
                                        Flexible(
                                            child: const Text(
                                                'De temps en temps')),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo5Character>(
                                          value: Exo5Character.quatre,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx54 ==
                                                      true
                                                  ? _exo5character =
                                                      Exo5Character.quatre
                                                  : _exo5character
                                              : _exo5character,
                                          onChanged: (Exo5Character? value) {
                                            setState(() {
                                              _exo5character = value!;
                                              controller
                                                  .onSelectExo5(_exo5character);
                                            });
                                          },
                                        ),
                                        const Text('Pas du tout'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    //III- 6)
                                    Text(
                                      "6 - En cas de besoin, même le plus simple, est-ce que j'ai d'abord demandé à DIEU (même si j'ai les ressources pour trouver une solution)?",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo6Character>(
                                          value: Exo6Character.un,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx61 ==
                                                      true
                                                  ? Exo6Character.un
                                                  : Exo6Character.deux
                                              : _exo6character,
                                          onChanged: (Exo6Character? value) {
                                            setState(() {
                                              _exo6character = value!;
                                              controller
                                                  .onSelectExo6(_exo6character);
                                            });
                                          },
                                        ),
                                        Flexible(
                                            child: const Text(
                                                'Cette situation ne s\'est pas appliquée à moi cette semaine')),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo6Character>(
                                          value: Exo6Character.deux,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx62 ==
                                                      true
                                                  ? _exo6character =
                                                      Exo6Character.deux
                                                  : _exo6character
                                              : _exo6character,
                                          onChanged: (Exo6Character? value) {
                                            setState(() {
                                              _exo6character = value!;
                                              controller
                                                  .onSelectExo6(_exo6character);
                                            });
                                          },
                                        ),
                                        const Text(
                                            'Je n\'y arrive pas du tout '),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo6Character>(
                                          value: Exo6Character.trois,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx63 ==
                                                      true
                                                  ? _exo6character =
                                                      Exo6Character.trois
                                                  : _exo6character
                                              : _exo6character,
                                          onChanged: (Exo6Character? value) {
                                            setState(() {
                                              _exo6character = value!;
                                              controller
                                                  .onSelectExo6(_exo6character);
                                            });
                                          },
                                        ),
                                        Flexible(
                                            child: const Text(
                                                'J\'y arrive en partie (ou de temps en temps) ')),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<Exo6Character>(
                                          value: Exo6Character.quatre,
                                          groupValue: controller
                                                      .vertumetreData!.nombre !=
                                                  0
                                              ? controller.vertumetreData!
                                                          .examHebdoEx64 ==
                                                      true
                                                  ? _exo6character =
                                                      Exo6Character.quatre
                                                  : _exo6character
                                              : _exo6character,
                                          onChanged: (Exo6Character? value) {
                                            setState(() {
                                              _exo6character = value!;
                                              controller
                                                  .onSelectExo6(_exo6character);
                                            });
                                          },
                                        ),
                                        const Text(
                                            'J\'y arrive pleinement (ou toujours) '),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    controller.vertumetreData!.nombre != 0
                                        ? controller.vertumetreData!.nombre! > 0
                                            ? SizedBox(
                                                height: 1,
                                              )
                                            : SizedBox(
                                                height: 1,
                                              )
                                        : Obx(() {
                                            return LoadingOverlay(
                                                isLoading:
                                                    controller.isLoading.isTrue,
                                                child: MaterialButton(
                                                    minWidth: 60.0,
                                                    height: 40,
                                                    color: Color(0xff008bb2),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            side: BorderSide(
                                                                color: Colors
                                                                    .white38)),
                                                    child: new Text('Valider',
                                                        style: new TextStyle(
                                                            fontSize: 16.0,
                                                            color:
                                                                Colors.white)),
                                                    onPressed: () => {
                                                          controller.resp
                                                              .addAll({
                                                            'vp_3': vp_3
                                                          }),
                                                          //print(controller.resp),
                                                          controller
                                                              .addVertumetre()
                                                        }));
                                          })
                                  ]))
                          : Container(
                              padding: EdgeInsets.only(
                                  top: 100, left: 20, right: 20),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Container(
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
                                          "Verifier votre connexion internet ou Contacter l'administrateur",
                                          style: TextStyle(
                                            fontSize: 19,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  MaterialButton(
                                    minWidth: 200.0,
                                    height: 50,
                                    color: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side:
                                            BorderSide(color: Colors.white38)),
                                    child: Text(
                                      "Actualiser",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      controller.getDataVertumetre();
                                    },
                                  )
                                ],
                              ),
                            );
                }),
                //Icon(Icons.directions_transit, size: 350),
                Obx(() {
                  return controller.isLoadingHisto.isTrue
                      ? Container(
                          height: 120.0,
                          width: 200.0,
                          child: Card(
                            color: Colors.white38,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Charment en cour ...',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        )
                      : controller.histoVertumetre != null
                          ? Container(
                              alignment: Alignment.topCenter,
                              //padding: EdgeInsets.all(10),
                              height: double.infinity,
                              child: ListView.builder(
                                  padding: const EdgeInsets.all(16.0),
                                  itemCount: controller.histoVertumetre == null
                                      ? 0
                                      : controller.histoVertumetre!
                                          .fetchDataVertumetres!.length,
                                  itemBuilder: (context, i) {
                                    return Container(
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.calendar_today_sharp,
                                            color: hexToColor("#008bb2"),
                                          ),
                                          title: Text(
                                            'SEMAINE: ' +
                                                controller
                                                    .histoVertumetre!
                                                    .fetchDataVertumetres![i]
                                                    .weekNumber
                                                    .toString(),
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color: hexToColor("#008bb2"),
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.green,
                                            size: 38,
                                          ),
                                          subtitle: Text(
                                            Jiffy(controller
                                                    .histoVertumetre!
                                                    .fetchDataVertumetres![i]
                                                    .createdAt
                                                    .toString())
                                                .yMMMMd,
                                            style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onTap: () => {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      VertumetreLogs(
                                                        data: controller
                                                            .histoVertumetre!
                                                            .fetchDataVertumetres![
                                                                i]
                                                            .responseVertumetre,
                                                        fetchDataVertumetres:
                                                            controller
                                                                .histoVertumetre!
                                                                .fetchDataVertumetres![i],
                                                      )),
                                            )
                                          },
                                          //selected: true,
                                        ),
                                        decoration: new BoxDecoration(
                                            border: new Border(
                                                bottom: new BorderSide(
                                                    color: Colors.black12))));
                                  }))
                          : Container(
                              padding: EdgeInsets.only(
                                  top: 100, left: 20, right: 20),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Container(
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
                                          "Verifier votre connexion internet ou Contacter l'administrateur",
                                          style: TextStyle(
                                            fontSize: 19,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  MaterialButton(
                                    minWidth: 200.0,
                                    height: 50,
                                    color: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side:
                                            BorderSide(color: Colors.white38)),
                                    child: Text(
                                      "Actualiser",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      controller.logsVertumetre();
                                    },
                                  )
                                ],
                              ),
                            );
                })
              ],
            )));
  }
}
