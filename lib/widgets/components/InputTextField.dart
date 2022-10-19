import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  InputTextField(
      {Key? key,
      this.controller,
      this.icon,
      this.labelText,
      this.requiredTxt,
      this.onValidate,
      this.textInputType,
      this.initialValue,
      this.onChange,
      this.iconcolor,
      this.editable,
      this.onSaved})
      : super(key: key);

  final String? labelText;
  final TextEditingController? controller;
  final String? requiredTxt;
  final IconData? icon;
  final TextInputType? textInputType;
  final Color? iconcolor;
  String? initialValue = "";
  final Function? onValidate;
  final Function? onSaved;
  Function? onChange;
  bool? editable = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: new BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 5),
              child: TextFormField(
                initialValue: initialValue,
                enabled: editable,
                key: new Key(initialValue.toString()),
                keyboardType: textInputType,
                autocorrect: false,
                controller: controller,
                validator: (val) {
                  return onValidate!(val);
                },
                onSaved: (val) {
                  return onSaved!(val);
                },
                onChanged: (val) {
                  return onChange != null ? onChange!(val) : null;
                },
                decoration: InputDecoration(
                  labelText: labelText,
                  border: InputBorder.none,
                  //filled: true,
                  suffixIcon: Icon(
                    icon,
                    color: iconcolor,
                  ),
                  labelStyle:
                      TextStyle(decorationStyle: TextDecorationStyle.solid),
                ),
              ),
            )));
  }
}
