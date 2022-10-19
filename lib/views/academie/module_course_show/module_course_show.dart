import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/Assets.dart';
import '../../../constants/Enums.dart';
import '/constants/color_constants.dart';
import '/views/academie/cours_id_show/cours_id_show.dart';
import '/views/academie/cours_id_show/cours_id_show_binding.dart';
import '/views/academie/item/cours_by_moduleItem.dart';
import 'module_course_show_controller.dart';

class ModuleCourseShowPage extends StatefulWidget {
  const ModuleCourseShowPage({Key? key, this.moduleId, this.moduleTitle, this.nbCour}) : super(key: key);
  final moduleId;
  final String? moduleTitle;
  final int? nbCour;
  @override
  _ModuleCourseShowPageState createState() => _ModuleCourseShowPageState();
}

class _ModuleCourseShowPageState extends State<ModuleCourseShowPage> {
  double? screenWidth, screenHeight;
  String? moduletitle;
  int? nbcour;
  int navIndex = 3;

  final controller = Get.find<ModuleCoursShowController>();

  @override
  void initState() {
    super.initState();
    moduletitle = widget.moduleTitle;
    nbcour = widget.nbCour;
    controller.getSchoolFromStudent(widget.moduleId);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return
      Scaffold(
    appBar: AppBar(
    title: Text("$moduletitle >> $nbcour cours"),
    elevation: 0.0,
    backgroundColor: hexToColor("#008bb2"),
      actions: [
        IconButton(
          icon: const Icon(Icons.wifi_protected_setup),
          tooltip: 'Actualiser',
          onPressed: () {
            controller.getSchoolFromStudent(widget.moduleId);
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Actualiser avec success')));
          },
        ),
      ],
    ),
    body: SafeArea(
        child:
            ListView(
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
                                height: screenHeight,
                                width: screenWidth,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      'Chargement en cour ...',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.blue),
                                    ),
                                  ],
                                ))
                            :
                          controller.getbyschoolfromstudent != null ?
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
                                    CoursByModuleItem(
                                      moderateur: controller.getbyschoolfromstudent!.coursByModule![index].moderateur,
                                      orateur: controller.getbyschoolfromstudent!.coursByModule![index].orateur,
                                      courtheme: controller.getbyschoolfromstudent!.coursByModule![index].courtheme,
                                      evaluation: controller.getbyschoolfromstudent!.coursByModule![index].evaluation,
                                      prevevaluation: controller.getbyschoolfromstudent!.coursByModule![index].prevevaluation,
                                      validation: controller.getbyschoolfromstudent!.coursByModule![index].validation,
                                      onClickAction: () => {
                                        Get.to(
                                            SudentCourseShowPage(
                                              coursId: controller.getbyschoolfromstudent!.coursByModule![index].coursId,
                                              courtheme: controller.getbyschoolfromstudent!.coursByModule![index].courtheme,
                                            ),
                                            binding:CoursIdShowBinding()
                                        )
                                      },
                                    )
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  Divider(),
                              itemCount: controller.getbyschoolfromstudent != null ? controller
                                  .getbyschoolfromstudent!
                                  .coursByModule!
                                  .length : 0,
                            ),
                          ) : Container(
                            padding: EdgeInsets.only(
                                top: 100, left: 20, right: 20),
                            alignment: Alignment.center,
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image(
                                  image: AssetImage('assets/images/nointernet.png'),
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
            ),
            //BottomBar(),

        ));
  }

}