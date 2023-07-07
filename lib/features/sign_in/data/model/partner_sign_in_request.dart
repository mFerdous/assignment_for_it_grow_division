// To parse this JSON data, do
//
//     final partnerSignInRequest = partnerSignInRequestFromJson(jsonString);

import 'dart:convert';

PartnerSignInRequest partnerSignInRequestFromJson(String str) => PartnerSignInRequest.fromJson(json.decode(str));

String partnerSignInRequestToJson(PartnerSignInRequest data) => json.encode(data.toJson());

class PartnerSignInRequest {
    PartnerSignInRequest({
        required this.login,
        required this.password,
    });

    int login;
    String password;

    factory PartnerSignInRequest.fromJson(Map<String, dynamic> json) => PartnerSignInRequest(
        login: json["login"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "login": login,
        "password": password,
    };
}
