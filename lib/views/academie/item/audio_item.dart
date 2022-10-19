import 'package:flutter/material.dart';
import '/audios/audio_test.dart';
import '/constants/color_constants.dart';

class AudioItem extends StatelessWidget {
  AudioItem({Key? key, this.mediaUrl}) : super(key: key);
  final String? mediaUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/images/water.png"),
              fit: BoxFit.cover,
            ),
            border: Border.all(color: hexToColor("#e0e5e8")),
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(
                color: Color(0x07000000),
                blurRadius: 40,
                offset: Offset(0, 10),
              ),
            ],
          )),
      Container(
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
              border: Border.all(color: hexToColor("#e0e5e8")),
              borderRadius: BorderRadius.circular(35),
              color: Colors.black45)),
      Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AudioCustomItem(
            urlAudio: mediaUrl,
          )
        ],
      ))
    ]);
  }
}
