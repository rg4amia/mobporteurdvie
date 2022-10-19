import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../constants/Assets.dart';
import '../../../constants/Enums.dart';
import '/constants/color_constants.dart';
import '/views/academie/item/audio_item.dart';
import 'cours_id_show_controller.dart';

class SudentCourseShowPage extends StatefulWidget {
  const SudentCourseShowPage({Key? key, this.coursId, this.courtheme})
      : super(key: key);

  final int? coursId;
  final String? courtheme;

  @override
  _SudentCourseShowPageState createState() => _SudentCourseShowPageState();
}

class _SudentCourseShowPageState extends State<SudentCourseShowPage> {
  String? courTheme;
  double? screenWidth, screenHeight;
  int? coursid;
  var width;
  int navIndex = 3;

  TextEditingController resume = new TextEditingController();
  String? resum;

  final controller = Get.find<CoursIdShowController>();

  //bool _character;
  List _selecteResponse = [];
  List _selecteQuestion = [];

  Map<String, dynamic> resp = {};

  @override
  void initState() {
    super.initState();
    courTheme = widget.courtheme;
    coursid = widget.coursId;
    fetchCourByIDStudent();
  }

  fetchCourByIDStudent() {
    controller.getCourseByIDFromStudent(coursid!);
  }

  void _onResponseSelected(bool selected, responseid, questionid) {
    if (selected == true) {
      if (_selecteQuestion.contains(questionid)) {
        var index = _selecteQuestion.indexOf(questionid);

        setState(() {
          _selecteResponse.removeAt(index);
          _selecteResponse.add(responseid);
        });
        return;
      } else {
        setState(() {
          _selecteResponse.add(responseid);
          _selecteQuestion.add(questionid);
        });
      }
    } else {
      setState(() {
        _selecteResponse.remove(responseid);
        _selecteQuestion.remove(questionid);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(courTheme!),
          backgroundColor: hexToColor("#008bb2"),
        ),
        body: SafeArea(
            child: ListView(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: <Widget>[
            Container(
                padding: const EdgeInsets.only(
                  bottom: 16,
                  left: 16,
                  right: 16,
                ),
                child: Obx(() {
                  return controller.isLoading.isTrue
                      ? SizedBox(
                          height: screenHeight,
                          width: screenWidth,
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
                          ))
                      : controller.studentcoursshowdata != null
                          ? Container(
                              margin: const EdgeInsets.only(top: 15),
                              padding: const EdgeInsets.only(
                                bottom: 16,
                              ),
                              child: ListView(
                                  physics: const ClampingScrollPhysics(),
                                  padding:  const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        boxShadow:[
                                          const BoxShadow(
                                            color: Color(0x07000000),
                                            blurRadius: 40,
                                            offset: Offset(0, 10),
                                          ),
                                        ],
                                        color: hexToColor("#fae6e2"),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 4.8,
                                            color: hexToColor("#da4e35"),
                                          ),
                                          Icon(
                                            FontAwesomeIcons.info,
                                            size: 26,
                                            color: hexToColor("#ca2525"),
                                          ),
                                          Expanded(
                                              child: controller.studentcoursshowdata ==
                                                      null
                                                  ? const Text("")
                                                  : controller.studentcoursshowdata!
                                                              .exercice !=
                                                          null
                                                      ?  Text(
                                                          "Une note de ${controller.studentcoursshowdata!.exercice!.requireNote} est requise pour valider ce cours",
                                                          style: const TextStyle(
                                                              fontSize: 14),
                                                          maxLines: 2)
                                                      : const Text("",style: TextStyle(fontSize: 14),maxLines: 2))
                                        ],
                                      ),
                                    ),
                                   const SizedBox(
                                      height: 10.4,
                                    ),
                                    Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Suivre le cours',
                                            style: TextStyle(
                                                color: hexToColor("#2564a9"),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(height: 7.50),
                                          Opacity(
                                            opacity: 0.30,
                                            child: Container(
                                              width: double.infinity,
                                              height: 0.50,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(0xff008bb2)),
                                              ),
                                            ),
                                          ),
                                         const SizedBox(height: 15.50),
                                          ListView.separated(
                                            shrinkWrap: true,
                                            physics: const ClampingScrollPhysics(),
                                            padding:
                                                const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            itemBuilder: (context, index) {
                                              return AudioItem(
                                                  mediaUrl: controller
                                                      .studentcoursshowdata!
                                                      .media![index]
                                                      .mediaUrl);
                                            },
                                            separatorBuilder:
                                                (context, index) => const Divider(),
                                            itemCount: controller
                                                        .studentcoursshowdata !=
                                                    null
                                                ? controller
                                                    .studentcoursshowdata!
                                                    .media!
                                                    .length
                                                : 0,
                                          ),
                                          const SizedBox(height: 12.50),
                                          Text(
                                            'Résumé du cours',
                                            style: TextStyle(
                                                color: hexToColor("#2564a9"),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(height: 7.50),
                                          Opacity(
                                            opacity: 0.30,
                                            child: Container(
                                              width: double.infinity,
                                              height: 0.50,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(0xff008bb2)),
                                              ),
                                            ),
                                          ),
                                          Obx(() {
                                            controller.studentcoursshowdata !=
                                                    null
                                                ? controller.studentcoursshowdata!.resume == ""
                                                    ? resume
                                                    : resume.text = controller.studentcoursshowdata!.resume!
                                                : "".toString();
                                            return Padding(
                                              padding: const EdgeInsets.only(top: 15),
                                              child: Column(
                                                children: [
                                                  TextFormField(
                                                    keyboardType:
                                                        TextInputType.multiline,
                                                    maxLines: 18,
                                                    initialValue: resume.text,
                                                    onChanged: (val) {
                                                      setState(() {
                                                        resum = val;
                                                      });
                                                    },
                                                    onSaved: (val) {},
                                                    validator: (value) {
                                                      //return null;
                                                    },
                                                    //controller: resume,
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            "Champ de saisir",
                                                        hintStyle: const TextStyle(
                                                            color:
                                                                Colors.black87),
                                                        border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.all(new Radius.circular(11.0))),
                                                        labelStyle: const TextStyle(
                                                            color:
                                                                Colors.white)),
                                                    style: const TextStyle(
                                                      fontSize: 13.5,
                                                    ),
                                                  ),
                                                 const Divider(),
                                                  MaterialButton(
                                                    minWidth: 410.0,
                                                    height: 45,
                                                    color: const Color(0xff008bb2),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            side: const BorderSide(
                                                                color: Colors
                                                                    .white60)),
                                                    child: controller
                                                            .isLoadadd.isTrue
                                                        ? const Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          )
                                                        : const Text('Enregistrer',
                                                            style:  TextStyle(
                                                                fontSize: 16.0,
                                                                color: Colors
                                                                    .white)),
                                                    onPressed: () => {
                                                      controller.addAndUpdateResume(
                                                          resum!,
                                                          controller
                                                              .studentcoursshowdata!
                                                              .cours!
                                                              .coursIdN!),
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(const SnackBar(
                                                              content: Text(
                                                                  'Le resumé à été ajouté avec succès')))
                                                      //fetchCourByIDStudent(),
                                                    },
                                                  ),
                                                  const Divider()
                                                ],
                                              ),
                                            );
                                          }),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Exercice du cours',
                                                style: TextStyle(
                                                    color:
                                                        hexToColor("#2564a9"),
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              (controller.studentcoursshowdata != null)
                                                  ? controller.studentcoursshowdata!.studentEvaluation != null
                                                      ? Container(
                                                          height: 30,
                                                          width: 70,
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                width: 3,
                                                                color: hexToColor(
                                                                    "#e0e5e8")),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            boxShadow: [
                                                              const BoxShadow(
                                                                color: const Color(
                                                                    0x07000000),
                                                                blurRadius: 40,
                                                                offset: const Offset(
                                                                    0, 10),
                                                              ),
                                                            ],
                                                            color: Colors.amber,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    1),
                                                            child: Text(
                                                              "${controller.studentcoursshowdata!.studentEvaluation!.note} / 20",
                                                              style: const TextStyle(
                                                                fontSize: 14.0,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      : const SizedBox(
                                                          height: 0.1,
                                                        )
                                                  : const SizedBox(
                                                      height: 0.1,
                                                    ),
                                            ],
                                          ),
                                          const SizedBox(height: 7.50),
                                          Opacity(
                                            opacity: 0.30,
                                            child: Container(
                                              width: double.infinity,
                                              height: 0.50,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(0xff008bb2)),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          controller.studentcoursshowdata!.exercice != null
                                              ? const SizedBox(
                                                  height: 0.1,
                                                )
                                              : Container(
                                                  color: hexToColor("#e0f6fc"),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        height: 60,
                                                        width: 4.8,
                                                        color: hexToColor(
                                                            "#26c1ec"),
                                                      ),
                                                      const SizedBox(
                                                        width: 15,
                                                      ),
                                                      Expanded(
                                                          child: Text(
                                                              "Pas d'exercice pour le moment",
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: hexToColor(
                                                                      "#5e676a")),
                                                              maxLines: 2))
                                                    ],
                                                  ),
                                                ),
                                          controller.studentcoursshowdata!.exercice == null
                                              ? const SizedBox(
                                                  height: 0.1,
                                                )
                                              : ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:const ClampingScrollPhysics(),
                                                  itemCount: controller.studentcoursshowdata != null
                                                      ? controller.studentcoursshowdata!.questions == null
                                                          ? 0 : controller.studentcoursshowdata!.questions!.length
                                                      : 0,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    var question = controller
                                                        .studentcoursshowdata!
                                                        .questions![index]
                                                        .question;
                                                    var response = controller
                                                        .studentcoursshowdata!
                                                        .questions![index]
                                                        .responses;
                                                    var indice = controller
                                                        .studentcoursshowdata!
                                                        .questions![index]
                                                        .indice
                                                        .toString();
                                                    var points = controller
                                                        .studentcoursshowdata!
                                                        .questions![index]
                                                        .point
                                                        .toString();
                                                    int? studentResponse = controller
                                                            .studentcoursshowdata!
                                                            .questions![index]
                                                            .studentResponse;

                                                    return Padding(
                                                        padding:const EdgeInsets.all(5),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                   BoxDecoration(
                                                                border: Border.all(
                                                                    color: hexToColor(
                                                                        "#e0e5e8")),
                                                                borderRadius:const  BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            5),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            5)),
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                    color: Color(
                                                                        0x07000000),
                                                                    blurRadius:
                                                                        40,
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            10),
                                                                  ),
                                                                ],
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              child: Column(
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: <
                                                                        Widget>[
                                                                      Container(
                                                                        height:
                                                                            30,
                                                                        width:
                                                                            30,
                                                                        alignment:
                                                                            Alignment.center,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20),
                                                                          boxShadow:const [
                                                                            BoxShadow(
                                                                              color: Color(0x07000000),
                                                                              blurRadius: 40,
                                                                              offset: Offset(0, 10),
                                                                            ),
                                                                          ],
                                                                          color:
                                                                              hexToColor("#39b689"),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:const EdgeInsets.all(1),
                                                                          child: Text(
                                                                            indice,
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 14.0,
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                     const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Expanded(
                                                                          child: Text(
                                                                              question!,
                                                                              style: TextStyle(fontSize: 14.0, color: hexToColor("#2564a9"), fontWeight: FontWeight.bold))),
                                                                      Container(
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          boxShadow:  [
                                                                            BoxShadow(
                                                                              color: const Color(0x07000000),
                                                                              blurRadius: 40,
                                                                              offset: Offset(0, 10),
                                                                            ),
                                                                          ],
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Container(
                                                                              height: 20,
                                                                              width: 4,
                                                                              color: hexToColor("#89c789"),
                                                                            ),
                                                                            const SizedBox(
                                                                              width: 2,
                                                                            ),
                                                                            Text(points + " Pts",
                                                                                style: TextStyle(fontSize: 13.0, color: hexToColor("#2c812c"), fontWeight: FontWeight.bold))
                                                                          ],
                                                                        ),
                                                                      ),
                                                                     const SizedBox(
                                                                        width: 15,
                                                                      ),
                                                                      (controller.studentcoursshowdata!.studentEvaluation != null &&
                                                                              controller.studentcoursshowdata!.studentEvaluation!.state == 1)
                                                                          ? controller.studentcoursshowdata!.questions![index].studentResponse != controller.studentcoursshowdata!.questions![index].repid
                                                                              ? Icon(
                                                                                  FontAwesomeIcons.frown,
                                                                                  color: hexToColor("#d93a3a"),
                                                                                  size: 24.0,
                                                                                )
                                                                              : Icon(
                                                                                  FontAwesomeIcons.smile,
                                                                                  color: hexToColor("#2a8564"),
                                                                                  size: 24.0,
                                                                                )
                                                                          : const Divider()
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Opacity(
                                                                    opacity:
                                                                        0.30,
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          0.50,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border: Border.all(color: const Color(0xff008bb2)),
                                                                      ),
                                                                    ),
                                                                  ), (controller.studentcoursshowdata!.studentEvaluation !=
                                                                              null &&
                                                                          controller.studentcoursshowdata!.studentEvaluation!.state ==
                                                                              1)
                                                                      ? ListView.separated(
                                                                          shrinkWrap: true,
                                                                          separatorBuilder: (context, ndex) => const Divider(),
                                                                          physics: const ClampingScrollPhysics(),
                                                                          itemCount: response == null ? 0 : response.length,
                                                                          itemBuilder: (BuildContextcontext, int index) {
                                                                            String?
                                                                                title =
                                                                                response![index].reponse;
                                                                            int?
                                                                                response_id =
                                                                                response[index].id;
                                                                            int?
                                                                                question_id =
                                                                                response[index].questionId;
                                                                            int student_response =
                                                                                studentResponse!;
                                                                            return (student_response != response[index].id)
                                                                                ? CheckboxListTile(
                                                                                    title:  Text(
                                                                                      title!,
                                                                                      style: const TextStyle(fontSize: 14),
                                                                                    ),
                                                                                    value: false,
                                                                                    activeColor: Colors.green,
                                                                                    onChanged: (bool? selected) {
                                                                                      //_onResponseSelected(selected, response_id, question_id);
                                                                                    },
                                                                                  )
                                                                                : CheckboxListTile(
                                                                                    title: Text(
                                                                                      title!,
                                                                                      style: const TextStyle(fontSize: 14),
                                                                                    ),
                                                                                    value: (student_response == response[index].id),
                                                                                    activeColor: Colors.green,
                                                                                    selected: false,
                                                                                    onChanged: (bool? value) {},
                                                                                  );
                                                                          })
                                                                      : ListView.separated(
                                                                          shrinkWrap: true,
                                                                          separatorBuilder: (context, ndex) => const Divider(),
                                                                          physics: const ClampingScrollPhysics(),
                                                                          itemCount: response != null ? response.length : 0,
                                                                          itemBuilder: (BuildContextcontext, int index) {
                                                                            String?
                                                                                title =
                                                                                response![index].reponse;
                                                                            int?
                                                                                response_id =
                                                                                response[index].id;
                                                                            int?
                                                                                question_id =
                                                                                response[index].questionId;
                                                                            int student_response =
                                                                                studentResponse!;
                                                                            return CheckboxListTile(
                                                                              title: Text(
                                                                                title!,
                                                                                style: const TextStyle(fontSize: 14),
                                                                              ),
                                                                              value: resp.containsValue(response_id),
                                                                              activeColor: Colors.green,
                                                                              onChanged: (bool? selected) {
                                                                                _onResponseSelected(selected!, response_id, question_id);
                                                                                setState(() {
                                                                                  resp.addAll({
                                                                                    "resp-$question_id": response_id,
                                                                                  });
                                                                                  // print(resp);
                                                                                });
                                                                                //print(resp);
                                                                              },
                                                                            );
                                                                          })
                                                                ],
                                                              ),
                                                              padding:const EdgeInsets.only(
                                                                      top: 5,
                                                                      left: 10,
                                                                      right:
                                                                          10),
                                                            ),
                                                            (controller.studentcoursshowdata!
                                                                            .studentEvaluation !=
                                                                        null &&
                                                                    controller
                                                                            .studentcoursshowdata!
                                                                            .studentEvaluation!
                                                                            .state ==
                                                                        1)
                                                                ? Container(
                                                                    padding:const EdgeInsets.all(6),
                                                                    width: double
                                                                        .infinity,
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    decoration: BoxDecoration(
                                                                        boxShadow: [
                                                                          const BoxShadow(
                                                                            color:
                                                                                Color(0x07000000),
                                                                            blurRadius:
                                                                                40,
                                                                            offset:
                                                                                Offset(0, 10),
                                                                          ),
                                                                        ],
                                                                        color: hexToColor("#d1ecf1")),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.topLeft,
                                                                          child:
                                                                              Text(
                                                                            "Bonne reponse: ",
                                                                            style:
                                                                                TextStyle(color: hexToColor("#0c5460")),
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Text(controller.studentcoursshowdata!.questions![index].bonnereponse.toString(), style: TextStyle(color: hexToColor("#0c5460"), fontWeight: FontWeight.bold)),
                                                                              ),
                                                                            ])
                                                                      ],
                                                                    ),
                                                                  )
                                                                : const Divider()
                                                          ],
                                                        ));
                                                  },
                                                ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Divider(),
                                          controller.studentcoursshowdata !=
                                                  null
                                              ? (controller.studentcoursshowdata!
                                                              .studentEvaluation !=
                                                          null &&
                                                      controller
                                                              .studentcoursshowdata!
                                                              .studentEvaluation!
                                                              .state ==
                                                          1)
                                                  ? const SizedBox(
                                                      height: 1,
                                                    )
                                                  : (controller.studentcoursshowdata!.exercice != null)
                                                      ? MaterialButton(
                                                          minWidth: 410.0,
                                                          height: 45,
                                                          color:const Color(0xff008bb2),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              side: const BorderSide(
                                                                  color: Colors
                                                                      .blueGrey)),
                                                          child: const Text(
                                                              'Valider l\'exercice',
                                                              style:  TextStyle(
                                                                  fontSize:
                                                                      16.0,
                                                                  color: Colors
                                                                      .white)),
                                                          onPressed: () => {
                                                            Get.defaultDialog(
                                                                title:
                                                                    "Confirmation",
                                                                content: Column(
                                                                  children: const [
                                                                     Icon(
                                                                      Icons
                                                                          .check,
                                                                      color: Colors
                                                                          .green,
                                                                      size: 45,
                                                                    ),
                                                                     Text(
                                                                      "Confirmer vous votre reponse ?",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16),
                                                                    )
                                                                  ],
                                                                ),
                                                                actions: <
                                                                    Widget>[
                                                                  MaterialButton(
                                                                    minWidth:
                                                                        100.0,
                                                                    height: 28,
                                                                    color: Colors
                                                                        .redAccent,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                8),
                                                                        side: const BorderSide(
                                                                            color:
                                                                                Colors.white38)),
                                                                    child:  const Text(
                                                                        'Annuler',
                                                                        style:  TextStyle(fontSize:
                                                                                16.0,color:
                                                                                Colors.white)),
                                                                    onPressed:
                                                                        () => {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(),
                                                                    },
                                                                  ),
                                                                  MaterialButton(
                                                                    minWidth:
                                                                        100.0,
                                                                    height: 28,
                                                                    color: const Color(0xff008bb2),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                8),
                                                                        side: const BorderSide(
                                                                            color:
                                                                                Colors.white38)),
                                                                    child:  const Text(
                                                                        'Confrimer',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16.0,
                                                                            color:
                                                                                Colors.white)),
                                                                    onPressed:
                                                                        () => {
                                                                      controller.addResponse(
                                                                          resp,
                                                                          controller
                                                                              .studentcoursshowdata!
                                                                              .exercice!
                                                                              .id),
                                                                      fetchCourByIDStudent(),
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(),
                                                                    },
                                                                  ),
                                                                ],titleStyle: const TextStyle(fontSize:18),
                                                                barrierDismissible:false
                                                                ),
                                                          },
                                                        )
                                                      : const SizedBox(
                                                          height: 1,
                                                        )
                                              : const SizedBox(
                                                  height: 1,
                                                ),
                                          const Divider()
                                        ])
                                  ]))
                          : Container(
                              padding: const EdgeInsets.only(
                                  top: 100, left: 20, right: 20),
                              alignment: Alignment.center,
                              child: Column(
                                children: const [
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
                }))
          ],
        )));
  }
}
