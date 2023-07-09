// To parse this JSON data, do
//
//     final analyticSignalsRequest = analyticSignalsRequestFromJson(jsonString);

import 'dart:convert';

AnalyticSignalsRequest analyticSignalsRequestFromJson(String str) => AnalyticSignalsRequest.fromJson(json.decode(str));

String analyticSignalsRequestToJson(AnalyticSignalsRequest data) => json.encode(data.toJson());

class AnalyticSignalsRequest {
    AnalyticSignalsRequest({
        required this.tradingsystem,
        required this.from,
        required this.to,
        required this.pairs,
        required this.loginId,
        required this.passkey,
    });

    int tradingsystem;
    int from;
    int to;
    String pairs;
    String loginId;
    String passkey;

    factory AnalyticSignalsRequest.fromJson(Map<String, dynamic> json) => AnalyticSignalsRequest(
        tradingsystem: json["tradingsystem"],
        from: json["from"],
        to: json["to"],
        pairs: json["pairs"],
        loginId: json["loginId"],
        passkey: json["passkey"],
    );

    Map<String, dynamic> toJson() => {
        "tradingsystem": tradingsystem,
        "from": from,
        "to": to,
        "pairs": pairs,
        "loginId": loginId,
        "passkey": passkey,
    };
}
