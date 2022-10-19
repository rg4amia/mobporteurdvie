import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/coolstep_controller.dart';
import '../../../../widgets/components/InputTextField.dart';

class InformationJoindre extends StatelessWidget {
  InformationJoindre({Key? key}) : super(key: key);

  bool certifie = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoolStepController>(builder: (controller) {

      var nomprenom = controller.registerStudent.name! + " " + controller.registerStudent.lname!;

      return Container(
          child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: InputTextField(
                  labelText: "Je soussigné(e)",
                  editable: false,
                  textInputType: TextInputType.number,
                  initialValue: nomprenom,
                  onValidate: (value) {
                    return null;
                  })),
          Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: InputTextField(
                  labelText: "Date",
                  editable: false,
                  textInputType: TextInputType.number,
                  initialValue:
                      controller.dateToday.toString().substring(0, 10),
                  onValidate: (value) {
                    return null;
                  })),
          Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Column(
                children: [
                  controller.image != null ?
                  CircleAvatar(
                      radius: 80,
                      child: Icon(Icons.person),
                      backgroundImage: FileImage(controller.image! ))
                      :SizedBox(height: 1,),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: new Icon(Icons.photo),
                                    title: new Text('Camera'),
                                    onTap: () {
                                      controller.getImage('camera');
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: new Icon(Icons.file_upload),
                                    title: new Text('Galerie'),
                                    onTap: () {
                                      controller.getImage('galerie');
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        onSurface: Colors.grey,
                      ),
                      child: Text(
                        'Charger Photo d\'identité',
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 16),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(7),
                    child: Column(
                      children: [
                        Text(
                          'Mon temoignage de conversion*',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 6,
                          maxLength: 500,
                          initialValue:
                              controller.registerStudent.temoignageconversion,
                          onChanged: (val) {
                            controller.registerStudent.temoignageconversion = val;
                            controller.resp.addAll({'temoignage': val});
                          },
                          validator: (value) {
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Champ de saisir",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      new Radius.circular(15.0))),
                              labelStyle: TextStyle(color: Colors.white)),
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: CheckboxListTile(
                        title: Text(
                          "Je certifie que toutes les informations fournies dans ce questionnaire sont exactes et que je n'ai retenu aucune information",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 11, color: Colors.blue),
                        ),
                        activeColor: Colors.green,
                        value: certifie,
                        selected: certifie,
                        onChanged: (val) {
                          controller.stateCheckbox(val!);
                          certifie = controller.checked!;
                          if (certifie) {
                            controller.registerStudent.certifie = true;
                          } else {
                            controller.registerStudent.certifie = false;
                          }
                        },
                      )),
                  controller.checked! ?
                      SizedBox(height: 1,) :
                      Text("Veuillez certifier " , style:  TextStyle(color: Colors.deepOrangeAccent),)
                  
                ],
              ))
        ],
      ));
    });
  }
}
