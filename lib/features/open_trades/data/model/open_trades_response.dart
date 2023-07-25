// To parse this JSON data, do
//
//     final openTradesResponse = openTradesResponseFromJson(jsonString);

import 'dart:convert';

List<OpenTradesResponse> openTradesResponseFromJson(String str) =>
    List<OpenTradesResponse>.from(
        json.decode(str).map((x) => OpenTradesResponse.fromJson(x)));

String openTradesResponseToJson(List<OpenTradesResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OpenTradesResponse {
  double? currentPrice;
  String? comment;
  int? digits;
  int? login;
  double? openPrice;
  String? openTime;
  double? profit;
  double? sl;
  double? swaps;
  String? symbol;
  double? tp;
  int? ticket;
  int? type;
  double? volume;

  OpenTradesResponse({
    this.currentPrice,
    this.comment,
    this.digits,
    this.login,
    this.openPrice,
    this.openTime,
    this.profit,
    this.sl,
    this.swaps,
    this.symbol,
    this.tp,
    this.ticket,
    this.type,
    this.volume,
  });

  factory OpenTradesResponse.fromJson(Map<String, dynamic> json) =>
      OpenTradesResponse(
        currentPrice: json["currentPrice"]?.toDouble(),
        comment: json["comment"],
        digits: json["digits"],
        login: json["login"],
        openPrice: json["openPrice"]?.toDouble(),
        openTime: json["openTime"],
        profit: json["profit"]?.toDouble(),
        sl: json["sl"]?.toDouble(),
        swaps: json["swaps"]?.toDouble(),
        symbol: json["symbol"],
        tp: json["tp"]?.toDouble(),
        ticket: json["ticket"],
        type: json["type"],
        volume: json["volume"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "currentPrice": currentPrice,
        "comment": comment,
        "digits": digits,
        "login": login,
        "openPrice": openPrice,
        "openTime": openTime,
        "profit": profit,
        "sl": sl,
        "swaps": swaps,
        "symbol": symbol,
        "tp": tp,
        "ticket": ticket,
        "type": type,
        "volume": volume,
      };
}
