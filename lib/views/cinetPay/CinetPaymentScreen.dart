import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '/views/administrateur/administrateur_binding.dart';
import '/models/paiement_send.dart';
import '/views/administrateur/administrateur.dart';
import '/views/administrateur/administrateur_controller.dart';

class CinetPaymentScreen extends StatefulWidget {
  String apiKey;
  int siteId;
  String notificationUrl;
  double amount;
  String transactionId;
  String currency;
  String designation;
  String cpmCustom;
  PaiementSend paiement;

  CinetPaymentScreen(
      this.apiKey,
      this.siteId,
      this.notificationUrl,
      this.amount,
      this.transactionId,
      this.currency,
      this.designation,
      this.cpmCustom,
      this.paiement
      );

  @override
  CinetPaymentScreenState createState() => CinetPaymentScreenState();
}

class CinetPaymentScreenState extends State<CinetPaymentScreen> {

  AdministrateurDetailController mycontroller = Get.put(AdministrateurDetailController());

  //StartBillingResponse? _startBillingResponse;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: InAppWebView(
            initialFile: "assets/html/cinetpay.html",
            //initialHeaders: {},
            initialOptions: new InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                useShouldOverrideUrlLoading: true,
                useOnLoadResource: true,
              ),
            ),
            onWebViewCreated: (InAppWebViewController controller) {
              controller.addJavaScriptHandler(
                  handlerName: 'elementToSend',
                  callback: (args) {
                    return {
                      'api_key': "${widget.apiKey}",
                      'site_id': "${widget.siteId}",
                      'notification_url': "${widget.notificationUrl}",
                      'amount': "${widget.amount}",
                      'transaction_id': "${widget.transactionId}",
                      'currency': "${widget.currency}",
                      'designation': "${widget.designation}",
                      'cpmCustom': "${widget.cpmCustom}"
                    };
                  });

              controller.addJavaScriptHandler(
                  handlerName: 'success',
                  callback: (args) async {
                    // Mettre en place un endpoint pour vérifier le statut du paiement
                    // dans votre base de données après le retour et faire les traitement appropriés
                    await mycontroller.cinetpayToBd(widget.paiement.toJson());
                    
                    return showDialog(
                          barrierDismissible: false,
                        context: context,
                        builder: (context) =>
                            AlertDialog(
                                contextIn: context,
                                icon: Icons.check,
                                color: Colors.lightGreenAccent,
                                title: "Succès",
                                description: "Votre paiement a été approuvé avec succès."
                            )
                    );
              });

              controller.addJavaScriptHandler(
                  handlerName: 'error',
                  callback: (args) {
                    return showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) =>
                            AlertDialog(
                                contextIn: context,
                                icon: Icons.clear,
                                color: Colors.redAccent,
                                title: args[0],
                                description: args[1]
                            )
                    );
                  });

            },
            /*onLoadStart: (InAppWebViewController controller, String url) {
            },*/
            onProgressChanged:
                (InAppWebViewController controller, int progress) {},
            onConsoleMessage: (InAppWebViewController controller, ConsoleMessage message) {
              print("ConsoleMessage ${message.message}");
            },
          ),
        ),
      ),
    );
  }
}
// ignore: must_be_immutable
class AlertDialog extends StatelessWidget {
  String? title, description;
  IconData? icon;
  Color? color;
  BuildContext? contextIn;

  AlertDialog({Key? key, @required this.contextIn, @required this.icon, @required this.color, @required this.title, @required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(),
    );
  }

  dialogContent() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 100, bottom: 20, right: 20, left: 20),
          margin: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title!, style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700)),
              const SizedBox(height: 20.0),
              Text(description!, style: const TextStyle(fontSize: 16.0), textAlign: TextAlign.center,),
              const SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    /*Navigator.pushAndRemoveUntil(
                      contextIn!,
                      MaterialPageRoute(builder: (contextIn) => AdministrateurDetail()),
                      (Route<dynamic> route) => false,
                    );*/
                    Get.offAll(()=> const AdministrateurDetail() ,
                        routeName: '/administrateur/detail',
                        binding: AdministrateurDetailBinding()
                    );
                  },
                  child: const Text("OK"),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: color,
            radius: 50,
            child: Icon(icon, color: Colors.white, size: 80),
          ),
        )
      ],
    );
  }
}

