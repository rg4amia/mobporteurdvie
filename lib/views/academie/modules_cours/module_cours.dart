import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/Assets.dart';
import '../../../constants/Enums.dart';
import '../../../Constants/color_constants.dart';
import '../../../views/Academie/item/CourItem.dart';
import '../../../views/Academie/module_course_show/module_course_show.dart';
import '../../../views/Academie/module_course_show/module_course_show_binding.dart';
import '../../../widgets/components/navigation_drawer_widget.dart';
import 'module_cours_controller.dart';

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
          elevation: 0.0,
          title: const Text("Modules & Cours"),
          backgroundColor: hexToColor("#008bb2"),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh_outlined),
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
                padding:
                    EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 15),
                child: Column(
                  children: [
                    Obx(() {
                      return controller.isLoading.isTrue
                          ? SizedBox(
                            height: hauteur,
                            width: largeur,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
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
                        )
                          : controller.modules != null
                              ? Container(
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
                                              titremodule: controller
                                                  .modules[index].moduleV,
                                              nbvalidate: controller
                                                  .modules[index].nbValidate,
                                              nnbvalidate: controller
                                                  .modules[index].nNbValidate,
                                              totalcourse: controller
                                                  .modules[index].totalCourse,
                                              isLoading:
                                                  controller.isLoading.value,
                                              keyVerif: controller
                                                  .modules[index].key_verif,
                                              canAccessModule: controller
                                                  .modules[index]
                                                  .can_access_module,
                                              onClickAction: () => {
                                                    Get.to(
                                                        ModuleCourseShowPage(
                                                          moduleId: controller
                                                              .modules[index]
                                                              .id,
                                                          moduleTitle:
                                                              controller
                                                                  .modules[
                                                                      index]
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
                                    separatorBuilder: (context, index) =>
                                        Divider(),
                                    itemCount: controller.modules.length,
                                  ),
                                )
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
