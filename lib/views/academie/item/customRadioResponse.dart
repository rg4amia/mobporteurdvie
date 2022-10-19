import 'package:flutter/material.dart';

class CustomRadioResponse extends StatelessWidget {
  CustomRadioResponse(
      {Key? key,
      this.index,
      this.txt,
      this.selectedIndex,
      this.changeCustomIndex})
      : super(key: key);
  String? txt;
  int? index;
  int? selectedIndex;
  Function? changeCustomIndex;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => changeCustomIndex!(),
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          ),
          side: MaterialStateProperty.all(
              BorderSide(
                  color: selectedIndex == index ? Colors.lightGreen : Colors.grey[200]!)
          )
      ),
      child: Text(
        txt!,
        style: TextStyle(
            color: selectedIndex == index ? Colors.lightGreen : Colors.black),
      ),
    );
  }
}
