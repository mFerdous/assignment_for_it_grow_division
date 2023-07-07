import 'dart:convert';

import 'package:http/http.dart' as _http;

import '../../../../core/constant/api_constants.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/header_provider/header_provider.dart';
import '../../../../core/resources/error_msg_res.dart';
import '../model/sign_in_request.dart';
import '../model/sign_in_response.dart';

abstract class SignInRemote {
  Future<SignInResponse> signIn(SignInRequest signInRequest);
}

class SignInRemoteImpl implements SignInRemote {
  static const signInEndpoint =
      ApiConstants.baseUrl + ApiConstants.signInUrl;
  final HeaderProvider _headerProvider;

  SignInRemoteImpl(this._headerProvider);

  @override
  Future<SignInResponse> signIn(SignInRequest signInRequest) async {
    SignInResponse res;

    final headers = _headerProvider();

    final response = await _http.post(Uri.parse(signInEndpoint),
        body: json.encode(signInRequest), headers: headers);

    if (response.statusCode == 200) {
        res = signInResponseFromJson(response.body);
        return res;
    } else {
      throw ServerException(
        message: ErrorMsgRes.kServerError,
        statusCode: response.statusCode,
      );
    }
  }
}
