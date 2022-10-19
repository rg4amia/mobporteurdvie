import 'package:flutter/material.dart';

class CustomRadioIndex extends StatelessWidget {
  CustomRadioIndex(
      {Key? key,
      this.index,
      this.txt,
      this.selectedIndex,
      this.changeCustomIndex,
      this.size})
      : super(key: key);

  String? txt;
  int? index;
  int? selectedIndex;
  Function? changeCustomIndex;
  double? size;

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
        style: size != null ? TextStyle(
            fontSize:size,
            color: selectedIndex == index ? Colors.cyan : Colors.grey) :
            TextStyle(
                color: selectedIndex == index ? Colors.cyan : Colors.grey)
            ,
      ),
    );
  }
}
