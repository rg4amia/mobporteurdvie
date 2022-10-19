import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/color_constants.dart';
import '../../../Views/Academie/item/CourItem.dart';
import '../../../Views/Academie/module_course_show/module_course_show.dart';
import '../../../Views/Academie/module_course_show/module_course_show_binding.dart';
import '../../../Widgets/components/navigation_drawer_widget.dart';
import 'module_cours_controller.dart';

/*
class ModuleCoursPage extends StatefulWidget {
  const ModuleCoursPage({Key? key}) : super(key: key);
  @override
  _ModuleCoursPageState createState() => _ModuleCoursPageState();
}

class _ModuleCoursPageState extends State<ModuleCoursPage> {
  final controller = Get.put(ModuleCoursController());
  int navIndex = 3;
  var hauteur;
  var largeur;

  @override
  Widget build(BuildContext context) {
    hauteur = MediaQuery.of(context).size.height;
    largeur = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: NavigationDrawerWidget(navIndex, (int index) {
          setState(() {
            navIndex = index;
          });
        }),
        appBar: AppBar(
          centerTitle: true,
          title: Text("Modules & Cours"),
          backgroundColor: hexToColor("#008bb2"),
          actions: [
            IconButton(
              icon: const Icon(Icons.wifi_protected_setup),
              tooltip: 'Actualiser',
              onPressed: () {
                controller.chargeRenvoiTousModules();
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Actualiser avec success')));
              },
            ),
          ],
        ),
        body: SafeArea(
            child: ListView(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  top: 15
                ),
                child: Column(
                  children: [
                    Obx(() {
                      return controller.isLoading.isTrue
                          ? Container(
                        height: hauteur,
                        width: largeur,
                        child: Card(
                          color: Colors.white38,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircularProgressIndicator(),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text('Chargement en cour ...',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.blue)),
                            ],
                          ),
                        ),
                      )
                          :
                      controller.modules != null ?
                      Container(
                              margin: const EdgeInsets.only(top: 3),
                              padding: EdgeInsets.only(
                                bottom: 16,
                              ),
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CourItem(
                                          titremodule:
                                              controller.modules[index].moduleV,
                                          nbvalidate: controller
                                              .modules[index].nbValidate,
                                          nnbvalidate: controller
                                              .modules[index].nNbValidate,
                                          totalcourse: controller
                                              .modules[index].totalCourse,
                                          isLoading: controller.isLoading.value,
                                          keyVerif: controller
                                              .modules[index].key_verif,
                                          canAccessModule: controller
                                              .modules[index].can_access_module,
                                          onClickAction: () => {
                                                Get.to(
                                                    ModuleCourseShowPage(
                                                      moduleId: controller
                                                          .modules[index].id,
                                                      moduleTitle: controller
                                                          .modules[index]
                                                          .moduleV,
                                                      nbCour: controller
                                                          .modules[index]
                                                          .totalCourse,
                                                    ),
                                                    binding:
                                                        ModuleCoursShowBinding())
                                              })
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) => Divider(),
                                itemCount: controller.modules.length,
                              ),
                            )
                          :
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
                              "Verifier votre connexion internet",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    })
                  ],
                )),
          ],
        )));
  }
}
*/
