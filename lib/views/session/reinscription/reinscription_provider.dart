import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import '../../../models/response_reinscription_add_payment.dart';
import '../../../helpers/base_url.dart';
import '../../../models/response_reinscription.dart';

class ReinscriptionProvider extends GetConnect {
  ResponseReinscription? responseReinscription;
  ResponseReinscriptionAddPayment? responseReinscriptionAddPayment;

  Future<ResponseReinscription?> reinscriptionLogin(
      Map<String, dynamic> request) async {
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      http.Response response = await http.post(
          Uri.parse(BaseURL.host + BaseURL.reinscriptionLogin),
          body: jsonEncode(request),
          headers: headers);

      responseReinscription = responseReinscriptionFromJson(response.body);

      if (response.statusCode == 200) {
          return responseReinscription;
      } else if (response.statusCode == 401) {
          return responseReinscription;
        /* Get.snackbar('Reinscription', responseReinscription!.message!,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM); */
      }
    } on SocketException {} catch (e) {
      print(e);
    }
  }

  Future<ResponseReinscriptionAddPayment?> reinscriptionAddPaiement(
      Map<String, dynamic> resp, String token) async {
    String baseUrl = BaseURL.host + "/reinscription/add/paiement";

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.post(Uri.parse(baseUrl),
          headers: headers, body: jsonEncode(resp));
      if (response.statusCode == 200) {
        responseReinscriptionAddPayment =
            responseReinscriptionAddPaymentFromJson(response.body);
        return responseReinscriptionAddPayment;
      } else if (response.statusCode == 401) {
        responseReinscriptionAddPayment =
            responseReinscriptionAddPaymentFromJson(response.body);
        return responseReinscriptionAddPayment;
      }
    } on SocketException {} catch (e) {
      print(e.toString());
    }
  }
}
