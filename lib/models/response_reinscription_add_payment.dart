import 'dart:convert';

ResponseReinscriptionAddPayment responseReinscriptionAddPaymentFromJson(
        String str) =>
    ResponseReinscriptionAddPayment.fromJson(json.decode(str));

String responseReinscriptionAddPaymentToJson(
        ResponseReinscriptionAddPayment data) =>
    json.encode(data.toJson());

class ResponseReinscriptionAddPayment {
  ResponseReinscriptionAddPayment({
    this.status,
    this.message,
    this.student,
  });

  String? status;
  String? message;
  dynamic student;

  factory ResponseReinscriptionAddPayment.fromJson(Map<String, dynamic> json) =>
      ResponseReinscriptionAddPayment(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        student: json["student"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "student": student,
      };
}
