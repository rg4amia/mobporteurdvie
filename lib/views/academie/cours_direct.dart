import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/Assets.dart';
import '../../../constants/Enums.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: camel_case_types
class coursDirect extends StatefulWidget {
  coursDirect({Key? key,this.urlZoom}) : super(key: key);
  var one = Get.arguments;
  String? urlZoom;

  @override
  _coursDirectState createState() => _coursDirectState();
}

class _coursDirectState extends State<coursDirect> {

  void initState() {
    super.initState();
    print(widget.urlZoom);
    var url = widget.urlZoom;
    launch(url!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("LE DIRECT"),
    backgroundColor: Colors.redAccent,
    ),
    body: SafeArea(
    child:Center(
      child : Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 100, left: 20, right: 20),
            alignment: Alignment.center,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: AssetImage(Assets.logoZoom),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Cliquez Ouvrir le lien si dessous",
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
            child: Text("Lancer la réunion",style: TextStyle(color: Colors.white,fontSize: 18),),
            onPressed: () {
              launch(widget.urlZoom!);
            },
          )
        ],
      )
    )));
  }
}
