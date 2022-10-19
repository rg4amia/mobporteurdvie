import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../widgets/components/navigation_drawer_widget.dart';
import '../../../models/resultat_final.dart';
import '../../../constants/color_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class detailBulletin extends StatefulWidget {
  detailBulletin({Key? key, this.resultatFinal}) : super(key: key);
  ResultatFinal? resultatFinal;
  @override
  _detailBulletinState createState() => _detailBulletinState();
}

class _detailBulletinState extends State<detailBulletin> {
  int navIndex = 10;

  var screenHeight, screenWidth;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
       drawer: NavigationDrawerWidget(navIndex, (int index) {
          setState(() {
            navIndex = index;
          });
        }),
        appBar: AppBar(
          title: const Text("Bulletin de Note"),
          backgroundColor: hexToColor("#008bb2"),
        ),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: hexToColor("#e0e5e8")),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x07000000),
                      blurRadius: 40,
                      offset: Offset(0, 10),
                    ),
                  ],
                  color: Colors.blue[400],
                ),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "MOYENNE OBTENUE",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.resultatFinal!.finalResultat!.moyenne
                                        .toString() + "/20",
                          style: const TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                    /* Image(
                      image: AssetImage(Assets.pdfIcon),
                    ), */
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Cliquez pour téléchargez le bulletin de notes",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      minWidth: 100.0,
                      height: 50,
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Colors.white38)),
                      child: const Icon(Icons.download, color: Colors.white),
                      onPressed: () {
                        launch(widget.resultatFinal!.finalResultat!.url!);
                      },
                    )
                  ],
                ),
              ),
             const SizedBox(
                height: 30,
              ),
            ],
          ),
        )));
  }
}

class LinkTextSpan extends TextSpan {
  LinkTextSpan({TextStyle? style, String? url, String? text})
      : super(
            style: style,
            text: text ?? url,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launch(url!);
              });
}

class CenterCircularProgressBar extends StatelessWidget {
  const CenterCircularProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class CenterText extends StatelessWidget {
  final String stringValue;

  const CenterText(this.stringValue, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        stringValue,
      ),
    );
  }
}
