import 'package:get/get.dart';
import '../../../helpers/base_url.dart';
import 'dart:async';
import 'dart:core';
import 'package:http/http.dart' as http;
import '../../../models/inscription_response.dart';

class FormulaireProvider extends GetConnect {
  InscriptionResponse? inscriptionResponse;
  Future<InscriptionResponse?> reinscription(Map<String, String> body, String filepath) async {
    print(body);

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8 ; multipart/form-data',
      'Accept': 'application/json',
    };

    var request = http.MultipartRequest('POST', Uri.parse(BaseURL.host + BaseURL.studentstore))
      ..fields.addAll(body)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('id_photo', filepath));

    http.Response response = await http.Response.fromStream(await request.send());

    try{
      if (response.statusCode == 200) {
        inscriptionResponse = inscriptionResponseFromJson(response.body);
        print(inscriptionResponse!.flash);
        return inscriptionResponse;
      }
      else {
        inscriptionResponse = inscriptionResponseFromJson(response.body);
        return inscriptionResponse;
      }
    }catch (e){
      print(e.toString());
    }
  }

}