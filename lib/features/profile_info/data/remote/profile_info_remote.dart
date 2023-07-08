import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/constant/api_constants.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/header_provider/header_provider.dart';
import '../../../../core/resources/error_msg_res.dart';
import '../model/profile_info_request.dart';
import '../model/profile_info_response.dart';

abstract class ProfileInfoRemote {
  Future<ProfileInfoResponse> profileInfo(ProfileInfoRequest profileInfoRequest);
}

class ProfileInfoRemoteImpl implements ProfileInfoRemote {
  static const profileInfoEndpoint =
      ApiConstants.baseUrl + ApiConstants.profileInfoUrl;
  final HeaderProvider _headerProvider;

  ProfileInfoRemoteImpl(this._headerProvider);

  @override
  Future<ProfileInfoResponse> profileInfo(ProfileInfoRequest profileInfoRequest) async {
    ProfileInfoResponse res;

    final headers = _headerProvider();

    final response = await http.post(Uri.parse(profileInfoEndpoint),
        body: json.encode(profileInfoRequest), headers: headers);

    if (response.statusCode == 200) {
        res = profileInfoResponseFromJson(response.body);
        return res;
    } else {
      throw ServerException(
        message: ErrorMsgRes.kServerError,
        statusCode: response.statusCode,
      );
    }
  }
}
