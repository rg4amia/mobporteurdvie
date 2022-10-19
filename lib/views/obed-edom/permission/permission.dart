import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/Assets.dart';
import '../../../constants/color_constants.dart';
import '../../../models/permission.dart';
import '../../../views/obed-edom/permission/permission_controller.dart';
import '../../../widgets/components/InputTextField.dart';
import '../../../widgets/components/loading_overlay.dart';
import '../../../widgets/components/navigation_drawer_widget.dart';

class PermissionPage extends StatefulWidget {
  PermissionPage({Key? key}) : super(key: key);
  @override
  _PermissionPageState createState() => _PermissionPageState();
}

enum SingingCharacter { lafayette, jefferson }

class _PermissionPageState extends State<PermissionPage> {
  int navIndex = 7;
  String? evenement = "----   Choisir  Evènement   ---";

  PermissionController controller = Get.find();

  final sujet = TextEditingController();
  final motif = TextEditingController();
  final evnement = TextEditingController();
  final message = TextEditingController();

  Map<String, dynamic> values = {
    'Activite': -1,
    'Reunion': -2,
    'Autre': -3,
  };

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
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 2.5,
              tabs: [
                Tab(
                  icon: Icon(Icons.home_filled),
                  text: "Faire une Demande",
                ),
                Tab(
                  icon: Icon(Icons.add),
                  text: "Mes Permissions",
                ),
              ],
            ),
            centerTitle: true,
            title: Text("Permission"),
            backgroundColor: hexToColor("#008bb2"),
          ),
          body: TabBarView(children: [
            Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(20),
                height: double.infinity,
                child: ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: <Widget>[
                      Text(
                        "Motif",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      InputTextField(
                        controller: motif,
                        textInputType: TextInputType.text,
                        onChange: (text) {},
                        onValidate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez renseigner une ville';
                          }
                        },
                      ),
                      Text(
                        "Evènement",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 5),
                              child: DropdownButton<String>(
                                hint: Text(evenement!),
                                items: values.keys.map((String key) {
                                  return DropdownMenuItem<String>(
                                    value: key,
                                    child: Text(key),
                                  );
                                }).toList(),
                                onChanged: (_) {
                                  setState(() {
                                    evenement = _;
                                    switch (_!) {
                                      case 'Activite':
                                        evnement.text = '-1';
                                        break;
                                      case 'Reunion':
                                        evnement.text = '-2';
                                        break;
                                      case 'Autre':
                                        evnement.text = '-3';
                                        break;
                                    }
                                  });
                                },
                              ),
                            ),
                          )),
                      Text(
                        "Message",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 10,
                        maxLength: 1000,
                        controller: message,
                        validator: (value) {
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Message",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    new Radius.circular(15.0))),
                            labelStyle: TextStyle(color: Colors.white)),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      Obx(() {
                        return LoadingOverlay(
                          child: MaterialButton(
                              minWidth: 60.0,
                              height: 40,
                              color: Colors.deepOrangeAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(color: Colors.white38)),
                              child: new Text('Envoyer',
                                  style: new TextStyle(
                                      fontSize: 16.0, color: Colors.white)),
                              onPressed: () => {
                                    controller.resp.addAll({
                                      'sujet': sujet.text,
                                      'motif': motif.text,
                                      'evenement': evnement.text,
                                      'message': message.text,
                                    }),
                                    sujet.text = "",
                                    motif.text = "",
                                    evnement.text = "",
                                    message.text = "",
                                    controller.addPermition(),
                                    controller.isLoading.isFalse &&
                                            controller.permissionAddResponse!
                                                    .status ==
                                                1
                                        ? Get.snackbar(
                                            'succees',
                                            controller
                                                .permissionAddResponse!.flash!,
                                            backgroundColor: Colors.teal,
                                            colorText: Colors.white,
                                            snackPosition: SnackPosition.BOTTOM)
                                        : Get.snackbar(
                                            'Erreur',
                                            controller
                                                .permissionAddResponse!.flash!,
                                            backgroundColor:
                                                Colors.orangeAccent,
                                            colorText: Colors.white,
                                            snackPosition:
                                                SnackPosition.BOTTOM),
                                  }),
                          isLoading: controller.isLoading.isTrue,
                        );
                      })
                    ])),
            Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(2),
                height: double.infinity,
                child:  Obx( () => controller.isLoading.isTrue ?
                    CircularProgressIndicator()  :
                    controller.listpermission != null ?
                ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: <Widget>[
                      DataTable(
                        dataRowHeight: 50,
                        headingRowHeight: 70,
                        showCheckboxColumn: false,
                        headingTextStyle: TextStyle(color:hexToColor("#008bb2"),fontWeight: FontWeight.bold),
                        columns: <DataColumn>[
                          DataColumn(
                            label: Text('Date'),
                          ),
                          DataColumn(
                            label: Text('Sujet'),
                          ),
                          DataColumn(
                            label: Text('Status'),
                          ),
                        ],
                        rows: controller
                            .listpermission! // Loops through dataColumnText, each iteration assigning the value to element
                            .map(
                          ((Permission _permission) => DataRow(
                            onSelectChanged: (isSelected) => {
                              setState(() {
                                print(isSelected);
                              })
                            },
                            cells: <DataCell>[
                              DataCell(Text(_permission.dateCreation!),
                                  onTap: () => print(_permission
                                      .id)), //Extracting from Map element the value
                              DataCell(Text(_permission.sujet!)),
                              _permission.state == 1
                                  ? DataCell(
                                  Container(
                                    height: 30,
                                    width: 60,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(
                                              0x07000000),
                                          blurRadius: 40,
                                          offset: Offset(
                                              0, 10),
                                        ),
                                      ],
                                  color: Colors.green,
                                ),
                                child: Padding(
                                  padding:
                                  EdgeInsets.all(
                                      1),
                                  child: Text(
                                    "Validé",
                                    style: TextStyle(
                                      color: Colors
                                          .white,
                                      fontSize: 12.3,
                                    ),
                                  ),
                                ),
                              )) :
                              _permission.state == 2 ?
                              DataCell(Container(
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
                                  color: Colors.deepOrangeAccent,
                                ),
                                child: Padding(
                                  padding:
                                  EdgeInsets.all(
                                      1),
                                  child: Text(
                                    "Refusée",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors
                                          .white,
                                    ),
                                  ),
                                ),
                              )) :
                              _permission.state == 0 ?
                              DataCell(Container(
                                height: 35,
                                width: 80,
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
                                  color: Colors.blue,
                                ),
                                child: Padding(
                                  padding:
                                  EdgeInsets.all(
                                      1),
                                  child: Text(
                                    "En attente",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors
                                          .white,
                                    ),
                                  ),
                                ),
                              )) :
                              DataCell(
                                  Container(
                                          height: 30,
                                          width: 60,
                                          alignment:
                                          Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x07000000),
                                                blurRadius: 40,
                                                offset: Offset(0, 10),
                                              ),
                                            ],
                                            color: Colors.orangeAccent,
                                          ),
                                child: Padding(
                                  padding:
                                  EdgeInsets.all(
                                      1),
                                  child: Text(
                                    "Annulée",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors
                                          .white,
                                    ),
                                  ),
                                ),
                              ))
                            ],
                          )),
                        ).toList(),
                      ),
                    ]) :
                    Container(
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
                              controller.getAllPermission();
                            },
                          )
                        ],
                      ),
                    )
                )
            ),
          ]),
        ));
  }
}
