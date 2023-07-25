import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constant/api_constants.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/header_provider/header_provider.dart';
import '../../../../core/resources/error_msg_res.dart';
import '../model/open_trades_response.dart';

abstract class OpenTradesRemote {
  Future<List<OpenTradesResponse>> openTrades();
}

class OpenTradesRemoteImpl implements OpenTradesRemote {
  static const openTradesEndpoint =
      ApiConstants.baseUrl + ApiConstants.openTradesUrl;
  final HeaderProvider _headerProvider;

  OpenTradesRemoteImpl(this._headerProvider);

  @override
  Future<List<OpenTradesResponse>> openTrades() async {
    List<OpenTradesResponse> res;

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String userId = sharedPreferences.getString("user_id")!;
    String token = sharedPreferences.getString("access_token")!;

    var openTradesRequest = {'login': userId, 'token': token};

    final headers = _headerProvider();

    final response = await http.post(Uri.parse(openTradesEndpoint),
        body: json.encode(openTradesRequest), headers: headers);

    if (response.statusCode == 200) {
      
      res = openTradesResponseFromJson(response.body);
      return res;
    } else {
      throw ServerException(
        message: ErrorMsgRes.kServerError,
        statusCode: response.statusCode,
      );
    }
  }
}
