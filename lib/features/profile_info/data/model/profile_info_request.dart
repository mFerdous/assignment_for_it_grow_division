// To parse this JSON data, do
//
//     final profileInfoRequest = profileInfoRequestFromJson(jsonString);

import 'dart:convert';

ProfileInfoRequest profileInfoRequestFromJson(String str) => ProfileInfoRequest.fromJson(json.decode(str));

String profileInfoRequestToJson(ProfileInfoRequest data) => json.encode(data.toJson());

class ProfileInfoRequest {
    ProfileInfoRequest({
        required this.login,
        required this.token,
    });

    int login;
    String token;

    factory ProfileInfoRequest.fromJson(Map<String, dynamic> json) => ProfileInfoRequest(
        login: json["login"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "login": login,
        "token": token,
    };
}
