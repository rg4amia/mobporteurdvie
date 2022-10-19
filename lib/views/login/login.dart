import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helpers/shared_service.dart';
import '../../../widgets/components/password.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import '../../../constants/color_constants.dart';
import '../../../models/UserResponse.dart';
import 'login_controller.dart';
import 'login_provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final key = GlobalKey();

  bool isApiCallProcess = false;

  TextEditingController email = new TextEditingController();
  TextEditingController motdepasse = new TextEditingController();

  final provider = Get.put(LoginsProvider());
  final controller = Get.put(LoginController());

  UserResponse? userResponse;

  String? _password;
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  @override
  void initState() {
    SharedService.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: ProgressHUD(
        key: key,
        // valueColor: new AlwaysStoppedAnimation<Color>(Colors.lightGreen),
        inAsyncCall: isApiCallProcess,
        child: Form(
          key: globalFormKey,
          child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/water.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: _loginUI(context)),
        ),
      ),
    ));
  }

  Widget _loginUI(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: height,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              hexToColor("#6aa9cd"),
              hexToColor("#4e80ab"),
              hexToColor("#274984")
            ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Column(
                          children: <Widget>[
                            const Image(
                                image: AssetImage('assets/logos/log_min.png'),
                                height: 80,
                                fit: BoxFit.contain),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            const Text(
                              "Bienvenue",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                            const Text(
                              "sur le portail de",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            const Text(
                              "L' Ecole de Disciple",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: height * 0.015,
                            ),
                          ],
                        ),
                        //Image.asset('assets/images/icon_app.png'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage("assets/images/water.png"),
                          colorFilter:  ColorFilter.mode(
                              Colors.black.withOpacity(0.6), BlendMode.dstATop),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding:const EdgeInsets.only(left: 25),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]!))),
                                    child: TextField(
                                      decoration: const InputDecoration(
                                          hintText: "Email *",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                          suffixIcon: Icon(Icons.person)),
                                      controller: email,
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 25),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]!))),
                                      child: PasswordField(
                                        fieldKey: _passwordFieldKey,
                                        //helperText: 'No more than 8 characters.',
                                        labelText: 'Mot de passe *',
                                        controller: motdepasse,
                                        onFieldSubmitted: (String value) {
                                          setState(() {
                                            this._password = value;
                                          });
                                        },
                                      )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Obx(() {
                              return controller.isLoading!.isTrue
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : MaterialButton(
                                      minWidth: 410.0,
                                      height: 60,
                                      color: hexToColor("#24bbf2"),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          side: const BorderSide(
                                              color: Colors.white38,
                                              width: 1.5)),
                                      child: const Text('Connexion',
                                          style:  TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.white)),
                                      onPressed: () => {
                                        controller.getLogin(
                                            email.text, motdepasse.text)
                                      },
                                    );
                            }),
                            const SizedBox(
                              height: 5,
                            ),
                            MaterialButton(
                              minWidth: 410.0,
                              height: 60,
                              color: hexToColor("#d74548"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: const BorderSide(
                                      color: Colors.white38, width: 1.5)),
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text(
                                    'Préinscription | Réinscription Session Prochaine',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.white)),
                              ),
                              onPressed: () => {Get.toNamed('/session')},
                            ),
                           const SizedBox(
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
