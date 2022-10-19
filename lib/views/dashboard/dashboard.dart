import 'package:flutter/material.dart';
import '../../constants/Assets.dart';
import '../../constants/color_constants.dart';
import '../../widgets/components/ItemDashboard.dart';
import '../../widgets/components/navigation_drawer_widget.dart';
import 'package:get/get.dart';
import 'dashboard_controller.dart';
import 'dashboard_provider.dart';
import 'package:new_version/new_version.dart';
import 'package:flutter/services.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final provider = Get.put(DashboardProvider());
  final controller = Get.put(DashboardController());

  late double screenWidth, screenHeight;
  int navIndex = 0;

  void _checkVersion() async {

    final newVersion = NewVersion(
      androidId: "org.porteursdevie.zoeporteursdevie",
    );

    final status = await newVersion.getVersionStatus();


    if(status!.localVersion != status.storeVersion){
      
      newVersion.showUpdateDialog(
        context: context,
        versionStatus: status,
        dialogTitle: "MISE À JOUR DISPONIBLE !!!",
        dismissButtonText: "Passer",
        dialogText: "Veuillez mettre à jour l'application de"
            "${status.localVersion}"
            " vers "
            "${status.storeVersion}",
        dismissAction: () {
          SystemNavigator.pop();
        },
        updateButtonText: "Mettre à jour",
      );
    }

    print("DEVICE : " + status.localVersion);
    print("STORE : " + status.storeVersion);

  } 

  @override
  void initState() {
    super.initState();
    //_checkVersion();
  }

  @override
  Widget build(BuildContext context) {
    
    var size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      drawer: NavigationDrawerWidget(navIndex, (int index) {
        setState(() {
          navIndex = index;
        });
      }),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: const Text("Tableau de Bord"),
        backgroundColor: hexToColor("#008bb2"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_outlined),
            tooltip: 'Actualiser',
            onPressed: () {
              controller.getStudentData();
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Actualiser avec success')));
            },
          ),
        ],
      ),
      body: SafeArea(
          child: GetBuilder<DashboardController>(
              initState: (_) => DashboardController,
              builder: (_) {
                return _.isLoading!.isTrue ?
                Container(
                  height: screenHeight,
                  width: screenWidth, 
                  child :Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                  )
                        )
                        :
                ListView(
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      children: <Widget>[
                        _.student != null
                            ? Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: ListView(
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  children: <Widget>[
                                    SizedBox(height: 15),
                                    Container(
                                      padding: EdgeInsets.only(
                                        bottom: 16,
                                        left: 16,
                                        right: 16,
                                      ),
                                      child: ListView(
                                        physics: ClampingScrollPhysics(),
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        shrinkWrap: true,
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Aperçu & Statistiques ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              ItemDashboard(
                                                pourcentage:
                                                    controller.student != null
                                                        ? controller
                                                            .student!
                                                            .apercuStatistique
                                                            .presence
                                                        : 0,
                                                image: AssetImage(
                                                    'assets/icons/Tres_bon.png'),
                                                libelle: 'Presence',
                                              ),
                                              ItemDashboard(
                                                pourcentage:
                                                    controller.student != null
                                                        ? controller
                                                            .student!
                                                            .apercuStatistique
                                                            .retart
                                                        : 0,
                                                icon: Icons.album,
                                                image: AssetImage(
                                                    'assets/icons/Tres_bon.png'),
                                                libelle: 'Retard',
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              ItemDashboard(
                                                pourcentage:
                                                    controller.student != null
                                                        ? controller
                                                            .student!
                                                            .apercuStatistique
                                                            .absJustifie
                                                        : 0,
                                                icon: Icons.account_circle,
                                                image: AssetImage(
                                                    'assets/icons/Faible.png'),
                                                libelle: 'Absence justifié',
                                              ),
                                              ItemDashboard(
                                                pourcentage:
                                                    controller.student != null
                                                        ? controller
                                                            .student!
                                                            .apercuStatistique
                                                            .absNonJustifie
                                                        : 0.toString() + " %",
                                                icon: Icons.album,
                                                image: AssetImage(
                                                    'assets/icons/Faible.png'),
                                                libelle: 'Absence non justifié',
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              ItemDashboard(
                                                pourcentage:
                                                    controller.student != null
                                                        ? controller
                                                            .student!
                                                            .apercuStatistique
                                                            .resume
                                                        : 0.toString() + " %",
                                                icon: Icons.account_circle,
                                                image: AssetImage(
                                                    'assets/icons/Mal.png'),
                                                libelle: 'Résumé',
                                              ),
                                              ItemDashboard(
                                                pourcentage: controller.student != null
                                                    ? controller
                                                    .student!
                                                    .apercuStatistique
                                                    .exercie
                                                    : 0.toString() + " %",
                                                icon: Icons.album,
                                                image: AssetImage(
                                                    'assets/icons/Mal.png'),
                                                libelle: 'Exercice',
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              ItemDashboard(
                                                pourcentage:  controller.student != null
                                                    ? controller
                                                    .student!
                                                    .apercuStatistique
                                                    .module
                                                    : 0.toString() + " %",
                                                icon: Icons.account_circle,
                                                image: AssetImage(
                                                    'assets/icons/Bon.png'),
                                                libelle: 'Modules',
                                              ),
                                              ItemDashboard(
                                                pourcentage: controller.student != null
                                                    ? controller
                                                    .student!
                                                    .apercuStatistique
                                                    .vertumetre
                                                    : 0.toString() + " %",
                                                icon: Icons.album,
                                                image: AssetImage(
                                                    'assets/icons/Faible.png'),
                                                libelle: 'Vertumètre ',
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          /*Align(
                                              alignment: Alignment.center,
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Module et Cours",
                                                    style: TextStyle(
                                                        color: hexToColor(
                                                            "#2564a9"),
                                                        fontSize: 20),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.all(7),
                                                    padding: EdgeInsets.only(
                                                        bottom: 10),
                                                    width: screenWidth,
                                                    height: 160,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffece8f2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                  )
                                                ],
                                              )),*/
                                          /*SizedBox(
                                            height: 10,
                                          ),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Vertumètre",
                                                    style: TextStyle(
                                                        color: hexToColor(
                                                            "#2564a9"),
                                                        fontSize: 20),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.all(7),
                                                    padding: EdgeInsets.only(
                                                        bottom: 10),
                                                    width: screenWidth,
                                                    height: 160,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffece8f2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                  )
                                                ],
                                              )),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Sujets de prière",
                                                    style: TextStyle(
                                                        color: hexToColor(
                                                            "#2564a9"),
                                                        fontSize: 20),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.all(7),
                                                    padding: EdgeInsets.only(
                                                        bottom: 10),
                                                    width: screenWidth,
                                                    height: 160,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffece8f2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                  )
                                                ],
                                              )),
                                          SizedBox(
                                            height: 50,
                                          ),*/
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Column(
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
                                  SizedBox(height: 30,),
                                  MaterialButton(
                                    minWidth: 200.0,
                                    height: 50,
                                    color: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side:
                                            BorderSide(color: Colors.white38)),
                                    child: Text("Actualiser",style: TextStyle(color: Colors.white),),
                                    onPressed: () {
                                      controller.getStudentData();
                                      Get.toNamed("/administrateur/detail");
                                    },
                                  )
                                ],
                              )
                      ],
                    );
              })),
    );
  }
}
