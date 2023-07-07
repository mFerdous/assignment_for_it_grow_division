import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../../../core/constant/api_constants.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/header_provider/header_provider.dart';
import '../../../../core/resources/error_msg_res.dart';
import '../model/partner_sign_in_request.dart';

abstract class PartnerSignInRemote {
  Future<String> partnerSignIn(
      PartnerSignInRequest partnerSignInRequest);
}

class PartnerSignInRemoteImpl implements PartnerSignInRemote {
  static const partnerSignInEndpoint =
      ApiConstants.partnerBaseUrl + ApiConstants.partnerSignInUrl;
  final HeaderProvider _headerProvider;

  PartnerSignInRemoteImpl(this._headerProvider);

  @override
  Future<String> partnerSignIn(
      PartnerSignInRequest partnerSignInRequest) async {

    final headers = _headerProvider();

    final response = await http.post(Uri.parse(partnerSignInEndpoint),
        body: json.encode(partnerSignInRequest), headers: headers);
    if (response.statusCode == 200) {
      log(response.body.toString());
      final token = response.body;
      return token;
    } else {
      throw ServerException(
        message: ErrorMsgRes.kServerError,
        statusCode: response.statusCode,
      );
    }
  }
}
