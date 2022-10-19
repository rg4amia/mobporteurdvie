import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/views/session/reinscription/sucess_reinscription.dart';
import '/views/session/reinscription/reinscription_controller.dart';
import '/models/paiement_send.dart';
import '/views/cinetPay/CinetPaymentScreen.dart';
import '/widgets/components/customRadio.dart';
import 'package:uuid/uuid.dart';
import '/constants/color_constants.dart';
import '/models/post_reinscription.dart';

class ReinscriptionEtape2 extends StatefulWidget {
  ReinscriptionEtape2({Key? key}) : super(key: key);

  @override
  State<ReinscriptionEtape2> createState() => _ReinscriptionEtape2State();
}

class _ReinscriptionEtape2State extends State<ReinscriptionEtape2> {
  PostReinscription? request = Get.arguments[0];
  String token = Get.arguments[1];

  final _formKey = GlobalKey<FormState>();

  var uuid = Uuid();
  PaiementSend paiementSend = PaiementSend();
  bool _loading = true;

  Future<void> _goToPay(double amount, PaiementSend paiement) async {
    String apiKey = "6440994495c066a6b5c3118.48292011";
    int siteId = 725853;
    String notifyUrl = "https://zoe.porteursdevie.org/p/notif";
    String currency = "XOF";
    String designation = "CinetPay Paiement Porteur de Vie";
    String transId = uuid
        .v1(); //"CGYFFT8Y8J9U2"; // Mettre en place un endpoint pour générer un ID de transaction unique dans votre base de données
    String custom = uuid.v1(); //"CGYFFT8Y8J9U2";

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CinetPaymentScreen(apiKey, siteId, notifyUrl,
                amount, transId, currency, designation, custom, paiement)));
  }

  @override
  void initState() {
    print(Get.arguments);
    super.initState();
  }

  var height, width, size;

  List<String> lstpaiement = [
    'Cash à l\'administration',
    'Paiment en ligne (Mobile Money, Visa)'
  ];

  int? selectedPaiementIndex;

  void changePaiementIndex(int index) {
    selectedPaiementIndex = index;
    setState(() {
      if (index == 0) {
        request!.payment = 'cash';
      } else {
        request!.payment = 'online';
      }
    });
  }

  final controller = Get.put(ReinscriptionController());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Reinscription : Etape 2"),
        backgroundColor: hexToColor("#008bb2"),
        actions: [],
      ),
      body: Obx(() {
        return Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(20),
            child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                   const Text(
                      "Mode de paiement",
                      style: TextStyle(fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                    controller.responsereinscriptionAddPayment != null
                        ? controller.responsereinscriptionAddPayment!.status ==
                                "failed"
                            ? Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(10),
                                //color: hexToColor("#F3C7C8"),
                                decoration: BoxDecoration(
                                  color: hexToColor("#F3C7C8"),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child:  Text(
                                  controller.responsereinscriptionAddPayment!
                                      .message!,
                                  style: const TextStyle(
                                      fontSize: 12.6, color: Colors.red),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : const SizedBox(
                                height: 25,
                              )
                        : const SizedBox(
                            height: 25,
                          ),
                    Row(
                      children: [
                        Expanded(
                            child: CustomRadioIndex(
                                txt: lstpaiement[0],
                                size: 14,
                                index: 0,
                                selectedIndex: selectedPaiementIndex,
                                changeCustomIndex: () {
                                  changePaiementIndex(0);
                                })),
                       const SizedBox(
                          width: 40,
                        ),
                        Expanded(
                            child: CustomRadioIndex(
                                txt: lstpaiement[1],
                                size: 14,
                                index: 1,
                                selectedIndex: selectedPaiementIndex,
                                changeCustomIndex: () {
                                  changePaiementIndex(1);
                                })),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MaterialButton(
                        minWidth: 60.0,
                        height: 50,
                        color: const Color(0xff008bb2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.white38)),
                        child: controller.isLoading.isTrue
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text('Suivant',
                                style: new TextStyle(
                                    fontSize: 16.0, color: Colors.white)),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                          
                            Get.to(SuccessReinscription());
                             controller.reinscriptionAddPaiement(
                                request!.toJson(), token);

                            if (controller.responsereinscriptionAddPayment !=
                                null) {
                              if (controller.responsereinscriptionAddPayment!
                                      .status !=
                                  "failed") {
                                Get.to(SuccessReinscription());
                              }} 
                          }
                        }),
                    Offstage(
                      offstage: _loading,
                      child: progressWidget(),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                )));
      }),
    ));
  }

  Widget progressWidget() {
    return new Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("Veuillez patienter, initialisation du paiement",
                    textAlign: TextAlign.center),
              ),
            ],
          ),
        )
      ],
    );
  }
}
