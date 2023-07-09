// To parse this JSON data, do
//
//     final analyticSignalsResponse = analyticSignalsResponseFromJson(jsonString);

import 'dart:convert';

List<AnalyticSignalsResponse> analyticSignalsResponseFromJson(String str) => List<AnalyticSignalsResponse>.from(json.decode(str).map((x) => AnalyticSignalsResponse.fromJson(x)));

String analyticSignalsResponseToJson(List<AnalyticSignalsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AnalyticSignalsResponse {
    int? id;
    int? actualTime;
    String? comment;
    String? pair;
    int? cmd;
    int? tradingSystem;
    String? period;
    double? price;
    double? sl;
    double? tp;

    AnalyticSignalsResponse({
        this.id,
        this.actualTime,
        this.comment,
        this.pair,
        this.cmd,
        this.tradingSystem,
        this.period,
        this.price,
        this.sl,
        this.tp,
    });

    factory AnalyticSignalsResponse.fromJson(Map<String, dynamic> json) => AnalyticSignalsResponse(
        id: json["Id"],
        actualTime: json["ActualTime"],
        comment: json["Comment"],
        pair: json["Pair"],
        cmd: json["Cmd"],
        tradingSystem: json["TradingSystem"],
        period: json["Period"],
        price: json["Price"]?.toDouble(),
        sl: json["Sl"]?.toDouble(),
        tp: json["Tp"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "ActualTime": actualTime,
        "Comment": comment,
        "Pair": pair,
        "Cmd": cmd,
        "TradingSystem": tradingSystem,
        "Period": period,
        "Price": price,
        "Sl": sl,
        "Tp": tp,
    };
}
