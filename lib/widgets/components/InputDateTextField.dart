import 'package:flutter/material.dart';

class DateTextField extends StatelessWidget {
  DateTextField(
      {Key? key,
      this.controller,
      this.iconlabel,
      this.labelText,
      this.requiredTxt,
      this.selectDate,
      this.onValidate,
      this.validator})
      : super(key: key);

  String? labelText;
  FormFieldValidator<String>? validator;
  TextEditingController? controller;
  Function? selectDate;
  String? requiredTxt;
  Icon? iconlabel;
  Function? onValidate;

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
                // focusNode: _focusNode,
                keyboardType: TextInputType.phone,
                autocorrect: false,
                controller: controller,
                onSaved: (value) {
                  //data.registrationdate = value;
                },
                onTap: () {
                  //_selectDatedeNaissance(context);
                  selectDate!(context);
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                validator: (value) {
                  return onValidate!(value);
                  /*  if (value.isEmpty || value.length < 1) {
                    return 'Veuillez renseigner votre date de naissance';
                  }
                  return null; */
                },
                decoration: InputDecoration(
                  labelText: labelText,
                  border: InputBorder.none,
                  //filled: true,
                  suffixIcon: const Icon(Icons.calendar_today),
                  labelStyle:
                      TextStyle(decorationStyle: TextDecorationStyle.solid),
                ),
              ),
            )));
  }
}
