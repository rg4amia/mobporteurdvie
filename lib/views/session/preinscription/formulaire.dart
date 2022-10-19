import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:cool_stepper/cool_stepper.dart';
import '../../../constants/color_constants.dart';
import 'coolstep/coolstep_1.dart';
import 'coolstep/coolstep_2.dart';
import 'coolstep/coolstep_3.dart';
import 'coolstep/controller/coolstep_controller.dart';
import 'coolstep/coolstep_4.dart';
import 'formulaire_controller.dart';

class FormulairePreinscription extends StatefulWidget {
  FormulairePreinscription({Key? key}) : super(key: key);

  @override
  _FormulairePreinscriptionState createState() =>
      _FormulairePreinscriptionState();
}

class _FormulairePreinscriptionState extends State<FormulairePreinscription> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isApiCallProcess = false;
  bool valid = false;
  final key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ProgressHUD(
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
        key: key,
        //valueColor: new AlwaysStoppedAnimation<Color>(Colors.lightGreen),
        child: Form(
          key: globalFormKey,
          child: Container(
              decoration: BoxDecoration(color: Colors.white12),
              child: _FormWidzard(context)),
        ),
      ),
    ));
  }
}

// ignore: non_constant_identifier_names
Widget _FormWidzard(BuildContext context) {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

  CoolStepController c = Get.put(CoolStepController());
  FormulaireController controller = Get.find();

  final List<CoolStep> steps = [
    CoolStep(
      title: 'Test d\'entrée',
      subtitle:
          "Veuillez remplir certaines des informations de base pour commencer",
      content: Form(
        key: _formKey,
        child: TestEntree(),
      ),
      validation: () {
        //print(_formKey.currentState);
        /* if (!_formKey.currentState!.validate()) {
            return "Fill form correctly";
          }
          return null;  */

        //commentaire a retier
        if (c.bapteme.length < 2 ||
            c.engagement.length < 3 ||
            c.recommandation == null) {
          Get.snackbar('Information',
              'Votre profil ne correspond pas au standard de cette école.',
              snackPosition: SnackPosition.BOTTOM,
              icon: Icon(
                Icons.dangerous,
                color: Colors.white,
                size: 34,
              ),
              backgroundColor: Colors.red[200]);
          return "Fill form correctly";
        }
        return null;
      },
    ),
    CoolStep(
      title: "Information Personnelles",
      subtitle:
          "Veuillez remplir certaines des informations de base pour commencer",
      content: Form(
        key: _formKey1,
        child: InformationPersonnelles(),
      ),
      validation: () {
        //commentaire a retier
        if (!_formKey1.currentState!.validate()) {
          return "Fill form correctly";
        }
        return null;
      },
    ),
    CoolStep(
      title: "Informations Spirituelles",
      subtitle:
          "Veuillez remplir certaines des informations de base pour commencer",
      content: InformationsSpirituelles(),
      validation: () {
        return null;
      },
    ),
    CoolStep(
      title: "Informations Annexe",
      subtitle: "Veuillez completer certaine information.",
      content: InformationJoindre(),
      validation: () {
        return null;
      },
    ),
    /*  CoolStep(
        validation: () {
          return null;
        },
        title: "Confirmation",
        subtitle: "Votre inscription c\'est bien passe",
        content: Container(
            child: Text("Votre inscription c\'est bien deroule",
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)))) */
  ];

  final stepper = CoolStepper(
    onCompleted: () {
      c.resp.addAll({
        'bapteme': c.bapteme.toString(),
        'engagement': c.engagement.toString(),
        'soussigne': c.registerStudent.name! + " " + c.registerStudent.lname!,
      });
      print(c.checked);
      if (c.image == null || c.checked == false) {
        Get.snackbar(
            'Information', 'Verifier que vous avez bien ajouter une photo.',
            snackPosition: SnackPosition.BOTTOM,
            icon: Icon(
              Icons.dangerous,
              color: Colors.white,
              size: 34,
            ),
            backgroundColor: Colors.red[200]);
        //return "Fill form correctly";
      } else {
        //Get.toNamed('/session/success',parameters: c.resp);
        Get.toNamed('/session/success');
        //controller.reinscription(c.resp, c.image!.path);
        //if(controller.inscriptionResponse!.status == 1){
        //  Get.toNamed('/session/success');
       // }
        /*Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SuccessInscription(resp: c.resp,),
          ),
        );*/
      }
    },
    steps: steps,
    config: CoolStepperConfig(
        backText: "RETOUR",
        nextText: "SUIVANT",
        stepText: "ETAPE",
        ofText: "DE",
        finalText:  "TERMINER",
        //finalText:  controller.isLoading.isFalse ? "TERMINER": "Patientez ...",
        headerColor: hexToColor("#24bbf2"),
        titleTextStyle: TextStyle(fontSize: 16.0, color: Colors.white),
        subtitleTextStyle: TextStyle(fontSize: 12.0, color: Colors.white)),
  );

  return Container(
    child: stepper,
  );
}
