import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../constants/Assets.dart';
import '../../../constants/Enums.dart';
import '/constants/color_constants.dart';
import 'package:url_launcher/url_launcher.dart';


class detailPaiment extends StatefulWidget {
  detailPaiment({Key? key,this.urlPdfPaiment}) : super(key: key);
  String? urlPdfPaiment;
  @override
  _detailPaimentState createState() => _detailPaimentState();
}

class _detailPaimentState extends State<detailPaiment> {

  void initState() {
    super.initState();
    print(widget.urlPdfPaiment);
    var url = widget.urlPdfPaiment;
    launch(url!);
  }
  var screenHeight,screenWidth;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text("Détail Paiement"),
          backgroundColor: hexToColor("#008bb2"),
        ),
        body: SafeArea(
            child: Center(
              child:  Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 100, left: 20, right: 20),
                    alignment: Alignment.center,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: AssetImage(Assets.pdfIcon),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Cliquez pour ouvrir le reçu de paiement",
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
                    color: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side:
                        BorderSide(color: Colors.white38)),
                    child: Text("Ouvrir",style: TextStyle(color: Colors.white,fontSize: 18),),
                    onPressed: () {
                      launch(widget.urlPdfPaiment!);
                    },
                  )
                ],
              ),
            )
        ));
  }
}

class LinkTextSpan extends TextSpan {
  LinkTextSpan({TextStyle? style, String? url, String? text})
      : super(
      style: style,
      text: text ?? url,
      recognizer: new TapGestureRecognizer()
        ..onTap = () {
          launch(url!);
        });
}

class CenterCircularProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class CenterText extends StatelessWidget {
  final String stringValue;

  CenterText(this.stringValue);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        stringValue,
      ),
    );
  }
}