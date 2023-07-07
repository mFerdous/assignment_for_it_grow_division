// To parse this JSON data, do
//
//     final signInResponse = signInResponseFromJson(jsonString);

import 'dart:convert';


SignInResponse signInResponseFromJson(String str) =>
    SignInResponse.fromJson(json.decode(str));

String signInResponseToJson(SignInResponse data) => json.encode(data.toJson());

class SignInResponse {
  SignInResponse({
    required this.result,
    required this.token,
  });
  bool result;
  String token;

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
        result: json["result"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "token": token,
      };
}
