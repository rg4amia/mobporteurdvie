// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import '../../../constants/color_constants.dart';
import '../../../library/splashscreen_library.dart';

class MySplash extends StatefulWidget {
  Widget? defaultPage;
  MySplash({Key? key, this.defaultPage}) : super(key: key);
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: widget.defaultPage,
      imageBackground: const AssetImage(
        'assets/images/splash.png',
      ),
      backgroundColor: Colors.white,
      loadingText: Text(
        'Chargement en cour ...',
        style: TextStyle(color: hexToColor("#026c68")),
      ),
      loaderColor: Colors.blueAccent,
      title: const Text(""),
      loadingTextPadding: const EdgeInsets.all(0),
      styleTextUnderTheLoader: const TextStyle(color: Colors.black12),
      useLoader: true 
    );
  }
}
