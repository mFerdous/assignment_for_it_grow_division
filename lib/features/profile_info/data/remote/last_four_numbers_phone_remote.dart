import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/constant/api_constants.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/header_provider/header_provider.dart';
import '../../../../core/resources/error_msg_res.dart';
import '../model/profile_info_request.dart';

abstract class LastFourNumbersPhoneRemote {
  Future<String> lastFourNumbersPhone(
      ProfileInfoRequest lastFourNumbersPhoneRequest);
}

class LastFourNumbersPhoneRemoteImpl implements LastFourNumbersPhoneRemote {
  static const lastFourNumbersPhoneEndpoint =
      ApiConstants.baseUrl + ApiConstants.lastFourNumberPhoneUrl;
  final HeaderProvider _headerProvider;

  LastFourNumbersPhoneRemoteImpl(this._headerProvider);

  @override
  Future<String> lastFourNumbersPhone(
      ProfileInfoRequest lastFourNumbersPhoneRequest) async {

    final headers = _headerProvider();

    final response = await http.post(Uri.parse(lastFourNumbersPhoneEndpoint),
        body: json.encode(lastFourNumbersPhoneRequest), headers: headers);
    if (response.statusCode == 200) {
      final phoneNumber = response.body;
      return phoneNumber;
    } else {
      throw ServerException(
        message: ErrorMsgRes.kServerError,
        statusCode: response.statusCode,
      );
    }
  }
}
