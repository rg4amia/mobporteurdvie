import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/coolstep_controller.dart';
import 'data/label_step_1.dart';

// ignore: must_be_immutable
class TestEntree extends StatelessWidget {
  TestEntree({Key? key}) : super(key: key);

  // ignore: non_constant_identifier_names
  bool text_isChecked1 = false;
  // ignore: non_constant_identifier_names
  bool text_isChecked2 = false;
  // ignore: non_constant_identifier_names
  bool text_isChecked3 = false;
  // ignore: non_constant_identifier_names
  bool text_isChecked4 = false;
  // ignore: non_constant_identifier_names
  bool text_isChecked5 = false;

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoolStepController>(builder: (controller) {
      return Container(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                CheckboxListTile(
                  title: Text(
                    LabelStep1.bateme_1,
                    style: TextStyle(fontSize: 14),
                  ),
                  activeColor: Colors.green,
                  value: text_isChecked1,
                  selected: text_isChecked1,
                  onChanged: (val) {
                    controller.stateCheckbox(val!);
                    text_isChecked1 = controller.checked!;
                    if (text_isChecked1) {
                      if(!controller.bapteme.contains(1)){
                        controller.bapteme.add(1);
                      }
                    } else {
                      controller.bapteme.remove(1);
                    }

                  },
                ),
                CheckboxListTile(
                  title: Text(
                    LabelStep1.bateme_2,
                    style: TextStyle(fontSize: 14),
                  ),
                  activeColor: Colors.green,
                  value: text_isChecked2,
                  selected: text_isChecked2,
                  onChanged: (val) {
                    controller.stateCheckbox(val!);
                    text_isChecked2 = controller.checked!;
                    if (text_isChecked2) {
                      if(!controller.bapteme.contains(2)){
                        controller.bapteme.add(2);
                      }
                    } else {
                      controller.bapteme.remove(2);
                    }
                  },
                ),
                CheckboxListTile(
                  title: Text(
                    LabelStep1.engagement_1,
                    style: TextStyle(fontSize: 14),
                  ),
                  activeColor: Colors.green,
                  value: text_isChecked3,
                  selected: text_isChecked3,
                  onChanged: (val) {
                    controller.stateCheckbox(val!);
                    text_isChecked3 = controller.checked!;
                    if (text_isChecked3) {
                      if(!controller.engagement.contains(5)){
                        controller.engagement.add(5);
                      }
                    } else {
                      controller.engagement.remove(5);
                    }
                  },
                ),
                CheckboxListTile(
                  title: Text(
                    LabelStep1.engagement_2,
                    style: TextStyle(fontSize: 14),
                  ),
                  activeColor: Colors.green,
                  value: text_isChecked4,
                  selected: text_isChecked4,
                  onChanged: (val) {
                    controller.stateCheckbox(val!);
                    text_isChecked4 = controller.checked!;
                    if (text_isChecked4) {
                      if(!controller.engagement.contains(6)){
                        controller.engagement.add(6);
                      }
                    } else {
                      controller.engagement.remove(6);
                    }
                  },
                ),
                CheckboxListTile(
                  title: Text(
                    LabelStep1.engagement_3,
                    style: TextStyle(fontSize: 14),
                  ),
                  activeColor: Colors.green,
                  value: text_isChecked5,
                  selected: text_isChecked5,
                  onChanged: (val) {
                    controller.stateCheckbox(val!);
                    text_isChecked5 = controller.checked!;
                    if (text_isChecked5) {
                      if(!controller.engagement.contains(7)){
                        controller.engagement.add(7);
                      }
                    } else {
                      controller.engagement.remove(7);
                    }
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  LabelStep1.recommandation_txt,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
                //_isChecked
                Column(children: [
                  CheckboxListTile(
                    title: Text(
                      LabelStep1.recommandation,
                      style: TextStyle(fontSize: 14),
                    ),
                    activeColor: Colors.green,
                    value: _isChecked,
                    selected: _isChecked,
                    onChanged: (val) {
                      controller.stateCheckbox(val!);
                      _isChecked = controller.checked!;
                      if (_isChecked) {
                        if(!(controller.recommandation == 1)){
                          controller.recommandation = 1 ;
                        }
                      } else {
                        controller.recommandation = null;
                      }
                      print(controller.recommandation);
                    },
                  ),
                ]),
              ],
            )),
      );
    });
  }
}
