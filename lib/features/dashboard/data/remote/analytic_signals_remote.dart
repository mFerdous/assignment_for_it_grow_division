import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/resources/error_msg_res.dart';
import '../model/analytic_signals_request.dart';
import '../model/analytic_signals_response.dart';

abstract class AnalyticSignalsRemote {
  Future<List<AnalyticSignalsResponse>> analyticSignals(
      AnalyticSignalsRequest analyticSignalsRequest);
}

class AnalyticSignalsRemoteImpl implements AnalyticSignalsRemote {

  AnalyticSignalsRemoteImpl();
  @override
  Future<List<AnalyticSignalsResponse>> analyticSignals(
      AnalyticSignalsRequest analyticSignalsRequest) async {
        
  final baseUrl = 'https://client-api.contentdatapro.com/clientmobile/GetAnalyticSignals/${analyticSignalsRequest.loginId}';
  final tradingSystem = analyticSignalsRequest.tradingsystem;
  final pair = analyticSignalsRequest.pairs;
  final from = analyticSignalsRequest.from;
  final to = analyticSignalsRequest.to;
  final passkey = analyticSignalsRequest.passkey;

  final url = '$baseUrl?tradingsystem=$tradingSystem&pairs=$pair&from=$from&to=$to';
  
    final List<AnalyticSignalsResponse> res;

    // final headers = _headerProvider();
    final headers = {
      'passkey':passkey
    };

    final response = await http.get(Uri.parse(url), headers: headers);
    log(response.body.toString());

    if (response.statusCode == 200) {
      res = analyticSignalsResponseFromJson(response.body);
      return res;
    } else {
      throw ServerException(
        message: ErrorMsgRes.kServerError,
        statusCode: response.statusCode,
      );
    }
  }
}
