// To parse this JSON data, do
//
//     final signInRequest = signInRequestFromJson(jsonString);

import 'dart:convert';

SignInRequest signInRequestFromJson(String str) => SignInRequest.fromJson(json.decode(str));

String signInRequestToJson(SignInRequest data) => json.encode(data.toJson());

class SignInRequest {
    SignInRequest({
        required this.login,
        required this.password,
    });

    int login;
    String password;

    factory SignInRequest.fromJson(Map<String, dynamic> json) => SignInRequest(
        login: json["login"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "login": login,
        "password": password,
    };
}
