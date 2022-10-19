import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import '../../../constants/Assets.dart';
import '../../../constants/color_constants.dart';
import '../../../widgets/components/loading_overlay.dart';
import '../../../widgets/components/navigation_drawer_widget.dart';
import 'package:get/get.dart';
import 'meditation_controller.dart';
import 'meditation_logs.dart';


class MeditationPage extends StatefulWidget {
  MeditationPage({Key? key}) : super(key: key);

  @override
  _MeditationPageState createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {

  TextEditingController action = TextEditingController();

  MeditationController controller = Get.find();

  TextEditingController meditation = TextEditingController();
  int navIndex = 6;
  TextEditingController priere = TextEditingController();
  TextEditingController revelation = TextEditingController();
  TextEditingController textToMeditate = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _validateaction = false;
  bool _validatemeditation = false;
  bool _validatepriere = false;
  bool _validaterevelation = false;
   bool _validatetextToMeditate = false;

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
                icon: const Icon(Icons.refresh),
                tooltip: 'Actualiser',
                onPressed: () {
                  controller.getMeditation();
                  controller.getLogsMeditation();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Actualiser avec success')));
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
            title: const Text("Meditation"),
            backgroundColor: hexToColor("#008bb2"),
          ),
          body: TabBarView(children: [
            GetBuilder<MeditationController>(
                initState: (_) => MeditationController,
                builder: (_) {
                  if (controller.isLoading.isFalse) {
                    if (controller.meditation!.nombre! > 0) {
                      textToMeditate.text =
                          controller.meditation!.textToMeditate!;
                      meditation.text = controller.meditation!.meditation!;
                      revelation.text = controller.meditation!.revelation!;
                      action.text = controller.meditation!.action!;
                      priere.text = controller.meditation!.priere!;
                    }
                  }
                  return LoadingOverlay(
                      isLoading: controller.isLoading.isTrue,
                      child: controller.meditation != null
                          ? Container(
                              alignment: Alignment.topCenter,
                              padding: const EdgeInsets.all(20),
                              height: double.infinity,
                              child: Form(
                                  key: _formKey,
                                  child: ListView(
                                      shrinkWrap: true,
                                      physics: const ClampingScrollPhysics(),
                                      children: <Widget>[
                                        controller.isLoading.isFalse
                                            ? controller.meditation!.nombre! > 0
                                                ? Container(
                                                    child: const Text(
                                                        "Votre Fiche de Meditation du Jour à bien été enregistré, aucune modification n'est possible."),
                                                    padding: const EdgeInsets.all(5),
                                                    margin: const EdgeInsets.only(
                                                        bottom: 10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      boxShadow: [
                                                        const BoxShadow(
                                                          color:
                                                              Color(0x07000000),
                                                          blurRadius: 40,
                                                          offset: Offset(0, 10),
                                                        ),
                                                      ],
                                                      color:
                                                          hexToColor("#a5daed"),
                                                    ),
                                                  )
                                                : const SizedBox(
                                                    height: 10,
                                                  )
                                            : const SizedBox(
                                                height: 1,
                                              ),
                                        const Text(
                                          "Méditation de la Parole de Dieu",
                                          style: TextStyle(
                                              color: Colors.deepOrange,
                                              fontSize: 18),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          "Verset à Mediter (Ecrire le ou les versets en entier):",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 9,
                                          maxLength: 2000,
                                          readOnly: controller.isLoading.isFalse
                                              ? (controller
                                                          .meditation!.nombre! >
                                                      0
                                                  ? true
                                                  : false)
                                              : false,
                                          controller: textToMeditate,
                                          decoration: InputDecoration(
                                              hintText:
                                                  "Verset à Mediter (Ecrire le ou les versets en entier):",
                                                  errorText: _validatetextToMeditate
                                                  ? 'Veuillez saisir un texte'
                                                  : null,
                                              hintStyle:
                                                  const TextStyle(color: Colors.grey),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          new Radius.circular(
                                                              15.0))),
                                              labelStyle: const TextStyle(
                                                  color: Colors.white)),
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        const Text(
                                          "Observation Interpretation et commentaires :",
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 9,
                                          controller: meditation,
                                          readOnly: controller.isLoading.isFalse
                                              ? controller.meditation!.nombre! >
                                                      0
                                                  ? true
                                                  : false
                                              : false,
                                          maxLength: 2000,
                                          /* validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Veuillez saisir un texte';
                                            }
                                            return null;
                                          }, */
                                          decoration: InputDecoration(
                                              hintText:
                                                  "Observation Interpretation et commentaires :",
                                                  errorText: _validatemeditation
                                                  ? 'Veuillez saisir un texte'
                                                  : null,
                                              hintStyle:
                                                  const TextStyle(color: Colors.grey),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          new Radius.circular(
                                                              15.0))),
                                              labelStyle: const TextStyle(
                                                  color: Colors.white)),
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        const Text(
                                          "Rhéma reçu :",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 9,
                                          maxLength: 2000,
                                          controller: revelation,
                                          readOnly: controller.isLoading.isFalse
                                              ? controller.meditation!.nombre! >
                                                      0
                                                  ? true
                                                  : false
                                              : false,
                                          /* validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Veuillez saisir un texte';
                                            }
                                            return null;
                                          }, */
                                          decoration: InputDecoration(
                                              hintText: "Rhéma reçu :",
                                                errorText: _validaterevelation
                                                  ? 'Veuillez saisir un texte'
                                                  : null,
                                              hintStyle:
                                                  const TextStyle(color: Colors.grey),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          new Radius.circular(
                                                              15.0))),
                                              labelStyle: const TextStyle(
                                                  color: Colors.white)),
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        const Text(
                                          "Action du jour à mener :",
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 9,
                                          maxLength: 2000,
                                          controller: action,
                                          readOnly: controller.isLoading.isFalse
                                              ? controller.meditation!.nombre! >
                                                      0
                                                  ? true
                                                  : false
                                              : false,
                                         /*  validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Veuillez saisir un texte';
                                            }
                                            return null;
                                          }, */
                                          decoration: InputDecoration(
                                              hintText:
                                                  "Action du jour à mener :",
                                              errorText: _validateaction
                                                  ? 'Veuillez saisir un texte'
                                                  : null,
                                              hintStyle:
                                                  const TextStyle(color: Colors.grey),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          new Radius.circular(
                                                              15.0))),
                                              labelStyle: const TextStyle(
                                                  color: Colors.white)),
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        const Text(
                                          "Ma prière :",
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 9,
                                          maxLength: 2000,
                                          controller: priere,
                                          readOnly: controller.isLoading.isFalse
                                              ? controller.meditation!.nombre! >
                                                      0
                                                  ? true
                                                  : false
                                              : false,
                                         /*  validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Veuillez saisir un texte';
                                            }
                                            return null;
                                          }, */
                                          decoration: InputDecoration(
                                              hintText:
                                                  "Action du jour à mener :",
                                               errorText: _validatepriere
                                                  ? 'Veuillez saisir un texte'
                                                  : null,
                                              hintStyle:const TextStyle(color: Colors.grey),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          new Radius.circular(15.0))),
                                              labelStyle: const TextStyle(
                                                  color: Colors.white)),
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        const Divider(),
                                        Obx(() {
                                          return LoadingOverlay(
                                              isLoading:
                                                  controller.isLoading.isTrue,
                                              child: controller
                                                          .meditation!.nombre! >
                                                      0
                                                  ? const SizedBox(
                                                      height: 1,
                                                    )
                                                  : MaterialButton(
                                                      minWidth: 60.0,
                                                      height: 40,
                                                      color: const Color(0xff008bb2),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              side: const BorderSide(
                                                                  color: Colors
                                                                      .white38)),
                                                      child: new Text('Valider',
                                                          style: new TextStyle(
                                                              fontSize: 16.0,
                                                              color: Colors
                                                                  .white)),
                                                      onPressed: () => {

                                                        setState(() {
                                                          textToMeditate.text.isEmpty ? _validatetextToMeditate = true : _validatetextToMeditate = false;
                                                          meditation.text.isEmpty ? _validatemeditation = true : _validatemeditation = false;
                                                          revelation.text.isEmpty ? _validaterevelation = true : _validaterevelation = false;
                                                          action.text.isEmpty ? _validateaction = true : _validateaction = false;
                                                          priere.text.isEmpty ? _validatepriere = true : _validatepriere = false;
                                                          if (_validatepriere == false && _validateaction ==
                                                                      false && _validaterevelation ==
                                                                      false && _validatetextToMeditate ==
                                                                      false && _validatemeditation == false)
                                                              { 
                                                                controller.resp.addAll({
                                                                  'textToMeditate':textToMeditate.text,
                                                                  'meditation':meditation.text,
                                                                  'revelation':revelation.text,
                                                                  'action':action.text,
                                                                  'priere':priere.text
                                                                });
                                                                
                                                                controller.addMeditation();
                                                        }
                                                      }),
                                                              
                                                          }));
                                        })
                                      ])))
                          : Container(
                              padding: const EdgeInsets.only(
                                  top: 100, left: 20, right: 20),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 100, left: 20, right: 20),
                                    alignment: Alignment.center,
                                    child: Column(
                                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Image(
                                          image: const AssetImage(Assets.no_internet),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          "Verifier votre connexion internet ou Contacter l'administrateur",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  MaterialButton(
                                    minWidth: 200.0,
                                    height: 50,
                                    color: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side:
                                            const BorderSide(color: Colors.white38)),
                                    child: const Text(
                                      "Actualiser",
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      controller.getMeditation();
                                      controller.getLogsMeditation();
                                    },
                                  )
                                ],
                              ),
                            ));
                }),
            Obx(() {
              return LoadingOverlay(
                  isLoading: controller.isLoadingLogs.isTrue,
                  child: controller.logsMeditation != null
                      ? Container(
                          alignment: Alignment.topCenter,
                          //padding: EdgeInsets.all(10),
                          height: double.infinity,
                          child: ListView.builder(
                              padding: const EdgeInsets.all(16.0),
                              itemCount: controller.logsMeditation == null
                                  ? 0
                                  : controller
                                      .logsMeditation!.fetchMeditations!.length,
                              itemBuilder: (context, i) {
                                //if (i.isOdd) return const Divider();
                                String txt = 'Fiche du ' +
                                    Jiffy(controller.logsMeditation!
                                            .fetchMeditations![i].createdAt
                                            .toString())
                                        .yMMMMd;
                                return Container(
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.calendar_today_sharp,
                                        color: hexToColor("#008bb2"),
                                      ),
                                      title: Text(
                                        txt,
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: hexToColor("#008bb2"),
                                            fontWeight: FontWeight.bold),
                                        textScaleFactor: 1.5,
                                      ),
                                      trailing: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.green,
                                        size: 38,
                                      ),
                                      subtitle: const Text(
                                        "meditation",
                                        style: const TextStyle(
                                            color: Colors.orange,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onTap: () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LogsMeditation(
                                                    meditation: controller
                                                        .logsMeditation!
                                                        .fetchMeditations![i]
                                                        .reponseMeditations,
                                                    txt: txt,
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
                          padding:
                              const EdgeInsets.only(top: 100, left: 20, right: 20),
                          alignment: Alignment.center,
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Image(
                                image: AssetImage(Assets.no_internet),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Verifier votre connexion internet",
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ));
            })
            /*Icon(Icons.directions_transit, size: 350),*/
          ]),
        ));
  }
}
